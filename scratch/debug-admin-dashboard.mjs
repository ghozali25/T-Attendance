/**
 * Debug script untuk admin dashboard
 * Run: node scratch/debug-admin-dashboard.mjs
 */
const API_BASE = 'http://localhost:3001/api';

async function query(sql, params = []) {
    const res = await fetch(`${API_BASE}/db/query`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ sql, params })
    });
    return res.json();
}

async function main() {
    console.log('=== DEBUG ADMIN DASHBOARD ===\n');

    // 1. Check users API
    console.log('1. USERS API RESPONSE:');
    const usersRes = await fetch(`${API_BASE}/users`);
    const users = await usersRes.json();
    console.log(`   Total users: ${users.length}`);
    console.log('   Users:', JSON.stringify(users, null, 2));

    // 2. Check profiles API
    console.log('\n2. PROFILES API RESPONSE:');
    const profilesRes = await fetch(`${API_BASE}/profiles`);
    const profiles = await profilesRes.json();
    console.log(`   Total profiles: ${profiles.length}`);
    console.log('   Profiles:', JSON.stringify(profiles.slice(0, 3), null, 2));

    // 3. Check attendance for today
    const todayStr = new Date().toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
    console.log(`\n3. ATTENDANCE TODAY (${todayStr}):`);
    const attToday = await query(
        'SELECT a.*, p.full_name FROM attendance a LEFT JOIN profiles p ON a.user_id = p.user_id WHERE a.date = ?',
        [todayStr]
    );
    console.log(`   Records: ${attToday.length}`);
    if (attToday.length > 0) {
        attToday.forEach(r => console.log(`   ${r.full_name?.substring(0,15)} - ${r.status} - clock_in: ${r.clock_in}`));
    } else {
        console.log('   No records for today - this might be okay if it\'s early');
    }

    // 4. Check monthly attendance stats
    console.log('\n4. MONTHLY ATTENDANCE (May 2026):');
    const monthly = await query(
        "SELECT status, COUNT(*) as c FROM attendance WHERE period_month = '2026-05' GROUP BY status"
    );
    console.log(`   Records by status:`, JSON.stringify(monthly, null, 2));

    // 5. Check what useEmployeeIds would return
    console.log('\n5. EMPLOYEE IDS FILTER:');
    console.log('   ABSENSI_WAJIB_ROLE includes: employee, karyawan, magang, pkwt');
    const roleFiltered = users.filter(u => ['employee', 'karyawan', 'magang', 'pkwt'].includes(u.role));
    console.log(`   Users matching ABSENSI_WAJIB_ROLE: ${roleFiltered.length}`);
    roleFiltered.forEach(u => console.log(`   - ${u.email} (role: ${u.role})`));
    
    // Check if admin would be excluded
    console.log('\n   Admin users:');
    const adminUsers = users.filter(u => ['admin', 'manager', 'super_admin'].includes(u.role));
    console.log(`   Total: ${adminUsers.length}`);
    adminUsers.forEach(u => console.log(`   - ${u.email} (role: ${u.role})`));

    // 6. Check EXCLUDED_USER_NAMES filter
    console.log('\n6. EXCLUDED USER NAMES:');
    console.log('   EXCLUDED_USER_NAMES = [Eko Winarni, Super Admin, ...]');
    console.log(`   Admin user full_name would be filtered if it matches excluded names`);

    console.log('\n=== DONE ===');
}

main().catch(err => {
    console.error('FATAL:', err);
    process.exit(1);
});