import express from 'express';
import crypto from 'crypto';
import { isAdminOrManager } from '../middleware/auth.js';
const router = express.Router();

// GET /api/journals - Get work journals
router.get('/', async (req, res) => {
  try {
    const { user_id, start_date, end_date, verification_status } = req.query;
    const canViewAll = isAdminOrManager(req);
    const scopedUserId = canViewAll ? user_id : req.auth.userId;
    
    let query = 'SELECT * FROM work_journals WHERE deleted_at IS NULL';
    const params = [];
    
    if (scopedUserId) {
      query += ' AND user_id = ?';
      params.push(scopedUserId);
    }
    
    if (start_date) {
      query += ' AND date >= ?';
      params.push(start_date);
    }
    
    if (end_date) {
      query += ' AND date <= ?';
      params.push(end_date);
    }
    
    if (verification_status) {
      query += ' AND verification_status = ?';
      params.push(verification_status);
    }
    
    query += ' ORDER BY date DESC, created_at DESC';
    
    const [rows] = await req.db.query(query, params);
    res.json(rows);
  } catch (error) {
    console.error('Get journals error:', error);
    res.status(500).json({ error: 'Failed to fetch journals' });
  }
});

// POST /api/journals - Create journal
router.post('/', async (req, res) => {
  try {
    const { user_id, date, title, description, obstacles, work_result, mood, verification_status } = req.body;
    const safeUserId = isAdminOrManager(req) && user_id ? user_id : req.auth.userId;
    
    const id = crypto.randomUUID();
    
    await req.db.query(
      `INSERT INTO work_journals (id, user_id, date, title, description, obstacles, work_result, mood, verification_status) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [id, safeUserId, date, title, description, obstacles, work_result, mood, verification_status || 'submitted']
    );
    
    res.status(201).json({ message: 'Journal created successfully', id });
  } catch (error) {
    console.error('Create journal error:', error);
    res.status(500).json({ error: 'Failed to create journal' });
  }
});

// PUT /api/journals/:id - Update journal
router.put('/:id', async (req, res) => {
  try {
    const { title, description, obstacles, work_result, mood, verification_status, manager_notes } = req.body;
    const canManageAll = isAdminOrManager(req);

    const sql = canManageAll
      ? `UPDATE work_journals SET title = ?, description = ?, obstacles = ?, work_result = ?, mood = ?, verification_status = ?, manager_notes = ? 
       WHERE id = ?`
      : `UPDATE work_journals SET title = ?, description = ?, obstacles = ?, work_result = ?, mood = ? 
       WHERE id = ? AND user_id = ?`;

    const sqlParams = canManageAll
      ? [title, description, obstacles, work_result, mood, verification_status, manager_notes, req.params.id]
      : [title, description, obstacles, work_result, mood, req.params.id, req.auth.userId];

    const [result] = await req.db.query(sql, sqlParams);
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Journal not found' });
    }
    
    res.json({ message: 'Journal updated successfully' });
  } catch (error) {
    console.error('Update journal error:', error);
    res.status(500).json({ error: 'Failed to update journal' });
  }
});

// DELETE /api/journals/:id - Soft delete journal
router.delete('/:id', async (req, res) => {
  try {
    const canManageAll = isAdminOrManager(req);
    const sql = canManageAll
      ? 'UPDATE work_journals SET deleted_at = NOW() WHERE id = ?'
      : 'UPDATE work_journals SET deleted_at = NOW() WHERE id = ? AND user_id = ?';
    const sqlParams = canManageAll ? [req.params.id] : [req.params.id, req.auth.userId];

    const [result] = await req.db.query(sql, sqlParams);
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Journal not found' });
    }
    
    res.json({ message: 'Journal deleted successfully' });
  } catch (error) {
    console.error('Delete journal error:', error);
    res.status(500).json({ error: 'Failed to delete journal' });
  }
});

export default router;
