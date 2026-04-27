const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '../.env') });

const DB_HOST = process.env.DB_HOST || 'localhost';
const DB_PORT = process.env.DB_PORT || 3306;
const DB_USER = process.env.DB_USER || 'root';
const DB_PASSWORD = process.env.DB_PASSWORD || '';
const DB_NAME = process.env.DB_NAME || 't_absensi';

async function migrateFresh() {
  let connection;
  
  try {
    console.log('🔄 Starting fresh migration...');
    console.log(`📊 Database: ${DB_NAME}`);
    console.log(`🔗 Host: ${DB_HOST}:${DB_PORT}\n`);

    // 1. Connect to MySQL server (without database)
    connection = await mysql.createConnection({
      host: DB_HOST,
      port: DB_PORT,
      user: DB_USER,
      password: DB_PASSWORD,
      multipleStatements: true
    });

    console.log('✅ Connected to MySQL server');

    // 2. Drop database if exists
    console.log(`\n🗑️  Dropping database "${DB_NAME}" if exists...`);
    await connection.query(`DROP DATABASE IF EXISTS \`${DB_NAME}\``);
    console.log('✅ Database dropped');

    // 3. Create fresh database
    console.log(`\n📦 Creating fresh database "${DB_NAME}"...`);
    await connection.query(`CREATE DATABASE \`${DB_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci`);
    console.log('✅ Database created');

    // 4. Switch to the new database
    await connection.query(`USE \`${DB_NAME}\``);
    console.log('✅ Switched to database');

    // 5. Read and execute migration script
    console.log('\n📜 Executing migration script...');
    const migrationPath = path.join(__dirname, 'mysql_migration.sql');
    const migrationSQL = fs.readFileSync(migrationPath, 'utf8');

    // Execute the entire script at once (mysql2 supports multiple statements)
    await connection.query(migrationSQL);
    console.log('✅ Migration script executed');

    // 6. Seed default data (already included in migration script)
    console.log('\n🌱 Seeding default data...');
    console.log('✅ Default admin user created (admin@talenta.com / AdminPassword123!)');

    console.log('\n✨ Migration completed successfully!\n');
    console.log('📝 Default Credentials:');
    console.log('   Email: admin@talenta.com');
    console.log('   Password: AdminPassword123!');
    console.log('\n⚠️  Please change the default password after first login!\n');

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

// Run migration
migrateFresh();
