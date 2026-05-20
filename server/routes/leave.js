import express from 'express';
import crypto from 'crypto';
import { isAdminOrManager } from '../middleware/auth.js';
const router = express.Router();

// GET /api/leave - Get leave requests
router.get('/', async (req, res) => {
  try {
    const { user_id, status } = req.query;
    const canViewAll = isAdminOrManager(req);
    const scopedUserId = canViewAll ? user_id : req.auth.userId;
    
    let query = 'SELECT * FROM leave_requests WHERE 1=1';
    const params = [];
    
    if (scopedUserId) {
      query += ' AND user_id = ?';
      params.push(scopedUserId);
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
    const safeUserId = isAdminOrManager(req) && user_id ? user_id : req.auth.userId;
    
    const id = crypto.randomUUID();
    
    await req.db.query(
      `INSERT INTO leave_requests (id, user_id, start_date, end_date, leave_type, reason, status) 
       VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [id, safeUserId, start_date, end_date, leave_type, reason, 'pending']
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
    const canManageAll = isAdminOrManager(req);

    if (!canManageAll) {
      return res.status(403).json({ error: 'Forbidden' });
    }

    const [result] = await req.db.query(
      `UPDATE leave_requests SET status = ?, approved_by = ?, rejection_reason = ?, approved_at = NOW() 
       WHERE id = ?`,
      [status, approved_by || req.auth.userId, rejection_reason, req.params.id]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Leave request not found' });
    }
    
    res.json({ message: 'Leave request updated successfully' });
  } catch (error) {
    console.error('Update leave request error:', error);
    res.status(500).json({ error: 'Failed to update leave request' });
  }
});

export default router;
