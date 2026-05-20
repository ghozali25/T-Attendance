import express from 'express';
import { isAdminOrManager } from '../middleware/auth.js';
const router = express.Router();

// GET /api/profiles - Get all profiles
router.get('/', async (req, res) => {
  try {
    const { department } = req.query;
    const canViewAll = isAdminOrManager(req);
    
    let query = `
      SELECT p.*, ur.role, u.email 
      FROM profiles p 
      LEFT JOIN user_roles ur ON p.user_id = ur.user_id
      LEFT JOIN users u ON p.user_id = u.id
      WHERE 1=1
    `;
    const params = [];
    
    if (department) {
      query += ' AND p.department = ?';
      params.push(department);
    }

    if (!canViewAll) {
      query += ' AND p.user_id = ?';
      params.push(req.auth.userId);
    }
    
    query += ' ORDER BY p.created_at DESC';
    
    console.log('[Profiles API] Query:', query);
    console.log('[Profiles API] Params:', params);
    
    const [rows] = await req.db.query(query, params);
    res.json(rows);
  } catch (error) {
    console.error('Get profiles error:', error);
    res.status(500).json({ error: 'Failed to fetch profiles' });
  }
});

// GET /api/profiles/:user_id - Get single profile
router.get('/:user_id', async (req, res) => {
  try {
    if (!isAdminOrManager(req) && req.params.user_id !== req.auth.userId) {
      return res.status(403).json({ error: 'Forbidden' });
    }

    const [rows] = await req.db.query(
      `SELECT p.*, ur.role, u.email 
       FROM profiles p 
       LEFT JOIN user_roles ur ON p.user_id = ur.user_id
       LEFT JOIN users u ON p.user_id = u.id
       WHERE p.user_id = ?`,
      [req.params.user_id]
    );
    
    if (rows.length === 0) {
      return res.status(404).json({ error: 'Profile not found' });
    }
    
    res.json(rows[0]);
  } catch (error) {
    console.error('Get profile error:', error);
    res.status(500).json({ error: 'Failed to fetch profile' });
  }
});

// PUT /api/profiles/:user_id - Update profile
router.put('/:user_id', async (req, res) => {
  try {
    if (!isAdminOrManager(req) && req.params.user_id !== req.auth.userId) {
      return res.status(403).json({ error: 'Forbidden' });
    }

    const fields = req.body;
    const allowedFields = ['full_name', 'department', 'position', 'phone', 'address', 'avatar_url', 'face_descriptor'];
    
    const updateParts = [];
    const params = [];
    
    for (const field of allowedFields) {
      if (fields[field] !== undefined) {
        updateParts.push(`${field} = ?`);
        params.push(fields[field]);
      }
    }
    
    if (updateParts.length === 0) {
      return res.status(400).json({ error: 'No fields to update' });
    }
    
    params.push(req.params.user_id);
    
    const query = `UPDATE profiles SET ${updateParts.join(', ')} WHERE user_id = ?`;
    
    console.log('[Profiles API] Update Query:', query);
    
    await req.db.query(query, params);
    
    res.json({ message: 'Profile updated successfully' });
  } catch (error) {
    console.error('Update profile error:', error);
    res.status(500).json({ error: 'Failed to update profile' });
  }
});

export default router;
