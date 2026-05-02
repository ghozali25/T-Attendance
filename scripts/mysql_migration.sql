-- ================================================
-- T-Absensi Database Migration Script for MySQL
-- Run this in your local MySQL database
-- ================================================

-- Set timezone to Asia/Jakarta
SET time_zone = '+07:00';

-- Disable foreign key checks for clean slate
SET FOREIGN_KEY_CHECKS = 0;

-- ============ 1. CREATE DATABASE IF NOT EXISTS ============
CREATE DATABASE IF NOT EXISTS t_absensi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE t_absensi;

-- ============ 2. DROP EXISTING TABLES (clean slate) ============
DROP TABLE IF EXISTS v_attendance_summary;
DROP TABLE IF EXISTS audit_logs;
DROP TABLE IF EXISTS work_journals;
DROP TABLE IF EXISTS leave_requests;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS attendance_periods;
DROP TABLE IF EXISTS profiles;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS holidays;
DROP TABLE IF EXISTS attendance_requests;
DROP TABLE IF EXISTS system_settings;

-- ============ 3. CREATE users TABLE ============
CREATE TABLE IF NOT EXISTS users (
    id CHAR(36) PRIMARY KEY,
    email VARCHAR(191) NOT NULL UNIQUE,
    full_name VARCHAR(191),
    password_hash VARCHAR(191),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============ 4. CREATE user_roles TABLE ============
CREATE TABLE IF NOT EXISTS user_roles (
    user_id CHAR(36) PRIMARY KEY,
    role ENUM('admin', 'manager', 'employee') NOT NULL DEFAULT 'employee',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============ 5. CREATE profiles TABLE ============
CREATE TABLE IF NOT EXISTS profiles (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL UNIQUE,
    full_name VARCHAR(191) NOT NULL,
    phone VARCHAR(50),
    address TEXT,
    join_date DATE,
    department VARCHAR(191),
    position VARCHAR(191),
    avatar_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============ 6. CREATE attendance_periods TABLE ============
CREATE TABLE IF NOT EXISTS attendance_periods (
    id CHAR(36) PRIMARY KEY,
    start_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============ 6.5. CREATE departments TABLE ============
CREATE TABLE IF NOT EXISTS departments (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(191) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============ 7. CREATE attendance TABLE ============
CREATE TABLE IF NOT EXISTS attendance (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    date DATE,
    clock_in TIMESTAMP NULL,
    clock_out TIMESTAMP NULL,
    clock_in_lat DOUBLE,
    clock_in_lng DOUBLE,
    clock_out_lat DOUBLE,
    clock_out_lng DOUBLE,
    work_hours DECIMAL(10, 2),
    period_month VARCHAR(7),
    status VARCHAR(50) DEFAULT 'present',
    notes TEXT,
    deleted_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY idx_attendance_user_date (user_id, date)
);

-- ============ 8. CREATE work_journals TABLE ============
CREATE TABLE IF NOT EXISTS work_journals (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    date DATE NOT NULL,
    title TEXT,
    description TEXT,
    obstacles TEXT,
    work_result TEXT,
    mood TEXT,
    verification_status TEXT,
    content TEXT,
    duration INT,
    deleted_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============ 9. CREATE leave_requests TABLE ============
CREATE TABLE IF NOT EXISTS leave_requests (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    leave_type VARCHAR(191) NOT NULL,
    reason TEXT,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    approved_by CHAR(36),
    rejection_reason TEXT,
    approved_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL
);

-- ============ 9.5. CREATE attendance_requests TABLE ============
CREATE TABLE IF NOT EXISTS attendance_requests (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    date DATE NOT NULL,
    clock_in TIMESTAMP NULL,
    clock_out TIMESTAMP NULL,
    reason TEXT,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    attachment_url TEXT,
    approved_by CHAR(36),
    rejection_reason TEXT,
    approved_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL
);

-- ============ 10. CREATE audit_logs TABLE ============
CREATE TABLE IF NOT EXISTS audit_logs (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    action VARCHAR(191) NOT NULL,
    target_table VARCHAR(191),
    target_id CHAR(36),
    old_data JSON,
    new_data JSON,
    description TEXT,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============ 10. CREATE INDEXES ============
CREATE INDEX idx_attendance_user_id ON attendance(user_id);
CREATE INDEX idx_attendance_date ON attendance(date);
CREATE INDEX idx_attendance_period_month ON attendance(period_month);
CREATE INDEX idx_work_journals_user_id ON work_journals(user_id);
CREATE INDEX idx_work_journals_date ON work_journals(date);
CREATE INDEX idx_audit_logs_user_id ON audit_logs(user_id);
CREATE INDEX idx_audit_logs_action ON audit_logs(action);
CREATE INDEX idx_audit_logs_target_table ON audit_logs(target_table);
CREATE INDEX idx_audit_logs_created_at ON audit_logs(created_at);
CREATE INDEX idx_attendance_requests_user_id ON attendance_requests(user_id);
CREATE INDEX idx_attendance_requests_status ON attendance_requests(status);
CREATE INDEX idx_attendance_requests_date ON attendance_requests(date);

/* 
-- ============ 11. CREATE TRIGGER FOR period_month ============
CREATE TRIGGER trg_set_attendance_period_month
BEFORE INSERT ON attendance
FOR EACH ROW
BEGIN
    IF NEW.clock_in IS NOT NULL THEN
        SET NEW.period_month = DATE_FORMAT(NEW.clock_in, '%Y-%m');
    END IF;
END;

CREATE TRIGGER trg_update_attendance_period_month
BEFORE UPDATE ON attendance
FOR EACH ROW
BEGIN
    IF NEW.clock_in IS NOT NULL AND (OLD.clock_in IS NULL OR NEW.clock_in != OLD.clock_in) THEN
        SET NEW.period_month = DATE_FORMAT(NEW.clock_in, '%Y-%m');
    END IF;
END;

-- ============ 12. CREATE TRIGGER FOR work_hours CALCULATION ============
CREATE TRIGGER trg_calculate_work_hours
BEFORE UPDATE ON attendance
FOR EACH ROW
BEGIN
    IF NEW.clock_out IS NOT NULL AND (OLD.clock_out IS NULL OR NEW.clock_out != OLD.clock_out) THEN
        SET NEW.work_hours = ROUND(TIMESTAMPDIFF(SECOND, NEW.clock_in, NEW.clock_out) / 3600.0, 2);
    END IF;
END;
*/

-- ============ 13. INSERT DEFAULT ADMIN USER ============
-- Generate UUID for admin user
INSERT INTO users (id, email, full_name, password_hash) 
VALUES (UUID(), 'admin@talenta.com', 'Super Admin', '$2b$10$PuH2MqcVYbmsQfQuHQa71eN6HBS3r5ZCJYJwdtOK36L2hDcXEU6ai');

-- Insert admin role using subquery to get the admin user ID
INSERT INTO user_roles (user_id, role) 
SELECT id, 'admin' FROM users WHERE email = 'admin@talenta.com';

-- Insert admin profile using subquery to get the admin user ID
INSERT INTO profiles (id, user_id, full_name, department, position) 
SELECT UUID(), id, 'Super Admin', 'Board of Directors', 'Administrator' FROM users WHERE email = 'admin@talenta.com';

-- ============ 13.5. INSERT DEMO EMPLOYEE ACCOUNTS ============
-- Password for all demo accounts: 'password' (hashed with bcrypt)
INSERT INTO users (id, email, full_name, password_hash) 
VALUES 
(UUID(), 'karyawan1@talenta.com', 'Budi Santoso', '$2b$10$PuH2MqcVYbmsQfQuHQa71eN6HBS3r5ZCJYJwdtOK36L2hDcXEU6ai'),
(UUID(), 'karyawan2@talenta.com', 'Siti Aminah', '$2b$10$PuH2MqcVYbmsQfQuHQa71eN6HBS3r5ZCJYJwdtOK36L2hDcXEU6ai'),
(UUID(), 'karyawan3@talenta.com', 'Ahmad Wijaya', '$2b$10$PuH2MqcVYbmsQfQuHQa71eN6HBS3r5ZCJYJwdtOK36L2hDcXEU6ai'),
(UUID(), 'karyawan4@talenta.com', 'Dewi Kartika', '$2b$10$PuH2MqcVYbmsQfQuHQa71eN6HBS3r5ZCJYJwdtOK36L2hDcXEU6ai'),
(UUID(), 'karyawan5@talenta.com', 'Rudi Hartono', '$2b$10$PuH2MqcVYbmsQfQuHQa71eN6HBS3r5ZCJYJwdtOK36L2hDcXEU6ai');

-- Insert employee roles
INSERT INTO user_roles (user_id, role) 
SELECT id, 'employee' FROM users WHERE email LIKE 'karyawan%@talenta.com';

-- Insert employee profiles
INSERT INTO profiles (id, user_id, full_name, department, position) 
SELECT 
    UUID(),
    u.id, 
    u.full_name, 
    CASE u.email
        WHEN 'karyawan1@talenta.com' THEN 'Engineering'
        WHEN 'karyawan2@talenta.com' THEN 'Marketing'
        WHEN 'karyawan3@talenta.com' THEN 'Finance'
        WHEN 'karyawan4@talenta.com' THEN 'Human Resources'
        WHEN 'karyawan5@talenta.com' THEN 'Operations'
    END,
    CASE u.email
        WHEN 'karyawan1@talenta.com' THEN 'Software Engineer'
        WHEN 'karyawan2@talenta.com' THEN 'Marketing Specialist'
        WHEN 'karyawan3@talenta.com' THEN 'Accountant'
        WHEN 'karyawan4@talenta.com' THEN 'HR Specialist'
        WHEN 'karyawan5@talenta.com' THEN 'Operations Manager'
    END
FROM users u WHERE u.email LIKE 'karyawan%@talenta.com';

-- ============ 14. CREATE HOLIDAYS TABLE ============
CREATE TABLE IF NOT EXISTS holidays (
    id CHAR(36) PRIMARY KEY,
    date DATE NOT NULL UNIQUE,
    name VARCHAR(191) NOT NULL,
    description TEXT,
    is_national BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============ 14.5. CREATE system_settings TABLE ============
CREATE TABLE IF NOT EXISTS system_settings (
    id CHAR(36) PRIMARY KEY,
    setting_key VARCHAR(191) NOT NULL UNIQUE,
    setting_value TEXT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============ 15. INSERT INDONESIAN HOLIDAYS 2026 ============
INSERT INTO holidays (id, date, name, description, is_national) VALUES
(UUID(), '2026-01-01', 'Tahun Baru', 'Hari Tahun Baru Masehi', TRUE),
(UUID(), '2026-01-12', 'Isra Miraj', 'Isra Mikraj Nabi Muhammad SAW', TRUE),
(UUID(), '2026-01-26', 'Hari Raya Imlek', 'Tahun Baru Imlek 2577 Kongzili', TRUE),
(UUID(), '2026-02-15', 'Hari Raya Nyepi', 'Tahun Baru Saka 1948', TRUE),
(UUID(), '2026-03-31', 'Hari Raya Idul Fitri', 'Hari Raya Idul Fitri 1447 Hijriah', TRUE),
(UUID(), '2026-04-01', 'Hari Raya Idul Fitri', 'Hari ke-2 Idul Fitri 1447 Hijriah', TRUE),
(UUID(), '2026-04-18', 'Wafat Isa Almasih', 'Wafat Isa Almasih', TRUE),
(UUID(), '2026-05-01', 'Hari Buruh', 'Hari Buruh Internasional', TRUE),
(UUID(), '2026-05-22', 'Kenaikan Isa Almasih', 'Kenaikan Isa Almasih', TRUE),
(UUID(), '2026-06-07', 'Hari Lahir Pancasila', 'Hari Lahir Pancasila', TRUE),
(UUID(), '2026-06-17', 'Idul Adha', 'Hari Raya Idul Adha 1447 Hijriah', TRUE),
(UUID(), '2026-07-07', 'Tahun Baru Islam', 'Tahun Baru Islam 1448 Hijriah', TRUE),
(UUID(), '2026-08-17', 'Hari Kemerdekaan', 'Hari Proklamasi Kemerdekaan Indonesia ke-81', TRUE),
(UUID(), '2026-09-06', 'Maulid Nabi', 'Maulid Nabi Muhammad SAW', TRUE),
(UUID(), '2026-12-25', 'Hari Raya Natal', 'Hari Raya Natal', TRUE);

-- ============ 16. INSERT INITIAL ATTENDANCE PERIOD ============
INSERT INTO attendance_periods (id, start_date, is_active)
VALUES (UUID(), CURDATE(), TRUE);

-- ============ 16.5. INSERT INITIAL SYSTEM SETTINGS ============
INSERT INTO system_settings (id, setting_key, setting_value)
VALUES (UUID(), 'current_settings', '{"companyName":"T-Attendance","clockInStart":"08:00","clockInEnd":"09:00","clockOutStart":"17:00","clockOutEnd":"18:00","lateThreshold":"09:00","enableLocationTracking":true,"enableNotifications":true,"requirePhotoOnClockIn":false,"autoClockOut":false,"autoClockOutTime":"22:00","maxLeaveDays":12,"attendanceStartDate":"2024-01-01"}');

-- ============ 17. INSERT DEMO ATTENDANCE DATA (MAY 2026) ============
-- Insert basic attendance records for demo users
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
SELECT UUID(), id, '2026-05-01', '2026-05-01 08:00:00', '2026-05-01 17:00:00', -6.2, 106.8, -6.2, 106.8, 'present', 8.0, '2026-05' FROM users WHERE email = 'karyawan1@talenta.com';

INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
SELECT UUID(), id, '2026-05-01', '2026-05-01 08:15:00', '2026-05-01 17:15:00', -6.2, 106.8, -6.2, 106.8, 'present', 8.0, '2026-05' FROM users WHERE email = 'karyawan2@talenta.com';

INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
SELECT UUID(), id, '2026-05-01', '2026-05-01 09:30:00', '2026-05-01 18:30:00', -6.2, 106.8, -6.2, 106.8, 'late', 8.0, '2026-05' FROM users WHERE email = 'karyawan3@talenta.com';

-- Insert some leave requests
INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status)
SELECT UUID(), id, 'Cuti Tahunan', '2026-05-10', '2026-05-12', 'Liburan keluarga', 'approved' FROM users WHERE email = 'karyawan1@talenta.com';

-- Insert some work journals
INSERT INTO work_journals (id, user_id, date, content, duration, obstacles, work_result, mood, verification_status)
SELECT UUID(), id, '2026-05-01', 'Mengerjakan fitur absensi cloud', 480, 'None', 'Fitur selesai', '😊', 'approved' FROM users WHERE email = 'karyawan1@talenta.com';


-- ============ 18. CREATE VIEW FOR ATTENDANCE SUMMARY ============
CREATE OR REPLACE VIEW v_attendance_summary AS
SELECT 
    a.id,
    a.user_id,
    u.email,
    p.full_name,
    p.department,
    p.position,
    a.date,
    a.clock_in,
    a.clock_out,
    a.work_hours,
    a.period_month,
    a.notes,
    ur.role
FROM attendance a
JOIN users u ON a.user_id = u.id
LEFT JOIN profiles p ON a.user_id = p.user_id
LEFT JOIN user_roles ur ON a.user_id = ur.user_id;

-- ============ 19. SUCCESS MESSAGE ============
SELECT 'MySQL migration completed successfully!' as status;
SELECT CONCAT('Total attendance records seeded: ', COUNT(*)) as info FROM attendance;
SELECT CONCAT('Total holidays seeded: ', COUNT(*)) as info FROM holidays;
SELECT CONCAT('Total leave requests seeded: ', COUNT(*)) as info FROM leave_requests;
SELECT CONCAT('Total work journals seeded: ', COUNT(*)) as info FROM work_journals;

SET FOREIGN_KEY_CHECKS = 1;
