-- ================================================
-- T-Absensi Database Migration Script for MySQL
-- Run this in your local MySQL database
-- ================================================

-- Set timezone to Asia/Jakarta
SET time_zone = '+07:00';

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

-- ============ 3. CREATE users TABLE ============
CREATE TABLE users (
    id CHAR(36) PRIMARY KEY,
    email VARCHAR(191) NOT NULL UNIQUE,
    full_name VARCHAR(191),
    password_hash VARCHAR(191),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============ 4. CREATE user_roles TABLE ============
CREATE TABLE user_roles (
    user_id CHAR(36) PRIMARY KEY,
    role ENUM('admin', 'manager', 'employee') NOT NULL DEFAULT 'employee',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============ 5. CREATE profiles TABLE ============
CREATE TABLE profiles (
    user_id CHAR(36) PRIMARY KEY,
    full_name VARCHAR(191),
    email VARCHAR(191),
    department VARCHAR(191),
    position VARCHAR(191),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============ 6. CREATE attendance_periods TABLE ============
CREATE TABLE attendance_periods (
    id CHAR(36) PRIMARY KEY,
    start_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============ 7. CREATE attendance TABLE ============
CREATE TABLE attendance (
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
CREATE TABLE work_journals (
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
CREATE TABLE leave_requests (
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

-- ============ 10. CREATE audit_logs TABLE ============
CREATE TABLE audit_logs (
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

-- ============ 13. INSERT DEFAULT ADMIN USER ============
-- Generate UUID for admin user
INSERT INTO users (id, email, full_name, password_hash) 
VALUES (UUID(), 'admin@talenta.com', 'Super Admin', '$2b$10$9V0MVeod.9H5P9PDOYlcJev3kp2HK55E4M/g6OwF8PiYD2ZiT.Ppm');

-- Insert admin role using subquery to get the admin user ID
INSERT INTO user_roles (user_id, role) 
SELECT id, 'admin' FROM users WHERE email = 'admin@talenta.com';

-- Insert admin profile using subquery to get the admin user ID
INSERT INTO profiles (user_id, full_name, email, department, position) 
SELECT id, 'Super Admin', 'admin@talenta.com', 'Board of Directors', 'Administrator' FROM users WHERE email = 'admin@talenta.com';

-- ============ 14. INSERT INITIAL ATTENDANCE PERIOD ============
INSERT INTO attendance_periods (id, start_date, is_active)
VALUES (UUID(), CURDATE(), TRUE);

-- ============ 15. CREATE VIEW FOR ATTENDANCE SUMMARY ============
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

-- ============ SUCCESS MESSAGE ============
SELECT 'MySQL migration completed successfully!' as status;
