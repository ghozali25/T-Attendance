import express from 'express';
const router = express.Router();

// POST /api/db/query - Execute raw SQL query (for complex queries that API doesn't support)
router.post('/query', async (req, res) => {
  try {
    const { sql, params } = req.body;
    
    if (!sql) {
      return res.status(400).json({ error: 'SQL query is required' });
    }
    
    // Basic SQL injection protection - only allow SELECT statements
    const upperSql = sql.toUpperCase().trim();
    if (!upperSql.startsWith('SELECT')) {
      return res.status(403).json({ error: 'Only SELECT queries are allowed' });
    }
    
    // Execute query
    const [rows] = await req.db.query(sql, params || []);
    
    res.json(rows);
  } catch (error) {
    console.error('DB query error:', error);
    res.status(500).json({ error: 'Query failed', details: error.message });
  }
});

export default router;
