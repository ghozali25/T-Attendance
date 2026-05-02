import mysql from 'mysql2/promise';
import crypto from 'crypto';

export default async function handler(req, res) {
  // Database connection pool setup inside handler for Vercel
  const pool = mysql.createPool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT || 4000,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    ssl: {
      minVersion: 'TLSv1.2',
      rejectUnauthorized: true
    },
    timezone: '+07:00'
  });

  try {
    const { method } = req;

    if (method === 'GET') {
      const { user_id, status } = req.query;
      let query = 'SELECT ar.*, p.full_name, p.department FROM attendance_requests ar LEFT JOIN profiles p ON ar.user_id = p.user_id WHERE 1=1';
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

      const [rows] = await pool.query(query, params);
      return res.status(200).json(rows);
    } 

    if (method === 'POST') {
      const { user_id, date, clock_in, clock_out, reason } = req.body;
      const id = crypto.randomUUID();
      await pool.query(
        'INSERT INTO attendance_requests (id, user_id, date, clock_in, clock_out, reason, status) VALUES (?, ?, ?, ?, ?, ?, ?)',
        [id, user_id, date, clock_in, clock_out, reason, 'pending']
      );
      return res.status(201).json({ message: 'Success', id });
    }

    return res.status(405).json({ error: 'Method not allowed' });
  } catch (error) {
    console.error('API Error:', error);
    return res.status(500).json({ error: 'Internal Server Error', message: error.message });
  } finally {
    await pool.end();
  }
}
