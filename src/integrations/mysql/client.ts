/**
 * MySQL Client - Direct Backend Connection
 * 
 * This module provides a db.query interface that connects to the backend database.
 * For complex queries that can't be handled by API endpoints.
 * 
 * NOTE: This is a transitional solution. New code should use @/lib/api directly.
 */

const API_BASE = '/api';

const db = {
  query: async (sql: string, params?: any[]): Promise<any[]> => {
    try {
      console.log('[MySQL Client] Executing query:', sql);
      console.log('[MySQL Client] Params:', params);
      
      // Get token from localStorage
      const token = localStorage.getItem('token');
      
      // For now, proxy to backend API endpoint that can execute raw SQL
      const response = await fetch(`${API_BASE}/db/query`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          ...(token && { 'Authorization': `Bearer ${token}` })
        },
        body: JSON.stringify({ sql, params })
      });
      
      if (!response.ok) {
        const error = await response.json().catch(() => ({ error: response.statusText }));
        throw new Error(`Database query failed: ${error.error || error.details || response.statusText}`);
      }
      
      const data = await response.json();
      console.log('[MySQL Client] Query result:', data);
      return data || [];
    } catch (error) {
      console.error('[MySQL Client] Error:', error);
      throw error;
    }
  },
  execute: async (sql: string, params?: any[]): Promise<any> => {
    try {
      console.log('[MySQL Client] Executing DML:', sql);
      console.log('[MySQL Client] Params:', params);
      
      const token = localStorage.getItem('token');
      
      const response = await fetch(`${API_BASE}/db/execute`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          ...(token && { 'Authorization': `Bearer ${token}` })
        },
        body: JSON.stringify({ sql, params })
      });
      
      if (!response.ok) {
        const error = await response.json().catch(() => ({ error: response.statusText }));
        throw new Error(`Database execution failed: ${error.error || error.details || response.statusText}`);
      }
      
      const data = await response.json();
      console.log('[MySQL Client] Execution result:', data);
      return data;
    } catch (error) {
      console.error('[MySQL Client] Error:', error);
      throw error;
    }
  }
};

const auth = {
  getCurrentUser: () => null,
  verifyToken: (token: string) => false,
  login: async (email: string, password: string) => {
    throw new Error('Use authApi.login from @/lib/api instead');
  },
  register: async (email: string, password: string, fullName: string) => {
    throw new Error('Use authApi.register from @/lib/api instead');
  },
  logout: () => {
    console.warn('[DEPRECATED] Use api.clearToken() from @/lib/api instead');
  },
  updatePassword: async (userId: string, newPassword: string) => {
    // Import bcrypt for password hashing
    const bcrypt = (await import('bcryptjs')).default;
    const passwordHash = await bcrypt.hash(newPassword, 10);
    
    const response = await fetch(`${API_BASE}/db/execute`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        sql: 'UPDATE users SET password_hash = ? WHERE id = ?',
        params: [passwordHash, userId]
      })
    });
    
    if (!response.ok) {
      throw new Error('Failed to update password');
    }
    
    const result = await response.json();
    return result;
  }
};

export { db, auth };
