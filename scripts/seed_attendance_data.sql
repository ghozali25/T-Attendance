-- Seeder for attendance data
-- This script creates sample attendance data for demo purposes

-- Get employee IDs
SET @emp1 = (SELECT id FROM users WHERE email = 'karyawan1@talenta.com' LIMIT 1);
SET @emp2 = (SELECT id FROM users WHERE email = 'karyawan2@talenta.com' LIMIT 1);
SET @emp3 = (SELECT id FROM users WHERE email = 'karyawan3@talenta.com' LIMIT 1);
SET @emp4 = (SELECT id FROM users WHERE email = 'karyawan4@talenta.com' LIMIT 1);
SET @emp5 = (SELECT id FROM users WHERE email = 'karyawan5@talenta.com' LIMIT 1);

-- ============ ATTENDANCE RECORDS ============
-- Employee 1: Hadir (on time) - today
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
VALUES (UUID(), @emp1, CURDATE(), DATE_SUB(NOW(), INTERVAL 2 HOUR), DATE_SUB(NOW(), INTERVAL 1 HOUR), -6.2088, 106.8456, -6.2088, 106.8456, 'present', 8.0, DATE_FORMAT(CURDATE(), '%Y-%m'));

-- Employee 2: Terlambat (late) - today
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
VALUES (UUID(), @emp2, CURDATE(), DATE_ADD(DATE_SUB(NOW(), INTERVAL 2 HOUR), INTERVAL 30 MINUTE), DATE_SUB(NOW(), INTERVAL 1 HOUR), -6.2088, 106.8456, -6.2088, 106.8456, 'late', 7.5, DATE_FORMAT(CURDATE(), '%Y-%m'));

-- Employee 3: Hadir - yesterday
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
VALUES (UUID(), @emp3, DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 DAY), INTERVAL 2 HOUR), DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 DAY), INTERVAL 1 HOUR), -6.2088, 106.8456, -6.2088, 106.8456, 'present', 8.0, DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y-%m'));

-- Employee 4: Terlambat - yesterday
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
VALUES (UUID(), @emp4, DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_ADD(DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 DAY), INTERVAL 2 HOUR), INTERVAL 45 MINUTE), DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 DAY), INTERVAL 1 HOUR), -6.2088, 106.8456, -6.2088, 106.8456, 'late', 7.25, DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y-%m'));

-- Employee 5: Hadir - 2 days ago
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
VALUES (UUID(), @emp5, DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 DAY), INTERVAL 2 HOUR), DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 DAY), INTERVAL 1 HOUR), -6.2088, 106.8456, -6.2088, 106.8456, 'present', 8.0, DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), '%Y-%m'));

-- Employee 1: Hadir - 3 days ago
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
VALUES (UUID(), @emp1, DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 DAY), INTERVAL 2 HOUR), DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 DAY), INTERVAL 1 HOUR), -6.2088, 106.8456, -6.2088, 106.8456, 'present', 8.0, DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), '%Y-%m'));

-- Employee 2: Terlambat - 3 days ago
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
VALUES (UUID(), @emp2, DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_ADD(DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 DAY), INTERVAL 2 HOUR), INTERVAL 20 MINUTE), DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 DAY), INTERVAL 1 HOUR), -6.2088, 106.8456, -6.2088, 106.8456, 'late', 7.66, DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), '%Y-%m'));

-- Employee 3: Hadir - 4 days ago
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
VALUES (UUID(), @emp3, DATE_SUB(CURDATE(), INTERVAL 4 DAY), DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 DAY), INTERVAL 2 HOUR), DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 DAY), INTERVAL 1 HOUR), -6.2088, 106.8456, -6.2088, 106.8456, 'present', 8.0, DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 4 DAY), '%Y-%m'));

-- Employee 4: Hadir - 5 days ago
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
VALUES (UUID(), @emp4, DATE_SUB(CURDATE(), INTERVAL 5 DAY), DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 DAY), INTERVAL 2 HOUR), DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 DAY), INTERVAL 1 HOUR), -6.2088, 106.8456, -6.2088, 106.8456, 'present', 8.0, DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), '%Y-%m'));

-- Employee 5: Terlambat - 5 days ago
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
VALUES (UUID(), @emp5, DATE_SUB(CURDATE(), INTERVAL 5 DAY), DATE_ADD(DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 DAY), INTERVAL 2 HOUR), INTERVAL 50 MINUTE), DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 DAY), INTERVAL 1 HOUR), -6.2088, 106.8456, -6.2088, 106.8456, 'late', 7.16, DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), '%Y-%m'));

-- ============ LEAVE REQUESTS (CUTI) ============
-- Employee 5 on leave today
INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status)
VALUES (UUID(), @emp5, 'Cuti Tahunan', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 2 DAY), 'Liburan keluarga', 'approved');

-- Employee 3 on leave yesterday
INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status)
VALUES (UUID(), @emp3, DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'Sakit', 'Demam', 'approved');

-- Employee 1 on leave request (pending)
INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status)
VALUES (UUID(), @emp1, 'Cuti Tahunan', DATE_ADD(CURDATE(), INTERVAL 7 DAY), DATE_ADD(CURDATE(), INTERVAL 10 DAY), 'Rencana liburan', 'pending');

-- ============ WORK JOURNALS ============
-- Add some work journals for today
INSERT INTO work_journals (id, user_id, attendance_id, date, content, duration, obstacles, work_result, mood, verification_status)
VALUES 
(UUID(), @emp1, (SELECT id FROM attendance WHERE user_id = @emp1 AND date = CURDATE() LIMIT 1), CURDATE(), 'Completed project documentation and code review', 480, 'None', 'Documentation completed', '😊', 'approved'),
(UUID(), @emp2, (SELECT id FROM attendance WHERE user_id = @emp2 AND date = CURDATE() LIMIT 1), CURDATE(), 'Meeting with clients and product development', 480, 'Network issues', 'Client requirements gathered', '🙂', 'submitted');

-- Work journals for previous days
INSERT INTO work_journals (id, user_id, attendance_id, date, content, duration, obstacles, work_result, mood, verification_status)
VALUES 
(UUID(), @emp3, (SELECT id FROM attendance WHERE user_id = @emp3 AND date = DATE_SUB(CURDATE(), INTERVAL 1 DAY) LIMIT 1), DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'Database optimization and bug fixes', 420, 'Legacy code', 'Performance improved by 30%', '😊', 'approved'),
(UUID(), @emp4, (SELECT id FROM attendance WHERE user_id = @emp4 AND date = DATE_SUB(CURDATE(), INTERVAL 1 DAY) LIMIT 1), DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'UI/UX improvements and testing', 450, 'Design changes', 'New dashboard design completed', '🙂', 'approved');

SELECT 'Attendance data seeded successfully!' AS Result;
SELECT COUNT(*) AS 'Total Attendance Records' FROM attendance;
SELECT COUNT(*) AS 'Total Leave Requests' FROM leave_requests;
SELECT COUNT(*) AS 'Total Work Journals' FROM work_journals;
