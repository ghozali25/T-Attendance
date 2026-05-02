import mysql from 'mysql2/promise';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: path.join(__dirname, '../.env') });

async function run() {
  const connection = await mysql.createConnection({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    ssl: {
      minVersion: 'TLSv1.2',
      rejectUnauthorized: true
    },
    multipleStatements: true
  });

  console.log('Connected to database.');

  const sqlPath = path.join(__dirname, 'add_attendance_requests.sql');
  const sql = fs.readFileSync(sqlPath, 'utf8');

  console.log('Running migration...');
  await connection.query(sql);
  console.log('Migration completed successfully.');

  await connection.end();
}

run().catch(console.error);
