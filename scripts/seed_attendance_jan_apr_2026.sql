-- ================================================
-- Seed Attendance Data for Januari - April 2026
-- Generate realistic attendance records for demo employees
-- ================================================

-- Get employee IDs
SET @emp1 = (SELECT id FROM users WHERE email = 'karyawan1@talenta.com' LIMIT 1);
SET @emp2 = (SELECT id FROM users WHERE email = 'karyawan2@talenta.com' LIMIT 1);
SET @emp3 = (SELECT id FROM users WHERE email = 'karyawan3@talenta.com' LIMIT 1);
SET @emp4 = (SELECT id FROM users WHERE email = 'karyawan4@talenta.com' LIMIT 1);
SET @emp5 = (SELECT id FROM users WHERE email = 'karyawan5@talenta.com' LIMIT 1);

-- Insert approved leaves for some employees
INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status)
SELECT UUID(), @emp2, 'Cuti Tahunan', '2026-01-26', '2026-01-28', 'Liburan keluarga', 'approved'
WHERE NOT EXISTS (SELECT 1 FROM leave_requests WHERE user_id = @emp2 AND start_date = '2026-01-26');

INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status)
SELECT UUID(), @emp5, 'Sakit', '2026-02-16', '2026-02-17', 'Demam tinggi', 'approved'
WHERE NOT EXISTS (SELECT 1 FROM leave_requests WHERE user_id = @emp5 AND start_date = '2026-02-16');

INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status)
SELECT UUID(), @emp3, 'Cuti Tahunan', '2026-03-09', '2026-03-13', 'Liburan', 'approved'
WHERE NOT EXISTS (SELECT 1 FROM leave_requests WHERE user_id = @emp3 AND start_date = '2026-03-09');

INSERT INTO leave_requests (id, user_id, leave_type, start_date, end_date, reason, status)
SELECT UUID(), @emp4, 'Izin', '2026-04-13', '2026-04-14', 'Urusan keluarga', 'approved'
WHERE NOT EXISTS (SELECT 1 FROM leave_requests WHERE user_id = @emp4 AND start_date = '2026-04-13');

-- Generate attendance records for each month
DELIMITER //

