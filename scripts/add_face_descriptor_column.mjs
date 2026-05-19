import mysql from 'mysql2/promise';
import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: path.join(__dirname, '../.env') });

const DB_HOST = process.env.DB_HOST || 'localhost';
const DB_PORT = process.env.DB_PORT || 4000;
const DB_USER = process.env.DB_USER || 'root';
const DB_PASSWORD = process.env.DB_PASSWORD || '';
const DB_NAME = process.env.DB_NAME || 't_absensi';

async function addFaceDescriptorColumn() {
  let connection;
  
  try {
    console.log('🔄 Adding face_descriptor column to profiles table...\n');
    console.log(`📊 Database: ${DB_NAME}`);
    console.log(`🔗 Host: ${DB_HOST}:${DB_PORT}\n`);

    connection = await mysql.createConnection({
      host: DB_HOST,
      port: DB_PORT,
      user: DB_USER,
      password: DB_PASSWORD,
      database: DB_NAME,
      multipleStatements: true,
      ssl: DB_HOST.includes('tidbcloud.com') 
        ? {
            minVersion: 'TLSv1.2',
            rejectUnauthorized: true
          }
        : undefined
    });

    console.log('✅ Connected to MySQL server');

    // Check if column already exists
    const [columns] = await connection.query(
      `SHOW COLUMNS FROM profiles WHERE Field = 'face_descriptor'`
    );

    if (columns.length > 0) {
      console.log('ℹ️  face_descriptor column already exists. Nothing to do.');
    } else {
      // Add the face_descriptor column
      await connection.query(
        `ALTER TABLE profiles ADD COLUMN face_descriptor JSON NULL AFTER avatar_url`
      );
      console.log('✅ face_descriptor column added successfully!');
    }

    // Verify
    const [verifyColumns] = await connection.query(
      `SHOW COLUMNS FROM profiles`
    );
    console.log('\n📋 Current profiles columns:');
    verifyColumns.forEach(col => {
      console.log(`   - ${col.Field}: ${col.Type} ${col.Null === 'YES' ? 'NULL' : 'NOT NULL'} ${col.Default !== null ? `DEFAULT ${col.Default}` : ''}`);
    });

    console.log('\n✨ Migration completed successfully!');

  } catch (error) {
    console.error('\n❌ Migration failed:', error.message);
    process.exit(1);
  } finally {
    if (connection) {
      await connection.end();
      console.log('🔌 Database connection closed');
    }
  }
}

addFaceDescriptorColumn();