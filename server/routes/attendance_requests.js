import express from 'express';
import crypto from 'crypto';
const router = express.Router();

// GET /api/attendance-requests - Get attendance requests
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
    const { user_id, date, clock_in, clock_out, reason } = req.body;
    
    const id = crypto.randomUUID();
    
    await req.db.query(
      `INSERT INTO attendance_requests (id, user_id, date, clock_in, clock_out, reason, status) 
       VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [id, user_id, date, clock_in, clock_out, reason, 'pending']
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
    
    // 3. If approved, create or update attendance record
    if (status === 'approved') {
      // Check if attendance already exists for that user and date
      const [existing] = await req.db.query(
        'SELECT id FROM attendance WHERE user_id = ? AND date = ?',
        [request.user_id, request.date]
      );
      
      if (existing && existing.length > 0) {
        // Update existing
        await req.db.query(
          `UPDATE attendance SET clock_in = ?, clock_out = ?, status = 'present', notes = ? 
           WHERE id = ?`,
          [request.clock_in, request.clock_out, request.reason, existing[0].id]
        );
      } else {
        // Create new
        const attId = crypto.randomUUID();
        await req.db.query(
          `INSERT INTO attendance (id, user_id, date, clock_in, clock_out, status, notes) 
           VALUES (?, ?, ?, ?, ?, 'present', ?)`,
          [attId, request.user_id, request.date, request.clock_in, request.clock_out, request.reason]
        );
      }
    }
    
    res.json({ message: 'Attendance request updated successfully' });
  } catch (error) {
    console.error('Update attendance request error:', error);
    res.status(500).json({ error: 'Failed to update attendance request', message: error.message });
  }
});

export default router;
