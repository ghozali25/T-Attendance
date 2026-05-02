const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '../.env') });

async function runSQL(filePath) {
    let connection;
    try {
        const fullPath = path.resolve(filePath);
        console.log(`🚀 Running SQL file: ${fullPath}`);
        
        const config = process.env.DATABASE_URL 
            ? { uri: process.env.DATABASE_URL }
            : {
                host: process.env.DB_HOST || 'localhost',
                port: process.env.DB_PORT || 4000,
                user: process.env.DB_USER,
                password: process.env.DB_PASSWORD,
                database: process.env.DB_NAME || 't_absensi',
              };

        connection = await mysql.createConnection({
            ...config,
            multipleStatements: true,
            ssl: (config.host && config.host.includes('tidbcloud.com')) || (config.uri && config.uri.includes('tidbcloud.com'))
                ? { minVersion: 'TLSv1.2', rejectUnauthorized: true }
                : undefined
        });

        const sql = fs.readFileSync(fullPath, 'utf8');
        await connection.query(sql);
        console.log('✅ SQL executed successfully');

    } catch (error) {
        console.error('❌ SQL execution failed:', error);
    } finally {
        if (connection) await connection.end();
    }
}

const file = process.argv[2];
if (!file) {
    console.error('Usage: node scripts/run-sql.js <file-path>');
    process.exit(1);
}
runSQL(file);
