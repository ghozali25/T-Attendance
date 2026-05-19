import express from 'express';
const router = express.Router();

/**
 * POST /api/seed - Seed attendance data for Jan-Apr 2026
 * Call this endpoint from browser to populate production database
 */
router.post('/', async (req, res) => {
    try {
        const { year, month } = req.query;
        
        // If specific year/month provided, only seed that month
        if (year && month) {
            const result = await seedMonth(parseInt(year), parseInt(month), req.db);
            return res.json({ 
                success: true, 
                message: `Seeded ${result.count} records for ${year}-${month}`,
                ...result 
            });
        }
        
        // Check existing data
        const [existing] = await req.db.query(
            "SELECT period_month, COUNT(*) as count FROM attendance WHERE period_month IN ('2026-01','2026-02','2026-03','2026-04') GROUP BY period_month ORDER BY period_month"
        );
        
        const results = [];
        
        // Seed each month
        for (let m = 1; m <= 4; m++) {
            const result = await seedMonth(2026, m, req.db);
            results.push(result);
        }
        
        // Seed leave requests
        await seedLeaves(req.db);
        
        // Final count
        const [finalCount] = await req.db.query(
            "SELECT period_month, COUNT(*) as count FROM attendance WHERE period_month IN ('2026-01','2026-02','2026-03','2026-04','2026-05') GROUP BY period_month ORDER BY period_month"
        );
        
        res.json({
            success: true,
            message: 'Seed data for Jan-Apr 2026 completed successfully',
            existing_before: existing,
            results: results,
            final_counts: finalCount
        });
    } catch (error) {
        console.error('[Seed] Error:', error);
        res.status(500).json({ success: false, error: error.message });
    }
});

async function seedMonth(year, month, db) {
    const monthStr = `${year}-${String(month).padStart(2, '0')}`;
    const daysInMonth = new Date(year, month, 0).getDate();
    let inserted = 0;
    let skipped = 0;
    
    // Get employee IDs
    const [employees] = await db.query(
        "SELECT id FROM users WHERE email LIKE 'karyawan%@talenta.com' ORDER BY email"
    );
    
    if (!employees || employees.length === 0) {
        return { month: monthStr, count: 0, error: 'No employees found' };
    }
    
    const empIds = employees.map(e => e.id);
    
    for (let day = 1; day <= daysInMonth; day++) {
        const date = new Date(year, month - 1, day);
        const dow = date.getDay();
        
        // Skip weekends
        if (dow === 0 || dow === 6) continue;
        
        const dateStr = `${year}-${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}`;
        
        // Check if records already exist
        const [existing] = await db.query(
            'SELECT COUNT(*) as count FROM attendance WHERE date = ?',
            [dateStr]
        );
        
        if (existing[0]?.count > 0) {
            skipped += existing[0].count;
            continue;
        }
        
        // Generate attendance for each employee
        for (let i = 0; i < empIds.length; i++) {
            let hour, minute, status;
            
            // Different attendance patterns per employee
            switch(i) {
                case 0: // Employee 1: 80/20
                    if (Math.random() < 0.2) {
                        hour = 8 + Math.floor(Math.random() * 2);
                        minute = Math.floor(Math.random() * 60);
                        status = 'late';
                    } else {
                        hour = 7; minute = Math.floor(Math.random() * 30);
                        status = 'present';
                    }
                    break;
                case 1: // Employee 2: 50/50
                    if (Math.random() < 0.5) {
                        hour = 8 + Math.floor(Math.random() * 2);
                        minute = Math.floor(Math.random() * 60);
                        status = 'late';
                    } else {
                        hour = 7; minute = Math.floor(Math.random() * 30);
                        status = 'present';
                    }
                    break;
                case 2: // Employee 3: 90/10
                    if (Math.random() < 0.1) {
                        hour = 8; minute = Math.floor(Math.random() * 55);
                        status = 'late';
                    } else {
                        hour = 7; minute = 25 + Math.floor(Math.random() * 35);
                        status = 'present';
                    }
                    break;
                case 3: // Employee 4: 95/5
                    if (Math.random() < 0.05) {
                        hour = 8; minute = 10 + Math.floor(Math.random() * 50);
                        status = 'late';
                    } else {
                        hour = 7; minute = 20 + Math.floor(Math.random() * 40);
                        status = 'present';
                    }
                    break;
                default: // Employee 5: 70/30
                    if (Math.random() < 0.3) {
                        hour = 8 + Math.floor(Math.random() * 2);
                        minute = Math.floor(Math.random() * 60);
                        status = 'late';
                    } else {
                        hour = 7; minute = Math.floor(Math.random() * 30);
                        status = 'present';
                    }
                    break;
            }
            
            const clockIn = `${dateStr} ${String(hour).padStart(2,'0')}:${String(minute).padStart(2,'0')}:00`;
            const clockOut = `${dateStr} ${String(hour + 8).padStart(2,'0')}:${String(minute).padStart(2,'0')}:00`;
            const lat = -6.2 + Math.random() * 0.01;
            const lng = 106.8 + Math.random() * 0.01;
            
            await db.query(
                `INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
                 VALUES (UUID(), ?, ?, ?, ?, ?, ?, ?, ?, ?, 8, ?)`,
                [empIds[i], dateStr, clockIn, clockOut, lat, lng, lat, lng, status, monthStr]
            );
            inserted++;
        }
    }
    
    return { month: monthStr, inserted, skipped };
}

async function seedLeaves(db) {
    // Check if leaves already exist
    const [existing] = await db.query(
        "SELECT COUNT(*) as count FROM leave_requests WHERE start_date >= '2026-01-01' AND start_date <= '2026-04-30'"
    );
    
    if (existing[0]?.count > 0) {
        return { already_seeded: existing[0].count };
    }
    
    // Get employee IDs
    const [employees] = await db.query(
        "SELECT id FROM users WHERE email LIKE 'karyawan%@talenta.com' ORDER BY email"
    );
    
    if (employees.length >= 2) {
        // Employee 2 (index 1): leave Jan 26-28
        await db.query(
            `INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status) 
             VALUES (UUID(), ?, 'Cuti Tahunan', '2026-01-26', '2026-01-28', 'Liburan keluarga', 'approved')`,
            [employees[1].id]
        );
    }
    
    if (employees.length >= 5) {
        // Employee 5 (index 4): sick Feb 16-17
        await db.query(
            `INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status) 
             VALUES (UUID(), ?, 'Sakit', '2026-02-16', '2026-02-17', 'Demam tinggi', 'approved')`,
            [employees[4].id]
        );
    }
    
    if (employees.length >= 3) {
        // Employee 3 (index 2): leave Mar 9-13
        await db.query(
            `INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status) 
             VALUES (UUID(), ?, 'Cuti Tahunan', '2026-03-09', '2026-03-13', 'Liburan', 'approved')`,
            [employees[2].id]
        );
    }
    
    if (employees.length >= 4) {
        // Employee 4 (index 3): izin Apr 13-14
        await db.query(
            `INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status) 
             VALUES (UUID(), ?, 'Izin', '2026-04-13', '2026-04-14', 'Urusan keluarga', 'approved')`,
            [employees[3].id]
        );
    }
    
    return { seeded: true };
}

export default router;