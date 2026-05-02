-- Add attendance_requests table
USE t_absensi;

CREATE TABLE IF NOT EXISTS attendance_requests (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    date DATE NOT NULL,
    clock_in TIMESTAMP NULL,
    clock_out TIMESTAMP NULL,
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

-- Index for performance
CREATE INDEX idx_attendance_requests_user_id ON attendance_requests(user_id);
CREATE INDEX idx_attendance_requests_status ON attendance_requests(status);
CREATE INDEX idx_attendance_requests_date ON attendance_requests(date);