CREATE PROCEDURE IF NOT EXISTS generate_monthly_attendance(
    IN p_year INT,
    IN p_month INT
)
BEGIN
    DECLARE v_start_date DATE;
    DECLARE v_end_date DATE;
    DECLARE v_curr_date DATE;
    DECLARE v_dow INT;
    DECLARE v_emp_id CHAR(36);
    DECLARE v_emp1_id CHAR(36);
    DECLARE v_emp2_id CHAR(36);
    DECLARE v_emp3_id CHAR(36);
    DECLARE v_emp4_id CHAR(36);
    DECLARE v_emp5_id CHAR(36);
    DECLARE v_clock_in TIME;
    DECLARE v_clock_out TIME;
    DECLARE v_status VARCHAR(50);
    DECLARE v_is_late INT;
    DECLARE v_random INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_cursor CURSOR FOR SELECT id FROM users WHERE email LIKE 'karyawan%@talenta.com';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Get employee IDs
    SELECT id INTO v_emp1_id FROM users WHERE email = 'karyawan1@talenta.com' LIMIT 1;
    SELECT id INTO v_emp2_id FROM users WHERE email = 'karyawan2@talenta.com' LIMIT 1;
    SELECT id INTO v_emp3_id FROM users WHERE email = 'karyawan3@talenta.com' LIMIT 1;
    SELECT id INTO v_emp4_id FROM users WHERE email = 'karyawan4@talenta.com' LIMIT 1;
    SELECT id INTO v_emp5_id FROM users WHERE email = 'karyawan5@talenta.com' LIMIT 1;

    SET v_start_date = DATE(CONCAT(p_year, '-', LPAD(p_month, 2, '0'), '-01'));
    SET v_end_date = LAST_DAY(v_start_date);
    SET v_curr_date = v_start_date;

    WHILE v_curr_date <= v_end_date DO
        SET v_dow = DAYOFWEEK(v_curr_date); -- 1=Sunday, 7=Saturday
        
        -- Skip weekends
        IF v_dow != 1 AND v_dow != 7 THEN
            -- Process each employee
            SET @emp_ids = v_emp1_id;
            
            -- Employee 1: Mostly on time, some late (80/20)
            SET v_random = FLOOR(RAND() * 10);
            IF v_random < 2 THEN
                SET v_clock_in = MAKETIME(8, 15 + FLOOR(RAND() * 45), 0);
                SET v_status = 'late';
            ELSE
                SET v_clock_in = MAKETIME(7, 30 + FLOOR(RAND() * 30), 0);
                SET v_status = 'present';
            END IF;
            SET v_clock_out = ADDTIME(v_clock_in, '08:00:00');
            
            INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
            VALUES (UUID(), v_emp1_id, v_curr_date, 
                    TIMESTAMP(v_curr_date, v_clock_in), TIMESTAMP(v_curr_date, v_clock_out),
                    -6.2 + RAND() * 0.01, 106.8 + RAND() * 0.01, -6.2 + RAND() * 0.01, 106.8 + RAND() * 0.01,
                    v_status, 8.0, CONCAT(p_year, '-', LPAD(p_month, 2, '0')));
            
            -- Employee 2: 50/50 late vs on time
            SET v_random = FLOOR(RAND() * 10);
            IF v_random < 5 THEN
                SET v_clock_in = MAKETIME(8, 10 + FLOOR(RAND() * 50), 0);
                SET v_status = 'late';
            ELSE
                SET v_clock_in = MAKETIME(7, 35 + FLOOR(RAND() * 25), 0);
                SET v_status = 'present';
            END IF;
            SET v_clock_out = ADDTIME(v_clock_in, '08:00:00');
            
            INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
            VALUES (UUID(), v_emp2_id, v_curr_date, 
                    TIMESTAMP(v_curr_date, v_clock_in), TIMESTAMP(v_curr_date, v_clock_out),
                    -6.2 + RAND() * 0.01, 106.8 + RAND() * 0.01, -6.2 + RAND() * 0.01, 106.8 + RAND() * 0.01,
                    v_status, 8.0, CONCAT(p_year, '-', LPAD(p_month, 2, '0')));
            
            -- Employee 3: Mostly on time, occasionally late (90/10)
            SET v_random = FLOOR(RAND() * 10);
            IF v_random < 1 THEN
                SET v_clock_in = MAKETIME(8, 5 + FLOOR(RAND() * 55), 0);
                SET v_status = 'late';
            ELSE
                SET v_clock_in = MAKETIME(7, 25 + FLOOR(RAND() * 35), 0);
                SET v_status = 'present';
            END IF;
            SET v_clock_out = ADDTIME(v_clock_in, '08:00:00');
            
            INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
            VALUES (UUID(), v_emp3_id, v_curr_date, 
                    TIMESTAMP(v_curr_date, v_clock_in), TIMESTAMP(v_curr_date, v_clock_out),
                    -6.2 + RAND() * 0.01, 106.8 + RAND() * 0.01, -6.2 + RAND() * 0.01, 106.8 + RAND() * 0.01,
                    v_status, 8.0, CONCAT(p_year, '-', LPAD(p_month, 2, '0')));
            
            -- Employee 4: Good attendance (95/5)
            SET v_random = FLOOR(RAND() * 20);
            IF v_random < 1 THEN
                SET v_clock_in = MAKETIME(8, 10 + FLOOR(RAND() * 50), 0);
                SET v_status = 'late';
            ELSE
                SET v_clock_in = MAKETIME(7, 20 + FLOOR(RAND() * 40), 0);
                SET v_status = 'present';
            END IF;
            SET v_clock_out = ADDTIME(v_clock_in, '08:00:00');
            
            INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
            VALUES (UUID(), v_emp4_id, v_curr_date, 
                    TIMESTAMP(v_curr_date, v_clock_in), TIMESTAMP(v_curr_date, v_clock_out),
                    -6.2 + RAND() * 0.01, 106.8 + RAND() * 0.01, -6.2 + RAND() * 0.01, 106.8 + RAND() * 0.01,
                    v_status, 8.0, CONCAT(p_year, '-', LPAD(p_month, 2, '0')));
            
            -- Employee 5: Mixed attendance (70/30)
            SET v_random = FLOOR(RAND() * 10);
            IF v_random < 3 THEN
                SET v_clock_in = MAKETIME(8, 20 + FLOOR(RAND() * 40), 0);
                SET v_status = 'late';
            ELSE
                SET v_clock_in = MAKETIME(7, 40 + FLOOR(RAND() * 20), 0);
                SET v_status = 'present';
            END IF;
            SET v_clock_out = ADDTIME(v_clock_in, '08:00:00');
            
            INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month)
            VALUES (UUID(), v_emp5_id, v_curr_date, 
                    TIMESTAMP(v_curr_date, v_clock_in), TIMESTAMP(v_curr_date, v_clock_out),
                    -6.2 + RAND() * 0.01, 106.8 + RAND() * 0.01, -6.2 + RAND() * 0.01, 106.8 + RAND() * 0.01,
                    v_status, 8.0, CONCAT(p_year, '-', LPAD(p_month, 2, '0')));
        END IF;
        
        SET v_curr_date = DATE_ADD(v_curr_date, INTERVAL 1 DAY);
    END WHILE;
