const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const crypto = require('crypto');

function generateSQL() {
    console.log('Generating attendance_seed.sql...');
    
    // Employee emails
    const emails = [
        'karyawan1@talenta.com',
        'karyawan2@talenta.com',
        'karyawan3@talenta.com',
        'karyawan4@talenta.com',
        'karyawan5@talenta.com'
    ];

    let sql = '-- Attendance Seed Data (Jan - May 2026)\n';
    sql += 'USE t_absensi;\n';
    sql += 'SET FOREIGN_KEY_CHECKS = 0;\n';
    sql += 'DELETE FROM attendance;\n';

    const startDate = new Date('2026-01-01');
    const endDate = new Date('2026-05-02');
    
    // Holiday dates for 2026 (partial list from migration script)
    const holidays = [
        '2026-01-01', '2026-01-12', '2026-01-26', '2026-02-15', 
        '2026-03-31', '2026-04-01', '2026-04-18', '2026-05-01'
    ];

    let count = 0;
    for (let d = new Date(startDate); d <= endDate; d.setDate(d.getDate() + 1)) {
        const dateStr = d.toISOString().split('T')[0];
        const dayOfWeek = d.getDay(); // 0 = Sun, 6 = Sat

        if (dayOfWeek === 0 || dayOfWeek === 6) continue;
        if (holidays.includes(dateStr)) continue;

        for (const email of emails) {
            if (Math.random() > 0.05) { // 95% attendance
                const id = crypto.randomUUID();
                
                // Random times
                const hourIn = 7 + (Math.random() > 0.8 ? 1 : 0); // 80% on time (7 AM), 20% late (8 AM)
                const minIn = Math.floor(Math.random() * 60);
                const clockIn = `${dateStr} ${hourIn.toString().padStart(2, '0')}:${minIn.toString().padStart(2, '0')}:00`;
                
                const hourOut = 17 + Math.floor(Math.random() * 2); // 5 PM or 6 PM
                const minOut = Math.floor(Math.random() * 60);
                const clockOut = `${dateStr} ${hourOut.toString().padStart(2, '0')}:${minOut.toString().padStart(2, '0')}:00`;

                const status = (hourIn >= 8 && minIn > 0) ? 'late' : 'present';
                const workHours = (new Date(clockOut) - new Date(clockIn)) / (1000 * 60 * 60);
                const periodMonth = dateStr.substring(0, 7);

                sql += `INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) \n`;
                sql += `SELECT '${id}', id, '${dateStr}', '${clockIn}', '${clockOut}', -6.2088, 106.8456, -6.2088, 106.8456, '${status}', ${workHours.toFixed(2)}, '${periodMonth}' FROM users WHERE email = '${email}';\n`;
                count++;
            }
        }
    }

    sql += 'SET FOREIGN_KEY_CHECKS = 1;\n';
    sql += `-- Total records: ${count}\n`;

    fs.writeFileSync('scripts/attendance_seed.sql', sql);
    console.log(`Successfully generated scripts/attendance_seed.sql with ${count} records.`);
}

generateSQL();
