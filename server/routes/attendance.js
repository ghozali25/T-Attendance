import express from 'express';
import crypto from 'crypto';
const router = express.Router();

// GET /api/attendance - Get attendance records
router.get('/', async (req, res) => {
  try {
    const { user_id, date, start_date, end_date, clock_in_start, clock_in_end } = req.query;
    
    let query = 'SELECT * FROM attendance WHERE 1=1';
    const params = [];
    
    if (user_id) {
      query += ' AND user_id = ?';
      params.push(user_id);
    }
    
    if (date) {
      query += ' AND date = ?';
      params.push(date);
    }
    
    // Date range using date column
    if (start_date && end_date) {
      query += ' AND date BETWEEN ? AND ?';
      params.push(start_date, end_date);
    }
    
    // Clock-in timestamp range
    if (clock_in_start && clock_in_end) {
      query += ' AND clock_in BETWEEN ? AND ?';
      params.push(clock_in_start, clock_in_end);
    }
    
    // Support both start_date/end_date for clock_in range as well
    if (start_date && end_date && !date) {
      // Also check clock_in range for backward compatibility
      query += ' OR (clock_in BETWEEN ? AND ?)';
      params.push(start_date, end_date);
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
    const { user_id, date, clock_in, clock_out, clock_in_location, clock_out_location, status, notes } = req.body;
    
    const id = crypto.randomUUID();
    
    await req.db.query(
      `INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_location, clock_out_location, status, notes) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [id, user_id, date, clock_in, clock_out, clock_in_location, clock_out_location, status, notes]
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
    const { clock_out, clock_out_location, notes } = req.body;
    
    await req.db.query(
      'UPDATE attendance SET clock_out = ?, clock_out_location = ?, notes = ? WHERE id = ?',
      [clock_out, clock_out_location, notes, req.params.id]
    );
    
    res.json({ message: 'Attendance updated successfully' });
  } catch (error) {
    console.error('Update attendance error:', error);
    res.status(500).json({ error: 'Failed to update attendance' });
  }
});

export default router;
