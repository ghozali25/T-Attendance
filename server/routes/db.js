import express from 'express';
const router = express.Router();

// POST /api/db/query - Execute raw SQL query (for complex queries that API doesn't support)
router.post('/query', async (req, res) => {
  try {
    const { sql, params } = req.body;
    
    console.log('[DB Query] SQL:', sql);
    console.log('[DB Query] Params:', params);
    
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
    
    console.log('[DB Query] Result rows:', rows?.length || 0);
    res.json(rows);
  } catch (error) {
    console.error('[DB Query] Error:', error);
    res.status(500).json({ error: 'Query failed', details: error.message });
  }
});

// POST /api/db/execute - Execute DML operations (ALTER, INSERT, UPDATE, DELETE)
router.post('/execute', async (req, res) => {
  try {
    const { sql, params } = req.body;
    
    console.log('[DB Execute] SQL:', sql);
    console.log('[DB Execute] Params:', params);
    
    if (!sql) {
      return res.status(400).json({ error: 'SQL query is required' });
    }
    
    // Only allow safe operations (no DROP, TRUNCATE, etc.)
    const upperSql = sql.toUpperCase().trim();
    const dangerousKeywords = ['DROP', 'TRUNCATE', 'DELETE DATABASE', 'DELETE SCHEMA'];
    for (const keyword of dangerousKeywords) {
      if (upperSql.includes(keyword)) {
        return res.status(403).json({ error: `Dangerous operation not allowed: ${keyword}` });
      }
    }
    
    // Execute query
    const [result] = await req.db.query(sql, params || []);
    
    console.log('[DB Execute] Success');
    res.json({ success: true, affectedRows: result.affectedRows, insertId: result.insertId });
  } catch (error) {
    console.error('[DB Execute] Error:', error);
    res.status(500).json({ error: 'Query failed', details: error.message });
  }
});

export default router;
