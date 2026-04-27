import express from 'express';
import crypto from 'crypto';
const router = express.Router();

// GET /api/leave - Get leave requests
router.get('/', async (req, res) => {
  try {
    const { user_id, status } = req.query;
    
    let query = 'SELECT * FROM leave_requests WHERE 1=1';
    const params = [];
    
    if (user_id) {
      query += ' AND user_id = ?';
      params.push(user_id);
    }
    
    if (status) {
      query += ' AND status = ?';
      params.push(status);
    }
    
    query += ' ORDER BY created_at DESC';
    
    const [rows] = await req.db.query(query, params);
    res.json(rows);
  } catch (error) {
    console.error('Get leave requests error:', error);
    res.status(500).json({ error: 'Failed to fetch leave requests' });
  }
});

// POST /api/leave - Create leave request
router.post('/', async (req, res) => {
  try {
    const { user_id, start_date, end_date, leave_type, reason } = req.body;
    
    const id = crypto.randomUUID();
    
    await req.db.query(
      `INSERT INTO leave_requests (id, user_id, start_date, end_date, leave_type, reason, status) 
       VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [id, user_id, start_date, end_date, leave_type, reason, 'pending']
    );
    
    res.status(201).json({ message: 'Leave request created successfully', id });
  } catch (error) {
    console.error('Create leave request error:', error);
    res.status(500).json({ error: 'Failed to create leave request' });
  }
});

// PUT /api/leave/:id - Update leave request status
router.put('/:id', async (req, res) => {
  try {
    const { status, approved_by, rejection_reason } = req.body;
    
    await req.db.query(
      `UPDATE leave_requests SET status = ?, approved_by = ?, rejection_reason = ?, approved_at = NOW() 
       WHERE id = ?`,
      [status, approved_by, rejection_reason, req.params.id]
    );
    
    res.json({ message: 'Leave request updated successfully' });
  } catch (error) {
    console.error('Update leave request error:', error);
    res.status(500).json({ error: 'Failed to update leave request' });
  }
});

export default router;
