import express from 'express';
const router = express.Router();

// Get all holidays
router.get('/', async (req, res) => {
  try {
    const { year } = req.query;
    let sql = 'SELECT * FROM holidays';
    let params = [];

    if (year) {
      // In MySQL, we can extract year from date column
      sql += ' WHERE YEAR(date) = ?';
      params.push(year);
    }

    const [rows] = await req.db.query(sql, params);
    res.json(rows);
  } catch (error) {
    console.error('[Holidays API] Error:', error);
    res.status(500).json({ error: 'Failed to fetch holidays' });
  }
});

export default router;
