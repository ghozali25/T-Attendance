import express from 'express';
import crypto from 'crypto';
import { isAdminOrManager } from '../middleware/auth.js';
const router = express.Router();

// GET /api/attendance - Get attendance records
router.get('/', async (req, res) => {
  try {
    const { user_id, date, start_date, end_date, clock_in_start, clock_in_end } = req.query;
    const canViewAll = isAdminOrManager(req);
    const scopedUserId = canViewAll ? user_id : req.auth.userId;
    
    let query = 'SELECT * FROM attendance WHERE 1=1';
    const params = [];
    
    if (scopedUserId) {
      query += ' AND user_id = ?';
      params.push(scopedUserId);
    }
    
    if (date) {
      query += ' AND date = ?';
      params.push(date);
    }
    
    // Date range using date column (primary query path)
    if (start_date && end_date) {
      query += ' AND date BETWEEN ? AND ?';
      params.push(start_date, end_date);
    } else if (clock_in_start && clock_in_end) {
      // Fallback: Clock-in timestamp range if date params not provided
      query += ' AND clock_in BETWEEN ? AND ?';
      params.push(clock_in_start, clock_in_end);
    }
    
    query += ' ORDER BY date DESC, clock_in DESC';
    
    const [rows] = await req.db.query(query, params);
    res.json(rows);
  } catch (error) {
    console.error('Get attendance error:', error);
    res.status(500).json({ error: 'Failed to fetch attendance' });
  }
});

// POST /api/attendance - Create attendance record
router.post('/', async (req, res) => {
  try {
    const { user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, notes } = req.body;
    const safeUserId = isAdminOrManager(req) && user_id ? user_id : req.auth.userId;
    
    const id = crypto.randomUUID();
    
    await req.db.query(
      `INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, notes) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [id, safeUserId, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, notes]
    );
    
    res.status(201).json({ message: 'Attendance created successfully', id });
  } catch (error) {
    console.error('Create attendance error:', error);
    res.status(500).json({ error: 'Failed to create attendance' });
  }
});

// PUT /api/attendance/:id - Update attendance record
router.put('/:id', async (req, res) => {
  try {
    const { clock_out, clock_out_lat, clock_out_lng, notes } = req.body;
    const canManageAll = isAdminOrManager(req);

    const sql = canManageAll
      ? 'UPDATE attendance SET clock_out = ?, clock_out_lat = ?, clock_out_lng = ?, notes = ? WHERE id = ?'
      : 'UPDATE attendance SET clock_out = ?, clock_out_lat = ?, clock_out_lng = ?, notes = ? WHERE id = ? AND user_id = ?';
    const sqlParams = canManageAll
      ? [clock_out, clock_out_lat, clock_out_lng, notes, req.params.id]
      : [clock_out, clock_out_lat, clock_out_lng, notes, req.params.id, req.auth.userId];

    const [result] = await req.db.query(sql, sqlParams);
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Attendance not found' });
    }
    
    res.json({ message: 'Attendance updated successfully' });
  } catch (error) {
    console.error('Update attendance error:', error);
    res.status(500).json({ error: 'Failed to update attendance' });
  }
});

export default router;
