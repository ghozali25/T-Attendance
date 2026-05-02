import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

// Import Routes
import authRoutes from './routes/auth.js';
import attendanceRoutes from './routes/attendance.js';
import profilesRoutes from './routes/profiles.js';
import journalsRoutes from './routes/journals.js';
import leaveRoutes from './routes/leave.js';
import usersRoutes from './routes/users.js';
import dbRoutes from './routes/db.js';
import holidayRoutes from './routes/holidays.js';
import attendanceRequestRoutes from './routes/attendance_requests.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Load environment variables
dotenv.config({ path: join(__dirname, '../.env') });

const app = express();
const PORT = process.env.API_PORT || 3001;

// Debug: Log environment variables
console.log('Environment variables loaded:');
console.log('DB_HOST:', process.env.DB_HOST);
console.log('DB_NAME:', process.env.DB_NAME);
console.log('DB_USER:', process.env.DB_USER);

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Database connection pool
const poolConfig = process.env.DATABASE_URL 
  ? {
      uri: process.env.DATABASE_URL,
      ssl: {
        minVersion: 'TLSv1.2',
        rejectUnauthorized: true
      }
    }
  : {
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 't_absensi',
      ssl: process.env.DB_HOST && process.env.DB_HOST.includes('tidbcloud.com') 
        ? {
            minVersion: 'TLSv1.2',
            rejectUnauthorized: true
          }
        : undefined
    };

const pool = mysql.createPool({
  ...poolConfig,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  timezone: '+07:00'
});

// Make pool available to routes
app.use((req, res, next) => {
  req.db = pool;
  next();
});

// API Routes
app.use('/api/auth', authRoutes);
app.use('/api/attendance', attendanceRoutes);
app.use('/api/attendance-requests', attendanceRequestRoutes);
app.use('/api/profiles', profilesRoutes);
app.use('/api/journals', journalsRoutes);
app.use('/api/leave', leaveRoutes);
app.use('/api/users', usersRoutes);
app.use('/api/db', dbRoutes);
app.use('/api/holidays', holidayRoutes);

// Health check
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', message: 'API server is running' });
});

// Error handling
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong!', message: err.message });
});

// Start server (only if not on Vercel)
if (process.env.NODE_ENV !== 'production' || !process.env.VERCEL) {
  app.listen(PORT, () => {
    console.log(`API Server running on http://localhost:${PORT}`);
    console.log(`Database: ${process.env.DB_NAME}`);
  });
}

export default app;
