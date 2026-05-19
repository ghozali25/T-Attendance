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

async function seedCurrentMonth() {
  let connection;
  
  try {
    console.log('🌱 Seeding current month attendance data...\n');
    console.log(`📊 Database: ${DB_NAME}`);
    console.log(`🔗 Host: ${DB_HOST}:${DB_PORT}\n`);

    connection = await mysql.createConnection({
      host: DB_HOST,
      port: DB_PORT,
      user: DB_USER,
      password: DB_PASSWORD,
      database: DB_NAME,
      multipleStatements: true,
      ssl: DB_HOST && DB_HOST.includes('tidbcloud.com') 
        ? { minVersion: 'TLSv1.2', rejectUnauthorized: true }
        : undefined
    });

    console.log('✅ Connected to MySQL server');

    // Get current month details
    const now = new Date();
    const jakartaOffset = 7 * 60 * 60 * 1000;
    const jakartaNow = new Date(now.getTime() + jakartaOffset);
    const year = jakartaNow.getFullYear();
    const month = jakartaNow.getMonth() + 1;
    const periodMonth = `${year}-${String(month).padStart(2, '0')}`;
    const daysInMonth = new Date(year, month, 0).getDate();
    const today = jakartaNow.getDate();

    console.log(`📅 Current period: ${periodMonth}, Today: ${today}/${month}/${year}`);
    console.log(`📆 Days in month: ${daysInMonth}\n`);

    // Get all employee user IDs
    const [users] = await connection.query(
      `SELECT u.id, u.email, u.full_name FROM users u 
       JOIN user_roles ur ON u.id = ur.user_id 
       WHERE ur.role = 'employee'`
    );

    if (!users || users.length === 0) {
      console.log('❌ No employee users found. Make sure migration ran first.');
      await connection.end();
      return;
    }

    console.log(`👥 Found ${users.length} employees`);
    users.forEach(u => console.log(`   - ${u.email} (${u.id})`));

    // Check if already seeded
    const [existing] = await connection.query(
      `SELECT COUNT(*) as count FROM attendance WHERE period_month = ?`,
      [periodMonth]
    );
    const existingCount = existing[0]?.count || 0;

    if (existingCount > 50) {
      console.log(`\n⚠️  Attendance for ${periodMonth} already has ${existingCount} records. Skipping seed.`);
    } else {
      console.log(`\n📝 Seeding attendance records...`);
      
      let seedCount = 0;

      for (let day = 1; day <= Math.min(today, daysInMonth); day++) {
        const date = new Date(year, month - 1, day);
        const dayOfWeek = date.getDay(); // 0=Sun, 6=Sat
        
        // Skip weekends
        if (dayOfWeek === 0 || dayOfWeek === 6) continue;

        // Skip today to let users clock in themselves
        if (day === today) continue;

        const dateStr = `${year}-${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}`;
        
        // Skip if it's a holiday
        const [holidays] = await connection.query(
          `SELECT id FROM holidays WHERE date = ?`,
          [dateStr]
        );
        if (holidays.length > 0) {
          console.log(`   🎉 ${dateStr} is a holiday, skipping`);
          continue;
        }

        for (const user of users) {
          const baseHour = 7 + Math.floor(Math.random() * 2);
          const baseMinute = Math.floor(Math.random() * 60);
          const clockInHour = baseHour;
          const clockInMin = baseMinute;
          
          const isLate = clockInHour > 8 || (clockInHour === 8 && clockInMin > 0);
          
          const clockIn = `${dateStr} ${String(clockInHour).padStart(2, '0')}:${String(clockInMin).padStart(2, '0')}:${String(Math.floor(Math.random() * 60)).padStart(2, '0')}`;
          
          const workHoursNum = 8 + Math.floor(Math.random() * 2);
          const clockOutHour = Math.min(clockInHour + workHoursNum, 18);
          const clockOutMin = baseMinute;
          const clockOut = `${dateStr} ${String(clockOutHour).padStart(2, '0')}:${String(clockOutMin).padStart(2, '0')}:${String(Math.floor(Math.random() * 60)).padStart(2, '0')}`;

          const status = isLate ? 'late' : 'present';
          const actualWorkHours = (clockOutHour + clockOutMin/60) - (clockInHour + clockInMin/60);
          
          const id = crypto.randomUUID();

          await connection.query(
            `INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
              id, user.id, dateStr, clockIn, clockOut,
              -6.2 + (Math.random() - 0.5) * 0.01, 106.8 + (Math.random() - 0.5) * 0.01,
              -6.2 + (Math.random() - 0.5) * 0.01, 106.8 + (Math.random() - 0.5) * 0.01,
              status, Math.round(actualWorkHours * 100) / 100, periodMonth
            ]
          );
          seedCount++;

          // Also seed a work journal
          const journalId = crypto.randomUUID();
          const journalTemplates = [
            'Menyelesaikan tugas harian dan meeting dengan tim',
            'Mengerjakan project pengembangan sistem',
            'Melakukan review dan testing fitur baru',
            'Koordinasi dengan tim terkait project',
            'Menyelesaikan laporan pekerjaan harian'
          ];
          const content = journalTemplates[Math.floor(Math.random() * journalTemplates.length)];
          
          await connection.query(
            `INSERT INTO work_journals (id, user_id, date, content, duration, obstacles, work_result, mood, verification_status)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
              journalId, user.id, dateStr, content,
              Math.round(actualWorkHours * 60),
              Math.random() > 0.7 ? 'Beberapa kendala teknis' : 'Tidak ada',
              'Selesai dengan baik',
              ['😊', '😊', '😊', '😊', '😄'][Math.floor(Math.random() * 5)],
              'approved'
            ]
          );
        }
      }

      console.log(`   ✅ Seeded ${seedCount} attendance records for ${periodMonth}`);
    }

    // Seed some leave requests
    console.log(`\n📝 Seeding leave requests...`);
    const [existingLeaves] = await connection.query(
      `SELECT COUNT(*) as count FROM leave_requests WHERE status = 'approved' AND start_date >= ?`,
      [`${year}-${String(month).padStart(2, '0')}-01`]
    );
    
    if ((existingLeaves[0]?.count || 0) < 3) {
      for (let i = 0; i < Math.min(3, users.length); i++) {
        const user = users[i];
        const leaveStart = `${year}-${String(month).padStart(2, '0')}-15`;
        const leaveEnd = `${year}-${String(month).padStart(2, '0')}-16`;
        
        await connection.query(
          `INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status)
           VALUES (?, ?, ?, ?, ?, ?, ?)`,
          [crypto.randomUUID(), user.id, 'Cuti Tahunan', leaveStart, leaveEnd, 'Izin cuti pribadi', 'approved']
        );
        console.log(`   ✅ Leave for ${user.email}: ${leaveStart} - ${leaveEnd}`);
      }
    } else {
      console.log(`   ℹ️  Leave requests already exist`);
    }

    console.log(`\n✨ Seeding completed successfully!`);
    console.log(`📊 Summary:`);
    console.log(`   - Employee count: ${users.length}`);
    console.log(`   - Current month: ${periodMonth}`);
    console.log(`   - Today: ${year}-${String(month).padStart(2, '0')}-${String(today).padStart(2, '0')}`);
    console.log(`   - Days seeded: ${Math.min(today - 1, daysInMonth)} (weekdays only, excluding today and holidays)`);

  } catch (error) {
    console.error('\n❌ Seeding failed:', error.message);
    process.exit(1);
  } finally {
    if (connection) {
      await connection.end();
      console.log('🔌 Database connection closed');
    }
  }
}

seedCurrentMonth();