/**
 * Script to seed attendance data for Jan-Apr 2026
 * Run: node scripts/run-seed-jan-apr.mjs
 */
import fetch from 'node-fetch';

const API_BASE = 'http://localhost:3001/api';

async function query(sql, params = []) {
    const res = await fetch(`${API_BASE}/db/query`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ sql, params })
    });
    if (!res.ok) {
        const err = await res.json().catch(() => ({ error: res.statusText }));
        throw new Error(`Query failed: ${err.error || err.details || res.statusText}`);
    }
    return res.json();
}

async function execute(sql, params = []) {
    const res = await fetch(`${API_BASE}/db/execute`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ sql, params })
    });
    if (!res.ok) {
        const err = await res.json().catch(() => ({ error: res.statusText }));
        throw new Error(`Execute failed: ${err.error || err.details || res.statusText}`);
    }
    return res.json();
}

async function seedMonth(year, month, employees) {
    const monthStr = `${year}-${String(month).padStart(2, '0')}`;
    const daysInMonth = new Date(year, month, 0).getDate();
    let inserted = 0;

    for (let day = 1; day <= daysInMonth; day++) {
        const date = new Date(year, month - 1, day);
        const dow = date.getDay(); // 0=Sunday, 6=Saturday
        
        // Skip weekends
        if (dow === 0 || dow === 6) continue;

        const dateStr = `${year}-${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}`;
        
        // Check if records already exist for this date
        const existing = await query(
            'SELECT COUNT(*) as count FROM attendance WHERE date = ?',
            [dateStr]
        );
        if (existing[0]?.count > 0) {
            console.log(`  [SKIP] ${dateStr} - already has ${existing[0].count} records`);
            continue;
        }

        // Employee 1: 80/20 on time/late
        const emp1Status = Math.random() < 0.2 ? 'late' : 'present';
        const emp1H = emp1Status === 'late' ? 8 + Math.floor(Math.random() * 2) : 7;
        const emp1M = Math.floor(Math.random() * 30);
        const emp1In = `${dateStr} ${String(emp1H).padStart(2,'0')}:${String(emp1M).padStart(2,'0')}:00`;
        const emp1Out = `${dateStr} ${String(emp1H + 8).padStart(2,'0')}:${String(emp1M).padStart(2,'0')}:00`;

        // Employee 2: 50/50
        const emp2Status = Math.random() < 0.5 ? 'late' : 'present';
        const emp2H = emp2Status === 'late' ? 8 + Math.floor(Math.random() * 2) : 7;
        const emp2M = Math.floor(Math.random() * 30);
        const emp2In = `${dateStr} ${String(emp2H).padStart(2,'0')}:${String(emp2M).padStart(2,'0')}:00`;
        const emp2Out = `${dateStr} ${String(emp2H + 8).padStart(2,'0')}:${String(emp2M).padStart(2,'0')}:00`;

        // Employee 3: 90/10
        const emp3Status = Math.random() < 0.1 ? 'late' : 'present';
        const emp3H = emp3Status === 'late' ? 8 : 7;
        const emp3M = emp3Status === 'late' ? Math.floor(Math.random() * 55) : 25 + Math.floor(Math.random() * 35);
        const emp3In = `${dateStr} ${String(emp3H).padStart(2,'0')}:${String(emp3M).padStart(2,'0')}:00`;
        const emp3Out = `${dateStr} ${String(emp3H + 8).padStart(2,'0')}:${String(emp3M).padStart(2,'0')}:00`;

        // Employee 4: 95/5
        const emp4Status = Math.random() < 0.05 ? 'late' : 'present';
        const emp4H = emp4Status === 'late' ? 8 : 7;
        const emp4M = emp4Status === 'late' ? 10 + Math.floor(Math.random() * 50) : 20 + Math.floor(Math.random() * 40);
        const emp4In = `${dateStr} ${String(emp4H).padStart(2,'0')}:${String(emp4M).padStart(2,'0')}:00`;
        const emp4Out = `${dateStr} ${String(emp4H + 8).padStart(2,'0')}:${String(emp4M).padStart(2,'0')}:00`;

        // Employee 5: 70/30
        const emp5Status = Math.random() < 0.3 ? 'late' : 'present';
        const emp5H = emp5Status === 'late' ? 8 + Math.floor(Math.random() * 2) : 7;
        const emp5M = Math.floor(Math.random() * 30);
        const emp5In = `${dateStr} ${String(emp5H).padStart(2,'0')}:${String(emp5M).padStart(2,'0')}:00`;
        const emp5Out = `${dateStr} ${String(emp5H + 8).padStart(2,'0')}:${String(emp5M).padStart(2,'0')}:00`;

        const records = [
            { uid: employees[0], clockIn: emp1In, clockOut: emp1Out, status: emp1Status },
            { uid: employees[1], clockIn: emp2In, clockOut: emp2Out, status: emp2Status },
            { uid: employees[2], clockIn: emp3In, clockOut: emp3Out, status: emp3Status },
            { uid: employees[3], clockIn: emp4In, clockOut: emp4Out, status: emp4Status },
            { uid: employees[4], clockIn: emp5In, clockOut: emp5Out, status: emp5Status },
        ];

        for (const rec of records) {
            const workHours = 8;
            await execute(
                `INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
                 VALUES (UUID(), ?, ?, ?, ?, -6.2 + RAND()*0.01, 106.8 + RAND()*0.01, -6.2 + RAND()*0.01, 106.8 + RAND()*0.01, ?, ?, ?)`,
                [rec.uid, dateStr, rec.clockIn, rec.clockOut, rec.status, workHours, monthStr]
            );
            inserted++;
        }
        console.log(`  [OK] ${dateStr} - inserted ${records.length} records`);
    }
    return inserted > 0;
}

