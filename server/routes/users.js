import express from 'express';
import bcrypt from 'bcryptjs';
import crypto from 'crypto';
const router = express.Router();

// GET /api/users - Get all users
router.get('/', async (req, res) => {
  try {
    const { role } = req.query;
    
    let query = `
      SELECT u.id, u.email, u.full_name, u.created_at, ur.role, p.department, p.position 
      FROM users u 
      LEFT JOIN user_roles ur ON u.id = ur.user_id
      LEFT JOIN profiles p ON u.id = p.user_id
      WHERE 1=1
    `;
    const params = [];
    
    if (role) {
      query += ' AND ur.role = ?';
      params.push(role);
    }
    
    query += ' ORDER BY u.created_at DESC';
    
    const [rows] = await req.db.query(query, params);
    res.json(rows);
  } catch (error) {
    console.error('Get users error:', error);
    res.status(500).json({ error: 'Failed to fetch users' });
  }
});

// POST /api/users - Create user
router.post('/', async (req, res) => {
  try {
    const { email, password, full_name, role, department, position } = req.body;
    
    // Check if user exists
    const [existing] = await req.db.query(
      'SELECT id FROM users WHERE email = ?',
      [email]
    );
    
    if (existing && existing.length > 0) {
      return res.status(400).json({ error: 'Email already exists' });
    }
    
    // Hash password
    const password_hash = await bcrypt.hash(password, 10);
    
    // Generate UUID
    const userId = crypto.randomUUID();
    
    // Insert user
    await req.db.query(
      'INSERT INTO users (id, email, full_name, password_hash) VALUES (?, ?, ?, ?)',
      [userId, email, full_name, password_hash]
    );
    
    // Insert role
    await req.db.query(
      'INSERT INTO user_roles (user_id, role) VALUES (?, ?)',
      [userId, role || 'employee']
    );
    
    // Insert profile
    await req.db.query(
      'INSERT INTO profiles (user_id, full_name, email, department, position) VALUES (?, ?, ?, ?, ?)',
      [userId, full_name, email, department || null, position || null]
    );
    
    res.status(201).json({ message: 'User created successfully', userId });
  } catch (error) {
    console.error('Create user error:', error);
    res.status(500).json({ error: 'Failed to create user' });
  }
});

// PUT /api/users/:id - Update user
router.put('/:id', async (req, res) => {
  try {
    const { full_name, role, department, position } = req.body;
    
    // Update user
    await req.db.query(
      'UPDATE users SET full_name = ? WHERE id = ?',
      [full_name, req.params.id]
    );
    
    // Update role if provided
    if (role) {
      await req.db.query(
        'UPDATE user_roles SET role = ? WHERE user_id = ?',
        [role, req.params.id]
      );
    }
    
    // Update profile
    await req.db.query(
      'UPDATE profiles SET full_name = ?, department = ?, position = ? WHERE user_id = ?',
      [full_name, department, position, req.params.id]
    );
    
    res.json({ message: 'User updated successfully' });
  } catch (error) {
    console.error('Update user error:', error);
    res.status(500).json({ error: 'Failed to update user' });
  }
});

// PUT /api/users/:id/password - Update password
router.put('/:id/password', async (req, res) => {
  try {
    const { password } = req.body;
    
    const password_hash = await bcrypt.hash(password, 10);
    
    await req.db.query(
      'UPDATE users SET password_hash = ? WHERE id = ?',
      [password_hash, req.params.id]
    );
    
    res.json({ message: 'Password updated successfully' });
  } catch (error) {
    console.error('Update password error:', error);
    res.status(500).json({ error: 'Failed to update password' });
  }
});

export default router;
