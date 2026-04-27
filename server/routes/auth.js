import express from 'express';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import crypto from 'crypto';
const router = express.Router();

// POST /api/auth/login
router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    console.log('Login attempt for email:', email);

    if (!email || !password) {
      return res.status(400).json({ error: 'Email and password are required' });
    }

    // Get user from database
    const [users] = await req.db.query(
      'SELECT id, email, full_name, password_hash FROM users WHERE email = ?',
      [email]
    );

    console.log('Users found:', users ? users.length : 0);

    if (!users || users.length === 0) {
      return res.status(401).json({ error: 'Invalid credentials - user not found' });
    }

    const user = users[0];
    console.log('User found:', user.email);

    // Verify password
    const isValidPassword = await bcrypt.compare(password, user.password_hash);
    console.log('Password valid:', isValidPassword);
    
    if (!isValidPassword) {
      return res.status(401).json({ error: 'Invalid credentials - wrong password' });
    }

    // Get user role
    const [roles] = await req.db.query(
      'SELECT role FROM user_roles WHERE user_id = ?',
      [user.id]
    );

    const role = roles && roles.length > 0 ? roles[0].role : 'employee';

    // Get profile
    const [profiles] = await req.db.query(
      'SELECT * FROM profiles WHERE user_id = ?',
      [user.id]
    );

    const profile = profiles && profiles.length > 0 ? profiles[0] : null;

    // Generate JWT token
    const token = jwt.sign(
      { userId: user.id, email: user.email, role },
      process.env.JWT_SECRET || 'your-secret-key',
      { expiresIn: '24h' }
    );

    res.json({
      token,
      user: {
        id: user.id,
        email: user.email,
        full_name: user.full_name,
        role,
        profile
      }
    });
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({ error: 'Login failed' });
  }
});

// GET /api/auth/me - Get current user with role
router.get('/me', async (req, res) => {
  try {
    const token = req.headers.authorization?.replace('Bearer ', '');
    
    if (!token) {
      return res.status(401).json({ error: 'No token provided' });
    }

    // Verify token
    const decoded = jwt.verify(token, process.env.JWT_SECRET || 'your-secret-key');
    
    // Get user with role
    const [users] = await req.db.query(
      'SELECT u.id, u.email, u.full_name, ur.role FROM users u LEFT JOIN user_roles ur ON u.id = ur.user_id WHERE u.id = ?',
      [decoded.userId]
    );

    if (!users || users.length === 0) {
      return res.status(404).json({ error: 'User not found' });
    }

    const user = users[0];
    
    // If no role exists, create default employee role
    if (!user.role) {
      await req.db.query(
        'INSERT INTO user_roles (user_id, role) VALUES (?, ?)',
        [user.id, 'employee']
      );
      user.role = 'employee';
    }
    
    res.json({
      id: user.id,
      email: user.email,
      full_name: user.full_name,
      role: user.role || 'employee'
    });
  } catch (error) {
    console.error('Get current user error:', error);
    res.status(500).json({ error: 'Failed to get user' });
  }
});

// GET /api/auth/check-db - Check database connection and user roles
router.get('/check-db', async (req, res) => {
  try {
    // Check database connection
    const [result] = await req.db.query('SELECT 1 as status');
    
    // Check user_roles table
    const [roles] = await req.db.query('SELECT COUNT(*) as count FROM user_roles');
    
    // Check users table
    const [users] = await req.db.query('SELECT COUNT(*) as count FROM users');
    
    // Sample user with role
    const [sampleUser] = await req.db.query(
      'SELECT u.id, u.email, ur.role FROM users u LEFT JOIN user_roles ur ON u.id = ur.user_id LIMIT 1'
    );
    
    res.json({
      db: result[0].status === 1 ? 'connected' : 'disconnected',
      user_roles_count: roles[0].count,
      users_count: users[0].count,
      sample_user: sampleUser[0] || null
    });
  } catch (error) {
    console.error('Check DB error:', error);
    res.status(500).json({ error: 'Database check failed', details: error.message });
  }
});

// POST /api/auth/register
router.post('/register', async (req, res) => {
  try {
    const { email, password, full_name, department, position } = req.body;

    if (!email || !password) {
      return res.status(400).json({ error: 'Email and password are required' });
    }

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

    // Insert role (default: employee)
    await req.db.query(
      'INSERT INTO user_roles (user_id, role) VALUES (?, ?)',
      [userId, 'employee']
    );

    // Insert profile
    await req.db.query(
      'INSERT INTO profiles (user_id, full_name, email, department, position) VALUES (?, ?, ?, ?, ?)',
      [userId, full_name, email, department || null, position || null]
    );

    res.status(201).json({ message: 'User created successfully', userId });
  } catch (error) {
    console.error('Register error:', error);
    res.status(500).json({ error: 'Registration failed' });
  }
});

export default router;