async function main() {
    console.log('=== SEED ATTENDANCE JAN-APR 2026 ===\n');

    // Get employee IDs
    const users = await query(
        "SELECT id, email FROM users WHERE email LIKE 'karyawan%@talenta.com' ORDER BY email"
    );
    
    if (!users || users.length === 0) {
        console.log('ERROR: No employee users found in database.');
        console.log('Make sure you have run the initial migration first.');
        process.exit(1);
    }

    const employees = users.map(u => u.id);
    console.log(`Found ${employees.length} employees:\n${users.map(u => `  ${u.email}`).join('\n')}\n`);

    // Check existing data
    const existingCount = await query(
        "SELECT period_month, COUNT(*) as count FROM attendance WHERE period_month IN ('2026-01','2026-02','2026-03','2026-04') GROUP BY period_month ORDER BY period_month"
    );
    console.log('Existing data before seeding:');
    if (existingCount.length === 0) {
        console.log('  No data for Jan-Apr 2026');
    } else {
        existingCount.forEach(r => console.log(`  ${r.period_month}: ${r.count} records`));
    }

    // Also check existing leaves
    const existingLeaves = await query(
        "SELECT start_date FROM leave_requests WHERE start_date >= '2026-01-01' AND start_date <= '2026-04-30'"
    );
    if (existingLeaves.length === 0) {
        console.log('\nSeeding leave requests...');
        // Employee 2: leave Jan 26-28
        await execute(
            `INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status) 
             VALUES (UUID(), ?, 'Cuti Tahunan', '2026-01-26', '2026-01-28', 'Liburan keluarga', 'approved')`,
            [employees[1]]
        );
        console.log('  [OK] Leave: Employee 2 - 2026-01-26 to 2026-01-28');

        // Employee 5: sick Feb 16-17
        await execute(
            `INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status) 
             VALUES (UUID(), ?, 'Sakit', '2026-02-16', '2026-02-17', 'Demam tinggi', 'approved')`,
            [employees[4]]
        );
        console.log('  [OK] Leave: Employee 5 - 2026-02-16 to 2026-02-17');

        // Employee 3: leave Mar 9-13
        await execute(
            `INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status) 
             VALUES (UUID(), ?, 'Cuti Tahunan', '2026-03-09', '2026-03-13', 'Liburan', 'approved')`,
            [employees[2]]
        );
        console.log('  [OK] Leave: Employee 3 - 2026-03-09 to 2026-03-13');

        // Employee 4: izin Apr 13-14
        await execute(
            `INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status) 
             VALUES (UUID(), ?, 'Izin', '2026-04-13', '2026-04-14', 'Urusan keluarga', 'approved')`,
            [employees[3]]
        );
        console.log('  [OK] Leave: Employee 4 - 2026-04-13 to 2026-04-14');
    } else {
        console.log(`\nLeaves already seeded: ${existingLeaves.length}`);
    }

    // Generate attendance for each month
    const months = [
        { year: 2026, month: 1, name: 'Januari' },
        { year: 2026, month: 2, name: 'Februari' },
        { year: 2026, month: 3, name: 'Maret' },
        { year: 2026, month: 4, name: 'April' },
    ];

    for (const m of months) {
        console.log(`\n--- ${m.name} ${m.year} ---`);
        const result = await seedMonth(m.year, m.month, employees);
        if (!result) {
            console.log(`  No new records inserted for ${m.name}`);
        }
    }

    // Verify results
    console.log('\n=== VERIFICATION ===');
    const finalCount = await query(
        "SELECT period_month, COUNT(*) as count FROM attendance WHERE period_month IN ('2026-01','2026-02','2026-03','2026-04','2026-05') GROUP BY period_month ORDER BY period_month"
    );
    const total = finalCount.reduce((sum, r) => sum + r.count, 0);
    console.log('Final record counts:');
    finalCount.forEach(r => console.log(`  ${r.period_month}: ${r.count} records`));
    console.log(`\nTotal attendance records: ${total}`);

    console.log('\n=== DONE ===');
}

main().catch(err => {
    console.error('FATAL:', err);
    process.exit(1);
});