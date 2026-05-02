import express from 'express';
import crypto from 'crypto';
const router = express.Router();

// GET /api/attendance-requests - Get attendance requests
router.get('/stats', async (req, res) => {
  try {
    const { user_id } = req.query;
    let query = 'SELECT status, COUNT(*) as count FROM attendance_requests';
    const params = [];

    if (user_id) {
      query += ' WHERE user_id = ?';
      params.push(user_id);
    }
    
    query += ' GROUP BY status';
    const [rows] = await req.db.query(query, params);
    res.json(rows);
  } catch (error) {
    console.error('Fetch stats error:', error);
    res.status(500).json({ error: 'Failed to fetch statistics' });
  }
});

router.get('/', async (req, res) => {
  try {
    const { user_id, status } = req.query;
    
    let query = `
      SELECT ar.*, p.full_name, p.department 
      FROM attendance_requests ar
      LEFT JOIN profiles p ON ar.user_id = p.user_id
      WHERE 1=1
    `;
    const params = [];
    
    if (user_id) {
      query += ' AND ar.user_id = ?';
      params.push(user_id);
    }
    
    if (status) {
      query += ' AND ar.status = ?';
      params.push(status);
    }
    
    query += ' ORDER BY ar.created_at DESC';
    
    console.log('[AttendanceRequests API] Fetching with query:', query);
    console.log('[AttendanceRequests API] Params:', params);
    
    const [rows] = await req.db.query(query, params);
    res.json(rows);
  } catch (error) {
    console.error('Get attendance requests error:', error);
    res.status(500).json({ error: 'Failed to fetch attendance requests', message: error.message });
  }
});

// POST /api/attendance-requests - Create attendance request
router.post('/', async (req, res) => {
  try {
    const { user_id, date, clock_in, clock_out, reason, attachment_url } = req.body;
    const id = crypto.randomUUID();
    
    await req.db.query(
      'INSERT INTO attendance_requests (id, user_id, date, clock_in, clock_out, reason, attachment_url, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [id, user_id, date, clock_in, clock_out, reason, attachment_url || null, 'pending']
    );
    
    res.status(201).json({ message: 'Attendance request created successfully', id });
  } catch (error) {
    console.error('Create attendance request error:', error);
    res.status(500).json({ error: 'Failed to create attendance request', message: error.message });
  }
});

// PUT /api/attendance-requests/:id - Update attendance request status
router.put('/:id', async (req, res) => {
  try {
    const { status, approved_by, rejection_reason } = req.body;
    
    // 1. Get the request details first
    const [requests] = await req.db.query(
      'SELECT * FROM attendance_requests WHERE id = ?',
      [req.params.id]
    );
    
    if (!requests || requests.length === 0) {
      return res.status(404).json({ error: 'Request not found' });
    }
    
    const request = requests[0];
    
    // 2. Update the request status
    await req.db.query(
      `UPDATE attendance_requests SET status = ?, approved_by = ?, rejection_reason = ?, approved_at = NOW() 
       WHERE id = ?`,
      [status, approved_by, rejection_reason, req.params.id]
    );
    
    // 3. If approved, sync to attendance table
    if (status === 'approved') {
      // Calculate work hours
      let workHours = 0;
      if (request.clock_in && request.clock_out) {
        const inTime = new Date(request.clock_in);
        const outTime = new Date(request.clock_out);
        workHours = (outTime.getTime() - inTime.getTime()) / (1000 * 60 * 60);
      }

      const attendanceId = crypto.randomUUID();
      // Format date to YYYY-MM for period_month
      const dateObj = new Date(request.date);
      const periodMonth = `${dateObj.getFullYear()}-${String(dateObj.getMonth() + 1).padStart(2, '0')}`;
      
      await req.db.query(
        `INSERT INTO attendance (id, user_id, date, clock_in, clock_out, work_hours, period_month, status, notes) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
         ON DUPLICATE KEY UPDATE 
         clock_in = VALUES(clock_in), 
         clock_out = VALUES(clock_out), 
         work_hours = VALUES(work_hours), 
         status = 'present',
         notes = VALUES(notes)`,
        [
          attendanceId, 
          request.user_id, 
          request.date, 
          request.clock_in, 
          request.clock_out, 
          workHours, 
          periodMonth, 
          'present', 
          `Approved request: ${request.reason}`
        ]
      );
    }

    res.json({ message: 'Attendance request updated successfully' });
  } catch (error) {
    console.error('Update attendance request error:', error);
    res.status(500).json({ error: 'Failed to update attendance request', message: error.message });
  }
});

export default router;
