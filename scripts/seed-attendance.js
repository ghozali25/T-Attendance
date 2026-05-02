const mysql = require('mysql2/promise');
const path = require('path');
const crypto = require('crypto');
require('dotenv').config({ path: path.join(__dirname, '../.env') });

async function seedAttendance() {
    let connection;
    try {
        console.log('🌱 Starting attendance seeding (Jan - May 2026)...');
        
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
            ssl: (config.host && config.host.includes('tidbcloud.com')) || (config.uri && config.uri.includes('tidbcloud.com'))
                ? { minVersion: 'TLSv1.2', rejectUnauthorized: true }
                : undefined
        });

        console.log('✅ Connected to database');

        // 1. Get all employees
        const [users] = await connection.query("SELECT id, email, full_name FROM users WHERE email LIKE 'karyawan%@talenta.com'");
        if (users.length === 0) {
            console.error('❌ No employees found. Please run migrate:fresh first.');
            return;
        }

        // 2. Get holidays
        const [holidays] = await connection.query("SELECT date FROM holidays");
        const holidayDates = holidays.map(h => new Date(h.date).toISOString().split('T')[0]);

        console.log(`👥 Found ${users.length} employees`);
        console.log(`📅 Found ${holidayDates.length} holidays`);

        // 3. Generate dates from 2026-01-01 to today
        const startDate = new Date('2026-01-01');
        const endDate = new Date();
        const records = [];

        for (let d = new Date(startDate); d <= endDate; d.setDate(d.getDate() + 1)) {
            const dateStr = d.toISOString().split('T')[0];
            const dayOfWeek = d.getDay(); // 0 = Sun, 6 = Sat

            // Skip weekends
            if (dayOfWeek === 0 || dayOfWeek === 6) continue;
            
            // Skip holidays
            if (holidayDates.includes(dateStr)) continue;

            // Seed each user
            for (const user of users) {
                // 90% chance to attend
                if (Math.random() > 0.1) {
                    const id = crypto.randomUUID();
                    const clockInTime = new Date(d);
                    clockInTime.setHours(7, 45 + Math.floor(Math.random() * 45), 0); // 07:45 - 08:30
                    
                    const clockOutTime = new Date(d);
                    clockOutTime.setHours(17, Math.floor(Math.random() * 60), 0); // 17:00 - 17:59

                    const status = clockInTime.getHours() >= 8 && clockInTime.getMinutes() > 0 ? 'late' : 'present';
                    const workHours = (clockOutTime - clockInTime) / (1000 * 60 * 60);
                    const periodMonth = dateStr.substring(0, 7);

                    records.push([
                        id, user.id, dateStr, clockInTime, clockOutTime, 
                        -6.2088, 106.8456, -6.2088, 106.8456, 
                        status, workHours.toFixed(2), periodMonth
                    ]);
                }
            }
        }

        console.log(`📝 Inserting ${records.length} attendance records...`);

        // Chunk insert (100 records at a time)
        const chunkSize = 100;
        for (let i = 0; i < records.length; i += chunkSize) {
            const chunk = records.slice(i, i + chunkSize);
            await connection.query(
                "INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) VALUES ?",
                [chunk]
            );
            process.stdout.write(`\r✅ Progress: ${Math.min(i + chunkSize, records.length)}/${records.length}`);
        }

        console.log('\n\n✨ Seeding completed successfully!');

    } catch (error) {
        console.error('\n❌ Seeding failed:', error);
    } finally {
        if (connection) await connection.end();
    }
}

seedAttendance();