END//

DELIMITER ;

-- Generate data for each month
CALL generate_monthly_attendance(2026, 1); -- Januari
CALL generate_monthly_attendance(2026, 2); -- Februari
CALL generate_monthly_attendance(2026, 3); -- Maret
CALL generate_monthly_attendance(2026, 4); -- April

-- Drop the procedure
DROP PROCEDURE IF EXISTS generate_monthly_attendance;

-- Generate some work journals for Jan-Apr
INSERT INTO work_journals (id, user_id, date, content, duration, obstacles, work_result, mood, verification_status)
SELECT UUID(), u.id, '2026-01-15', 'Menyelesaikan project documentation dan code review', 480, 'None', 'Completed', '😊', 'approved'
FROM users u WHERE u.email = 'karyawan1@talenta.com'
AND NOT EXISTS (SELECT 1 FROM work_journals WHERE user_id = u.id AND date = '2026-01-15');

INSERT INTO work_journals (id, user_id, date, content, duration, obstacles, work_result, mood, verification_status)
SELECT UUID(), u.id, '2026-02-10', 'Meeting dengan client dan product development', 480, 'Network issues', 'Client requirements gathered', '🙂', 'approved'
FROM users u WHERE u.email = 'karyawan2@talenta.com'
AND NOT EXISTS (SELECT 1 FROM work_journals WHERE user_id = u.id AND date = '2026-02-10');

INSERT INTO work_journals (id, user_id, date, content, duration, obstacles, work_result, mood, verification_status)
SELECT UUID(), u.id, '2026-03-20', 'Database optimization dan bug fixes', 420, 'Legacy code', 'Performance improved by 30%', '😊', 'approved'
FROM users u WHERE u.email = 'karyawan3@talenta.com'
AND NOT EXISTS (SELECT 1 FROM work_journals WHERE user_id = u.id AND date = '2026-03-20');

INSERT INTO work_journals (id, user_id, date, content, duration, obstacles, work_result, mood, verification_status)
SELECT UUID(), u.id, '2026-04-22', 'UI/UX improvements dan testing', 450, 'Design changes', 'New dashboard design completed', '🙂', 'approved'
FROM users u WHERE u.email = 'karyawan4@talenta.com'
AND NOT EXISTS (SELECT 1 FROM work_journals WHERE user_id = u.id AND date = '2026-04-22');

SELECT CONCAT('Seed data for Jan-Apr 2026 completed! Total records: ', COUNT(*)) AS result FROM attendance;