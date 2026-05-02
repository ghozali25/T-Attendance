-- Attendance Seed Data (Jan - May 2026)
USE t_absensi;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM attendance;
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0146e3e7-a25d-4f14-8a6a-225b7fb7cc19', id, '2026-01-02', '2026-01-02 07:35:00', '2026-01-02 17:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.28, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f6568270-a6d2-48e0-b47a-e100d7301a3f', id, '2026-01-02', '2026-01-02 07:15:00', '2026-01-02 17:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.42, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '42da2b24-7c24-4536-b93d-193a79118176', id, '2026-01-02', '2026-01-02 07:02:00', '2026-01-02 18:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.73, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '41577191-03d1-4bc3-8416-ae559da81494', id, '2026-01-02', '2026-01-02 07:37:00', '2026-01-02 18:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.87, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '17ea5bf4-b794-495b-9dd7-02701b5e747d', id, '2026-01-02', '2026-01-02 08:11:00', '2026-01-02 18:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.07, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'abb2146d-da95-450b-ad46-5a6a49bbf3fb', id, '2026-01-05', '2026-01-05 07:19:00', '2026-01-05 17:11:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.87, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8df90d33-62b5-4be0-806b-f7aab9f9d451', id, '2026-01-05', '2026-01-05 07:17:00', '2026-01-05 18:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.40, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '75fec830-825d-4c38-a7a3-991d67398f14', id, '2026-01-05', '2026-01-05 08:19:00', '2026-01-05 18:45:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.43, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'bd87fad6-8e8f-44cb-abfa-284b572b3278', id, '2026-01-05', '2026-01-05 07:14:00', '2026-01-05 18:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.62, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'babafb05-ef0a-41d5-9841-f7b53c00d13c', id, '2026-01-05', '2026-01-05 07:35:00', '2026-01-05 17:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.42, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd9d55e0c-e2b9-477f-8d7b-f98eaa20493a', id, '2026-01-06', '2026-01-06 07:11:00', '2026-01-06 18:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.67, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd080cf3a-dec0-4424-92fc-92bd2d2de7c4', id, '2026-01-06', '2026-01-06 07:53:00', '2026-01-06 18:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.40, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fa45d90a-cf9b-4ecd-8698-55a53553897e', id, '2026-01-06', '2026-01-06 07:13:00', '2026-01-06 17:59:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.77, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b10d31bf-8eb2-474d-8664-8b198fdf4846', id, '2026-01-06', '2026-01-06 07:03:00', '2026-01-06 17:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.52, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ab93d2f9-5bd6-4d2c-babf-9cd7b0670326', id, '2026-01-07', '2026-01-07 07:45:00', '2026-01-07 17:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.80, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '94a60d0b-92cb-426c-9979-2a9091b3ecfb', id, '2026-01-07', '2026-01-07 07:52:00', '2026-01-07 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd4c95509-6cd9-445c-b475-36e421da158c', id, '2026-01-07', '2026-01-07 07:03:00', '2026-01-07 17:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.07, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9a628c62-965d-4fdb-8c08-22dea4378b60', id, '2026-01-07', '2026-01-07 07:56:00', '2026-01-07 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.00, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e693d55b-0fcf-4042-bb35-86d6c42eb9af', id, '2026-01-07', '2026-01-07 07:33:00', '2026-01-07 18:59:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.43, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3c03aea2-bcff-4493-8514-705e41e47916', id, '2026-01-08', '2026-01-08 07:51:00', '2026-01-08 17:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.28, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f659c9ea-f25a-40b5-98c5-7f8e32962b27', id, '2026-01-08', '2026-01-08 07:24:00', '2026-01-08 18:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.88, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '99596979-d140-4295-970b-923ffc47bd86', id, '2026-01-08', '2026-01-08 08:48:00', '2026-01-08 17:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.28, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1ff18b44-de84-45ea-bafc-e4500a9c25bb', id, '2026-01-08', '2026-01-08 07:20:00', '2026-01-08 18:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.30, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1850a67f-f796-49b0-8624-960b7e9972a0', id, '2026-01-08', '2026-01-08 08:00:00', '2026-01-08 18:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.13, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a5313440-9073-4ca7-b9f6-75f4a70481c5', id, '2026-01-09', '2026-01-09 08:57:00', '2026-01-09 17:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.18, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd047cd58-a426-4fc9-9970-9d73b9c03039', id, '2026-01-09', '2026-01-09 07:11:00', '2026-01-09 17:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.95, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7bf01134-ce1c-4d5c-9a88-810335c0e22e', id, '2026-01-09', '2026-01-09 07:40:00', '2026-01-09 18:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.38, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9f9adcb5-1bfc-49af-9938-e16ad6c57aa8', id, '2026-01-09', '2026-01-09 07:24:00', '2026-01-09 17:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.72, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6e38ad00-25fe-442d-b845-30fd792e1710', id, '2026-01-09', '2026-01-09 07:55:00', '2026-01-09 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.48, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cbef5101-c568-46b9-a504-bed1e6e3b738', id, '2026-01-13', '2026-01-13 07:25:00', '2026-01-13 17:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.25, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '96eb585d-73b5-492f-a39b-44db68987ee0', id, '2026-01-13', '2026-01-13 07:14:00', '2026-01-13 17:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.72, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '09343a48-768d-418a-9a36-f7f3467c99ae', id, '2026-01-13', '2026-01-13 07:02:00', '2026-01-13 18:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.25, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '35b84b89-e992-4819-a299-15685b0df32e', id, '2026-01-13', '2026-01-13 07:49:00', '2026-01-13 18:27:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.63, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '749db3e3-beaa-48f8-955a-82d5d760049b', id, '2026-01-14', '2026-01-14 07:22:00', '2026-01-14 18:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.20, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '01cd7bdc-028f-49d5-b539-6c9db9a1041b', id, '2026-01-14', '2026-01-14 07:16:00', '2026-01-14 17:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.02, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5877273b-628f-4be9-8623-e039f9085fd1', id, '2026-01-14', '2026-01-14 07:31:00', '2026-01-14 18:01:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.50, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '59757f75-f468-416c-99a2-6022d13620da', id, '2026-01-14', '2026-01-14 07:13:00', '2026-01-14 17:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.45, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '54cef0fe-4747-447d-8284-197a425f6d1f', id, '2026-01-14', '2026-01-14 07:50:00', '2026-01-14 18:48:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4e95d0cf-b23d-4ed1-ba23-95c9ed8d5ae4', id, '2026-01-15', '2026-01-15 07:11:00', '2026-01-15 18:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.38, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cdc85561-17b8-430b-ae70-c5ba832ac4b1', id, '2026-01-15', '2026-01-15 07:02:00', '2026-01-15 18:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.07, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '60db1ff2-2e86-4e23-9f64-1f695c1eb35a', id, '2026-01-15', '2026-01-15 07:11:00', '2026-01-15 17:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.23, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '841e0d22-6f43-41a7-9ee2-636cf73fc354', id, '2026-01-15', '2026-01-15 07:41:00', '2026-01-15 17:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.18, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c5f9ac93-64af-424a-90dd-c1327a4c854a', id, '2026-01-16', '2026-01-16 07:02:00', '2026-01-16 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.12, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'faf02650-1e86-463e-a72e-595bfd031465', id, '2026-01-16', '2026-01-16 07:12:00', '2026-01-16 17:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.57, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b41d15bf-c7a7-4606-8cfa-4cb7b716d8ec', id, '2026-01-16', '2026-01-16 07:32:00', '2026-01-16 18:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.77, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5ee32267-49e4-4256-8a51-a44a9b6cc9c2', id, '2026-01-16', '2026-01-16 07:04:00', '2026-01-16 18:01:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.95, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7456d14c-eaa8-40d3-a6af-05dcb1aa3016', id, '2026-01-16', '2026-01-16 07:08:00', '2026-01-16 18:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.02, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '339c6f74-6547-4715-a1b3-6d750e69a0d3', id, '2026-01-19', '2026-01-19 07:44:00', '2026-01-19 18:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.43, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f6f46bf2-4446-405f-8f0f-0b7a591536ad', id, '2026-01-19', '2026-01-19 07:59:00', '2026-01-19 18:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.27, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'df74bf09-0f67-429b-a66c-b61456642f19', id, '2026-01-19', '2026-01-19 07:56:00', '2026-01-19 18:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.62, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9ad14c82-772f-4de1-bb7a-fc66113b8f35', id, '2026-01-19', '2026-01-19 08:19:00', '2026-01-19 18:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.68, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b9fb1c10-c063-4604-aa67-e75731e5eb1a', id, '2026-01-19', '2026-01-19 08:31:00', '2026-01-19 18:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.40, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9a0b3099-4674-4f20-8ba9-526f1094edbb', id, '2026-01-20', '2026-01-20 08:51:00', '2026-01-20 18:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.08, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '68d3e88c-8ebb-42e7-b683-090d27bd7b1a', id, '2026-01-20', '2026-01-20 08:16:00', '2026-01-20 17:35:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.32, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eb2e3cb8-b39f-4e12-aa09-d6b1df915562', id, '2026-01-20', '2026-01-20 07:53:00', '2026-01-20 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.52, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'efd3a0c3-6f8b-42df-bbe4-bfb0caa5c340', id, '2026-01-20', '2026-01-20 07:12:00', '2026-01-20 18:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.42, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6bc8cc17-ae20-4f31-ac25-a68d4617b8a5', id, '2026-01-20', '2026-01-20 07:21:00', '2026-01-20 18:59:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.63, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2580dd3b-8f14-4f07-99ee-22b8fb0a0fd5', id, '2026-01-21', '2026-01-21 07:45:00', '2026-01-21 18:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.37, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '84a3a72c-063d-44c7-80ed-e74de8096f38', id, '2026-01-21', '2026-01-21 07:54:00', '2026-01-21 17:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.18, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dc89fc99-7a7f-42e7-898c-5ce5d1a65eff', id, '2026-01-21', '2026-01-21 07:47:00', '2026-01-21 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.37, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4954888f-f6ea-4e19-99d9-7663695b0aa7', id, '2026-01-21', '2026-01-21 07:52:00', '2026-01-21 17:54:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.03, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '22b6a401-2bbb-4fd1-8d0b-e01fea38d641', id, '2026-01-21', '2026-01-21 07:46:00', '2026-01-21 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.50, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd8200898-50a0-4a5f-857f-eda81f26d6c3', id, '2026-01-22', '2026-01-22 07:24:00', '2026-01-22 17:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.87, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4b1d6fd5-4b77-4888-8e58-cf34f959251a', id, '2026-01-22', '2026-01-22 07:44:00', '2026-01-22 18:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.62, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a5a0946b-0ed5-4f99-888f-f9becef2af2c', id, '2026-01-22', '2026-01-22 07:53:00', '2026-01-22 17:14:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.35, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b1bf13fe-ad2f-481f-b995-9cc60b158cc9', id, '2026-01-22', '2026-01-22 08:55:00', '2026-01-22 17:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.03, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0f1a99a7-efb4-4a53-91c5-bfddc3a7c4e6', id, '2026-01-22', '2026-01-22 07:54:00', '2026-01-22 18:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.72, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b38f057e-98a5-4299-81df-d52b45f28d7e', id, '2026-01-23', '2026-01-23 07:03:00', '2026-01-23 18:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.87, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '80040230-cd23-4ae2-80c6-4881ac5ac72d', id, '2026-01-23', '2026-01-23 08:31:00', '2026-01-23 18:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.42, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '13a47d78-9803-46ec-8b9a-a9f8055033d5', id, '2026-01-23', '2026-01-23 07:30:00', '2026-01-23 17:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.47, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2e03873d-f11b-441c-99ef-4b6130d616b8', id, '2026-01-23', '2026-01-23 07:09:00', '2026-01-23 17:49:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.67, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9ad7f0d1-1eef-4611-b0b4-c9097334de88', id, '2026-01-23', '2026-01-23 07:00:00', '2026-01-23 17:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.03, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '590d44db-85ef-40bd-889c-3a91fa67317d', id, '2026-01-27', '2026-01-27 08:26:00', '2026-01-27 17:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.98, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e82e6f0f-1495-4421-a7d7-f36d2b189ac7', id, '2026-01-27', '2026-01-27 07:31:00', '2026-01-27 18:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.73, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd2b3660c-54ca-4fc6-8067-939a6141123c', id, '2026-01-27', '2026-01-27 07:00:00', '2026-01-27 18:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.87, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '506719fb-47a9-48ba-b6a4-0221791b5a86', id, '2026-01-27', '2026-01-27 07:27:00', '2026-01-27 17:49:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.37, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'aa24df42-0013-4f68-bb16-e90d968e2084', id, '2026-01-27', '2026-01-27 08:37:00', '2026-01-27 18:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.33, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0f09f995-1252-4c85-aba1-144e31895021', id, '2026-01-28', '2026-01-28 07:13:00', '2026-01-28 18:11:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eef3dbe7-a215-4dca-a8ea-e7cab9143c86', id, '2026-01-28', '2026-01-28 07:38:00', '2026-01-28 17:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.57, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '26efa806-9486-47b3-bf39-f87551330af8', id, '2026-01-28', '2026-01-28 07:37:00', '2026-01-28 18:48:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.18, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '87b40d60-3d62-414e-bd13-11f447bc0484', id, '2026-01-28', '2026-01-28 08:20:00', '2026-01-28 17:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.63, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8a4333c2-681c-4df0-aff1-17b8409b6f9c', id, '2026-01-28', '2026-01-28 07:58:00', '2026-01-28 18:48:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.83, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '93dfef57-fefe-4538-b075-a780cc8c2546', id, '2026-01-29', '2026-01-29 07:42:00', '2026-01-29 18:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.85, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd2aa2551-4289-4559-9a1e-08987e361f76', id, '2026-01-29', '2026-01-29 07:09:00', '2026-01-29 17:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.48, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a202fd44-e31e-4415-a1ff-680a3da74b24', id, '2026-01-29', '2026-01-29 07:15:00', '2026-01-29 17:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.37, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cde5d80a-adf1-4017-b858-05955c9f350c', id, '2026-01-29', '2026-01-29 08:44:00', '2026-01-29 18:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.95, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '08f22409-cffd-489f-ab8d-3e3a6ea8ebd6', id, '2026-01-29', '2026-01-29 08:32:00', '2026-01-29 18:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.53, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ac2263ca-0742-4a0c-b101-d7fee74e29f8', id, '2026-01-30', '2026-01-30 08:26:00', '2026-01-30 17:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.70, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '49169aef-0550-4e33-9ee3-d083092fa348', id, '2026-01-30', '2026-01-30 07:29:00', '2026-01-30 18:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.30, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '21ba0e7b-11e7-497e-a0f4-c6fae87b7c05', id, '2026-01-30', '2026-01-30 07:15:00', '2026-01-30 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.68, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8af95ec3-4257-4ab6-94ca-0d4ea47f289e', id, '2026-02-02', '2026-02-02 07:31:00', '2026-02-02 18:30:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.98, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '14aff8e7-64d3-4603-b916-0bb7afc8ecc3', id, '2026-02-02', '2026-02-02 07:04:00', '2026-02-02 18:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.22, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f68e750d-d223-44ce-87f2-548cd54e224b', id, '2026-02-02', '2026-02-02 08:56:00', '2026-02-02 17:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.85, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7816bc9b-e97a-4a1d-8ab1-34506104eeff', id, '2026-02-02', '2026-02-02 07:57:00', '2026-02-02 18:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.02, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '63c7e155-a4ea-44ce-b5ca-94837f469f60', id, '2026-02-02', '2026-02-02 07:02:00', '2026-02-02 18:49:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.78, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ef4d4f10-b2cb-450d-99d2-6595c07ec557', id, '2026-02-03', '2026-02-03 07:40:00', '2026-02-03 18:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.72, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c9b8567f-5bde-4eeb-8894-a654fe4f6b31', id, '2026-02-03', '2026-02-03 07:22:00', '2026-02-03 18:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.57, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '93c88637-5025-4c4b-8cfa-7f52bb7682e8', id, '2026-02-03', '2026-02-03 08:39:00', '2026-02-03 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.28, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6bdfb60d-43ee-40d7-b8c6-207f8f22b021', id, '2026-02-03', '2026-02-03 07:36:00', '2026-02-03 17:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.78, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd8919f88-e8e8-4002-a851-aa635d35843c', id, '2026-02-03', '2026-02-03 08:17:00', '2026-02-03 17:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.82, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '623b020a-8ae1-43d7-b19d-e747257101b2', id, '2026-02-04', '2026-02-04 07:18:00', '2026-02-04 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.30, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2e12ff16-716e-42b2-9bb0-7f9c5ec5e61a', id, '2026-02-04', '2026-02-04 08:33:00', '2026-02-04 18:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.50, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7b5de747-5109-4bc6-8922-30e8c9bb3b3b', id, '2026-02-04', '2026-02-04 07:31:00', '2026-02-04 17:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.68, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '34bf68e7-5bc3-4a06-99ba-890ce10ecbfe', id, '2026-02-04', '2026-02-04 07:53:00', '2026-02-04 18:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.58, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '60c599b9-719d-48f2-9542-76e545cf0e5c', id, '2026-02-04', '2026-02-04 07:26:00', '2026-02-04 17:44:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.30, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '46d96b18-eb09-425b-aa9e-36db77eec634', id, '2026-02-05', '2026-02-05 07:25:00', '2026-02-05 18:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.70, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6d04052b-ae00-45c4-99ee-7d0f867cbf75', id, '2026-02-05', '2026-02-05 07:17:00', '2026-02-05 18:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.85, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f13dee5a-b06c-4d43-90de-28b15a2b029a', id, '2026-02-05', '2026-02-05 07:03:00', '2026-02-05 17:30:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.45, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'edfedd63-d5b9-49ed-9ac3-e9c505497411', id, '2026-02-05', '2026-02-05 07:41:00', '2026-02-05 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.83, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '23456579-ba3f-447d-a320-eb555783997c', id, '2026-02-05', '2026-02-05 07:21:00', '2026-02-05 18:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.65, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '89d68d2f-e403-4b31-8c95-56ea62cd68b4', id, '2026-02-06', '2026-02-06 07:54:00', '2026-02-06 17:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.67, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '65fbd3cd-5db4-44ff-af07-56cd56aa1f72', id, '2026-02-06', '2026-02-06 07:17:00', '2026-02-06 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.12, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '73991025-99b5-47e8-9744-034aa34e2f9e', id, '2026-02-06', '2026-02-06 07:35:00', '2026-02-06 17:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.73, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e88bb28a-10e2-4602-a85c-1d0892207490', id, '2026-02-06', '2026-02-06 07:33:00', '2026-02-06 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.38, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '86812af7-35c1-48de-9be5-a68971beb7a9', id, '2026-02-09', '2026-02-09 07:25:00', '2026-02-09 17:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.07, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ae419aa5-b74a-4b53-8bd5-e3c3c525a808', id, '2026-02-09', '2026-02-09 07:33:00', '2026-02-09 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.28, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '44fde1af-eea7-4631-bbfd-14baae94c14c', id, '2026-02-09', '2026-02-09 07:41:00', '2026-02-09 17:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.42, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b0270366-6903-483a-bdd1-9d6f507f615b', id, '2026-02-09', '2026-02-09 07:33:00', '2026-02-09 18:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.32, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4cb98d7d-7fd4-4f48-b368-f98b97cb4186', id, '2026-02-09', '2026-02-09 07:22:00', '2026-02-09 17:45:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.38, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1f833118-9f1a-4b10-a8f0-12d59bcd15b5', id, '2026-02-10', '2026-02-10 07:04:00', '2026-02-10 18:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.10, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '75d8f3f6-2e02-44eb-9cae-40df02bb28d4', id, '2026-02-10', '2026-02-10 07:44:00', '2026-02-10 17:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.10, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '716652eb-6b7a-4fde-9656-4dd422960119', id, '2026-02-10', '2026-02-10 07:20:00', '2026-02-10 17:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.98, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4f9ae133-bc92-4b84-8b70-171e6d8efc68', id, '2026-02-10', '2026-02-10 07:28:00', '2026-02-10 18:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.18, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1de9789e-fa5d-45dd-8b1f-35faff58704a', id, '2026-02-10', '2026-02-10 07:52:00', '2026-02-10 17:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.62, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5f4af426-48be-4875-831f-4a167e5a2915', id, '2026-02-11', '2026-02-11 07:02:00', '2026-02-11 18:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.82, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8ca7f785-525b-449c-a5ed-98ed987fd6b4', id, '2026-02-11', '2026-02-11 07:49:00', '2026-02-11 18:54:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.08, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b440189f-f0ac-4312-9e80-521762beaf01', id, '2026-02-11', '2026-02-11 07:10:00', '2026-02-11 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.35, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8bd87ab0-0f52-4b50-a9a7-3a0f1e2a15e7', id, '2026-02-11', '2026-02-11 07:23:00', '2026-02-11 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.97, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eb863592-0f2b-42dd-a77a-8bb2b35fd462', id, '2026-02-11', '2026-02-11 07:19:00', '2026-02-11 17:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.68, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2aea3e2e-3289-43fd-ac74-b0bb15b7183a', id, '2026-02-12', '2026-02-12 07:24:00', '2026-02-12 17:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.88, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cb54f52e-fe9c-4d9a-a381-cb419fb30791', id, '2026-02-12', '2026-02-12 08:20:00', '2026-02-12 17:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.10, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd668c740-05e7-4b4b-9554-4c2296bb7c6c', id, '2026-02-12', '2026-02-12 07:13:00', '2026-02-12 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.72, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2b6359f8-746c-406c-b886-9b635abbdbaf', id, '2026-02-12', '2026-02-12 07:30:00', '2026-02-12 17:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.28, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0a88b120-5363-4f53-9d58-8a835d9f9fb8', id, '2026-02-12', '2026-02-12 07:24:00', '2026-02-12 17:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.07, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fd1c79dd-91e8-42f5-9bc1-1c07b455ce6d', id, '2026-02-13', '2026-02-13 08:57:00', '2026-02-13 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.98, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '149c2603-223c-4a06-95cc-10a4c38aad15', id, '2026-02-13', '2026-02-13 08:39:00', '2026-02-13 17:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.77, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eb559f25-f73f-42f9-80fe-4d2f775ffa21', id, '2026-02-13', '2026-02-13 07:53:00', '2026-02-13 18:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.98, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dba2b012-a55f-40db-8c72-d84a973576fc', id, '2026-02-13', '2026-02-13 08:24:00', '2026-02-13 17:27:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.05, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7ce62216-0f23-4d56-8a29-6e2daa93de22', id, '2026-02-13', '2026-02-13 07:52:00', '2026-02-13 18:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.13, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '95c610b7-a644-4c75-ad7f-74cbc71ee4a2', id, '2026-02-16', '2026-02-16 07:47:00', '2026-02-16 18:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.22, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '36a09977-7fba-4d5a-8704-374135d44738', id, '2026-02-16', '2026-02-16 07:11:00', '2026-02-16 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.42, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '93ffad5d-6011-4df1-bd5c-80457c251ab0', id, '2026-02-16', '2026-02-16 08:32:00', '2026-02-16 17:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.50, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '28978c70-8da2-447d-80da-f082daf2d75b', id, '2026-02-16', '2026-02-16 07:06:00', '2026-02-16 17:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.55, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2ed94c7d-89e3-4477-869a-ca3258b321fc', id, '2026-02-17', '2026-02-17 07:18:00', '2026-02-17 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.53, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3af9f42d-a03e-48e2-8db5-a868fa9ef3d6', id, '2026-02-17', '2026-02-17 07:40:00', '2026-02-17 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.73, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a044f154-f6ef-4150-b481-7aa3dc5c23b3', id, '2026-02-17', '2026-02-17 07:05:00', '2026-02-17 18:13:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.13, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '802e416f-9899-46a2-a10c-2b103ffb10cc', id, '2026-02-17', '2026-02-17 07:05:00', '2026-02-17 18:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e0df0ca9-c00a-4786-a71d-9d2367729370', id, '2026-02-17', '2026-02-17 07:19:00', '2026-02-17 17:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.82, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '87f7a467-08b7-437b-84b5-542027ec7a5d', id, '2026-02-18', '2026-02-18 07:25:00', '2026-02-18 18:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.23, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b03b2da3-b0ac-4f0e-8b81-0f3be0c1d2c2', id, '2026-02-18', '2026-02-18 07:05:00', '2026-02-18 18:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.12, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9f82cb59-c962-4c53-bda6-fb7858d32458', id, '2026-02-18', '2026-02-18 08:49:00', '2026-02-18 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.12, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '36baa87a-9786-4d72-8790-81c8ca284cb4', id, '2026-02-18', '2026-02-18 07:26:00', '2026-02-18 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '74347197-5f71-4412-a394-15530ed8e2ae', id, '2026-02-18', '2026-02-18 07:33:00', '2026-02-18 18:44:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.18, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f2b94616-42c8-4f3b-9d77-f52bceda5f9a', id, '2026-02-19', '2026-02-19 07:17:00', '2026-02-19 18:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.92, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6e7cfe32-7143-49f1-9c6a-2779f61d53b2', id, '2026-02-19', '2026-02-19 08:17:00', '2026-02-19 18:32:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.25, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b8708fcc-2765-40e8-bafb-196eec1725fe', id, '2026-02-19', '2026-02-19 08:57:00', '2026-02-19 17:43:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.77, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b616d793-ffa9-44b0-a523-bf8c01dbef02', id, '2026-02-19', '2026-02-19 07:12:00', '2026-02-19 18:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.40, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '26b961bb-8926-4aaf-8793-7b2085e9dbd5', id, '2026-02-19', '2026-02-19 07:12:00', '2026-02-19 17:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.37, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b9a06ea5-73cf-4080-ad57-8291ff41ffae', id, '2026-02-20', '2026-02-20 08:49:00', '2026-02-20 18:42:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.88, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd56eaa22-aedb-45e4-b810-a67d0fc669d6', id, '2026-02-20', '2026-02-20 08:20:00', '2026-02-20 17:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.98, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1f278c0e-278b-443d-a3a4-1d76e42e3327', id, '2026-02-20', '2026-02-20 07:48:00', '2026-02-20 18:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.82, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7c29c255-9c81-42d6-adcf-e62c990d0073', id, '2026-02-20', '2026-02-20 07:52:00', '2026-02-20 18:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.33, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '22714df9-6dfd-4d78-891f-caa27fe2d386', id, '2026-02-20', '2026-02-20 08:08:00', '2026-02-20 18:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.22, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cf8e2073-978a-45bd-8fe1-2b91eb58a631', id, '2026-02-23', '2026-02-23 07:02:00', '2026-02-23 18:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.35, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '065f2eee-bf4c-4522-a6a6-e025256c8ab0', id, '2026-02-23', '2026-02-23 07:20:00', '2026-02-23 17:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.52, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7be99779-dd04-4205-a71d-1fe67fe3ec1f', id, '2026-02-23', '2026-02-23 07:34:00', '2026-02-23 17:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.27, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ba42fff1-701d-4638-992e-1909821e0622', id, '2026-02-23', '2026-02-23 08:25:00', '2026-02-23 18:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.83, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3c6752de-9d34-4537-8561-f523fd9e6229', id, '2026-02-23', '2026-02-23 07:04:00', '2026-02-23 17:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.62, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b4e8f3ca-ea16-472a-a212-808c4b6d44ef', id, '2026-02-24', '2026-02-24 07:58:00', '2026-02-24 18:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.45, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1ba65049-d61d-4de7-bfde-2ed393c532f1', id, '2026-02-24', '2026-02-24 08:14:00', '2026-02-24 17:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.53, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a945b911-a26e-44d4-a29a-04f613544da7', id, '2026-02-24', '2026-02-24 07:15:00', '2026-02-24 17:43:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.47, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'be7da21f-af0f-4435-b8a9-4ab6987cd32b', id, '2026-02-24', '2026-02-24 07:02:00', '2026-02-24 18:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.17, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5810415f-5ed9-4908-8c6a-f7c93bc31df7', id, '2026-02-25', '2026-02-25 07:49:00', '2026-02-25 18:53:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.07, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c0a9faa6-ce11-46ef-a07e-82c0a7e645cd', id, '2026-02-25', '2026-02-25 07:59:00', '2026-02-25 17:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.43, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3b223f2a-1ee9-4952-891a-a0efe802e030', id, '2026-02-25', '2026-02-25 07:43:00', '2026-02-25 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.88, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1a7e0c4b-f307-4151-8f0c-7391d88a9014', id, '2026-02-25', '2026-02-25 07:59:00', '2026-02-25 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.85, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '66fe1594-c4df-40ed-9fc7-e3151a597324', id, '2026-02-25', '2026-02-25 07:18:00', '2026-02-25 18:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.75, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fef3ce74-7c98-4c17-8af8-04aa8b7e580c', id, '2026-02-26', '2026-02-26 07:53:00', '2026-02-26 18:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.78, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '23855789-a453-4d61-ae3c-d6a938cb9fb2', id, '2026-02-26', '2026-02-26 07:57:00', '2026-02-26 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.40, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c4079bdf-d901-4588-88bf-36129b53ea97', id, '2026-02-26', '2026-02-26 07:28:00', '2026-02-26 17:22:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.90, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0a2377f6-14e6-4bfe-9d47-e358e5e6d9ae', id, '2026-02-26', '2026-02-26 08:36:00', '2026-02-26 17:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.50, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '726e3ea7-20a6-4c70-8eb9-5409ac744c90', id, '2026-02-26', '2026-02-26 07:07:00', '2026-02-26 18:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '316bf27f-4269-4934-ade7-c047177825af', id, '2026-02-27', '2026-02-27 07:32:00', '2026-02-27 17:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.85, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'aadcaaf4-f0fa-4f19-9509-ca2b061ef31f', id, '2026-02-27', '2026-02-27 07:00:00', '2026-02-27 18:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.08, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3f7c2743-29d6-45cb-96e8-c78a08bd44f3', id, '2026-02-27', '2026-02-27 07:16:00', '2026-02-27 17:45:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.48, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'adbc6146-d1ca-4e56-bc7c-b8c8524053c8', id, '2026-02-27', '2026-02-27 07:09:00', '2026-02-27 17:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.93, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e001aca9-40ce-4488-985a-c65629ed8df0', id, '2026-02-27', '2026-02-27 07:22:00', '2026-02-27 17:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.70, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '87e3a2ee-fda1-4e5c-8a28-a02a4e9d22a9', id, '2026-03-02', '2026-03-02 07:01:00', '2026-03-02 18:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.18, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'db5f5786-d098-4faf-9eef-4dc9a6538a99', id, '2026-03-02', '2026-03-02 07:10:00', '2026-03-02 17:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.27, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '57022594-36f9-49b8-8db8-aa2a95ed9451', id, '2026-03-02', '2026-03-02 08:37:00', '2026-03-02 18:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.52, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c91169e9-9d3e-4774-ab7c-36c0516de8cc', id, '2026-03-02', '2026-03-02 07:53:00', '2026-03-02 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.72, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8a13c8ce-caa8-4524-913a-e2e4385c79d6', id, '2026-03-02', '2026-03-02 07:11:00', '2026-03-02 17:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.88, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1f785bb1-2a32-4c5c-b9f0-308865ec22b3', id, '2026-03-03', '2026-03-03 07:08:00', '2026-03-03 18:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.73, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '89794f25-485e-4349-9b8e-dff1011f5ac8', id, '2026-03-03', '2026-03-03 07:31:00', '2026-03-03 18:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.33, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a86b3c17-d4bb-4031-8392-173fa388e533', id, '2026-03-03', '2026-03-03 07:19:00', '2026-03-03 17:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.00, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd969f1e2-125e-4830-ba4b-4d3d30274009', id, '2026-03-03', '2026-03-03 07:13:00', '2026-03-03 17:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.40, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a86dc588-a6af-4675-a87e-1bf8551935dc', id, '2026-03-03', '2026-03-03 07:34:00', '2026-03-03 18:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.50, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a1f195ff-8f00-4afb-8494-b63fc95f41ea', id, '2026-03-04', '2026-03-04 08:35:00', '2026-03-04 18:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.58, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1f4edf41-577d-4a8b-b453-be2e29bb4279', id, '2026-03-04', '2026-03-04 07:37:00', '2026-03-04 18:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.33, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dcec00d0-efa1-48cf-b3a2-21dfe9739408', id, '2026-03-04', '2026-03-04 07:48:00', '2026-03-04 18:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.82, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8150ad1f-8932-4f49-b51e-36812b952b20', id, '2026-03-04', '2026-03-04 07:50:00', '2026-03-04 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.20, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ddfa60ca-fe59-45d1-8e58-6b852b98ff42', id, '2026-03-04', '2026-03-04 07:14:00', '2026-03-04 18:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.93, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c49fa2fc-f370-4316-9ee1-e7e45f390f2c', id, '2026-03-05', '2026-03-05 07:10:00', '2026-03-05 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.98, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '940bbf31-804f-42b0-ab9c-4b9ac234c7af', id, '2026-03-05', '2026-03-05 07:53:00', '2026-03-05 17:54:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.02, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0d3c40b0-2070-4239-b45a-302428b8e56e', id, '2026-03-05', '2026-03-05 07:59:00', '2026-03-05 18:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.08, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ad45ec5b-3f21-4c96-a17a-2ac3760a5660', id, '2026-03-05', '2026-03-05 08:25:00', '2026-03-05 17:30:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.08, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '060ed780-2b36-4836-877f-20f3be941e07', id, '2026-03-06', '2026-03-06 07:33:00', '2026-03-06 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.38, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a5126687-fe44-4793-80c6-5c5880fee2e4', id, '2026-03-06', '2026-03-06 07:14:00', '2026-03-06 17:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.68, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b5352342-b68a-4123-9f5b-2fd526594193', id, '2026-03-06', '2026-03-06 08:50:00', '2026-03-06 18:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.32, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a99512b4-b63e-40e0-9682-73c63e0e8427', id, '2026-03-06', '2026-03-06 07:30:00', '2026-03-06 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.90, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9635e5c8-61dd-4dfb-bff7-c868b61f1b8a', id, '2026-03-09', '2026-03-09 07:02:00', '2026-03-09 17:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.63, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b9f62aa0-5159-459a-a51f-1905a6d0c317', id, '2026-03-09', '2026-03-09 07:33:00', '2026-03-09 18:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.10, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c3ee95ce-bb1c-47f0-a888-bcd97544b5f9', id, '2026-03-09', '2026-03-09 07:03:00', '2026-03-09 18:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.25, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dcfcceaa-7448-40cc-982f-7248e967ad52', id, '2026-03-09', '2026-03-09 08:33:00', '2026-03-09 18:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.83, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd2800f8a-8bb8-41b8-8ead-109b4991d0c7', id, '2026-03-09', '2026-03-09 07:26:00', '2026-03-09 18:13:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.78, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eae565e9-4b13-424a-906e-e0696c9b9add', id, '2026-03-10', '2026-03-10 07:09:00', '2026-03-10 18:35:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.43, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fddd07a0-82a0-4630-872f-61d18b9dc954', id, '2026-03-10', '2026-03-10 07:31:00', '2026-03-10 17:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.92, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4366b0d7-52c6-4823-b575-2d5d517f9e8d', id, '2026-03-10', '2026-03-10 07:46:00', '2026-03-10 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.58, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd7b9279a-bb40-4aaa-a404-db31bb9995d2', id, '2026-03-10', '2026-03-10 07:31:00', '2026-03-10 18:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.87, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dcb0ba6d-8beb-4567-9257-46377d034ee8', id, '2026-03-11', '2026-03-11 07:07:00', '2026-03-11 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.23, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b5195cb6-7ec3-4c3e-9147-fb5a93d00e00', id, '2026-03-11', '2026-03-11 08:55:00', '2026-03-11 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.35, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '08acb951-1214-4885-a49d-5fbd479d192e', id, '2026-03-11', '2026-03-11 07:18:00', '2026-03-11 18:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.00, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'aa3d3cc8-c971-4f20-8c4d-aee7312c0d9f', id, '2026-03-11', '2026-03-11 07:16:00', '2026-03-11 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.25, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4ec97fc7-e12d-4196-98e2-aff2066e4fc4', id, '2026-03-11', '2026-03-11 07:17:00', '2026-03-11 18:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.15, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0d9ea5e4-27e7-4511-8015-c507272224d4', id, '2026-03-12', '2026-03-12 07:46:00', '2026-03-12 17:48:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.03, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ea7c0208-89a7-4afa-b872-0bfe92a42b65', id, '2026-03-12', '2026-03-12 07:23:00', '2026-03-12 18:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.05, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eed2403a-94fd-40ba-897f-571f53e5d106', id, '2026-03-12', '2026-03-12 07:14:00', '2026-03-12 17:43:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.48, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '35d1f44e-b355-48dd-b377-16640afef35a', id, '2026-03-12', '2026-03-12 07:00:00', '2026-03-12 17:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b7dcef7d-5bfe-4422-932a-9663d68ae20c', id, '2026-03-12', '2026-03-12 07:53:00', '2026-03-12 17:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.73, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '60615fab-384e-479a-be2d-08dbb3d9c069', id, '2026-03-13', '2026-03-13 08:49:00', '2026-03-13 17:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.62, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9ddac4c0-fda5-4595-b8d8-8f8a0fa2996a', id, '2026-03-13', '2026-03-13 07:10:00', '2026-03-13 17:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.10, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4b1b2a77-6780-4f01-aa73-ea1003ad8738', id, '2026-03-13', '2026-03-13 07:21:00', '2026-03-13 18:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.22, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fcbe79a5-70b4-4b85-95d3-8de486efcee9', id, '2026-03-13', '2026-03-13 08:45:00', '2026-03-13 18:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.60, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7c7ef39e-3274-4c9d-9032-5d5fa0de8d79', id, '2026-03-13', '2026-03-13 07:19:00', '2026-03-13 17:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.33, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '26b6df3f-2c78-46b8-8166-6d020278995e', id, '2026-03-16', '2026-03-16 08:56:00', '2026-03-16 18:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.23, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9251dfe9-a289-4021-93fa-05fa79a152b8', id, '2026-03-16', '2026-03-16 08:39:00', '2026-03-16 17:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.12, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '90792390-e749-4b32-93ad-5b43d4d75726', id, '2026-03-16', '2026-03-16 07:13:00', '2026-03-16 17:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.45, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5bb57153-d7ed-4dd6-9692-04f5398a439e', id, '2026-03-16', '2026-03-16 07:03:00', '2026-03-16 18:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.42, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '88bb63ac-33d4-446b-a084-c1a1064f8cd8', id, '2026-03-16', '2026-03-16 08:55:00', '2026-03-16 18:53:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.97, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd4b855ec-1a90-4d00-9c8b-eeeba898073b', id, '2026-03-17', '2026-03-17 08:39:00', '2026-03-17 17:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.02, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2d978b07-cee0-4911-876f-b5183e973601', id, '2026-03-17', '2026-03-17 07:33:00', '2026-03-17 17:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.48, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '661ac2b1-ec72-4254-8a2c-1f22d024ec40', id, '2026-03-17', '2026-03-17 07:01:00', '2026-03-17 17:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.67, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '06184a78-406d-4096-8193-6a331f014796', id, '2026-03-17', '2026-03-17 07:30:00', '2026-03-17 17:44:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.23, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'bf74ce6c-ee77-4d27-95bc-71a9716de689', id, '2026-03-17', '2026-03-17 07:07:00', '2026-03-17 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.15, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a985ecf7-aeb1-4b5b-8431-81b35192e439', id, '2026-03-18', '2026-03-18 07:42:00', '2026-03-18 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.57, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e18b7fe2-af02-46a4-a95d-ab38be37dfd6', id, '2026-03-18', '2026-03-18 07:38:00', '2026-03-18 17:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.32, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dc759791-33c1-463e-b8ee-e7a11cc98752', id, '2026-03-18', '2026-03-18 07:35:00', '2026-03-18 17:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.37, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ead6e814-5e05-41b6-b9d7-5d5bda9842f6', id, '2026-03-18', '2026-03-18 07:58:00', '2026-03-18 18:44:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.77, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7b41ece8-3ae7-4459-8fb1-4721fa5d4826', id, '2026-03-18', '2026-03-18 08:55:00', '2026-03-18 18:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.43, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '81b57f75-b7a2-44f8-9ef5-2a13afc6390e', id, '2026-03-19', '2026-03-19 07:25:00', '2026-03-19 18:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.20, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7216bfe0-5684-4aa2-946a-135872930118', id, '2026-03-19', '2026-03-19 07:54:00', '2026-03-19 18:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6e28cab2-4471-4274-862c-a35b2567cec6', id, '2026-03-19', '2026-03-19 08:16:00', '2026-03-19 17:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.50, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '276519b1-576d-424a-a6f8-8b20cbcadc4b', id, '2026-03-19', '2026-03-19 07:43:00', '2026-03-19 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.55, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3431d548-c243-4cdb-95fe-7dc1c5fe4d0b', id, '2026-03-19', '2026-03-19 07:57:00', '2026-03-19 18:45:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.80, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2248a7a4-5c18-4591-8f3a-84141153b605', id, '2026-03-20', '2026-03-20 07:02:00', '2026-03-20 17:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.05, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7e6b359c-fc89-43c4-8ae0-eb41ece8fb66', id, '2026-03-20', '2026-03-20 07:06:00', '2026-03-20 18:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.83, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '722d9147-2311-4649-9ac3-2e0182c6333b', id, '2026-03-20', '2026-03-20 07:33:00', '2026-03-20 17:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.37, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9aa28a7f-ada2-441a-8238-707ba95309da', id, '2026-03-20', '2026-03-20 07:13:00', '2026-03-20 17:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.62, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6c85fb31-4629-4048-8a76-e2b6ca2e2032', id, '2026-03-20', '2026-03-20 07:42:00', '2026-03-20 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.82, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e0ddadc4-ba44-4c31-a0ed-17ef31c77b85', id, '2026-03-23', '2026-03-23 07:38:00', '2026-03-23 17:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.13, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'aa20b437-633d-47d6-98cb-2230c4deb7fe', id, '2026-03-23', '2026-03-23 07:00:00', '2026-03-23 18:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.10, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3faabb49-aa18-4244-ace2-b7dec0243e46', id, '2026-03-23', '2026-03-23 07:24:00', '2026-03-23 17:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.47, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c6e72075-fb66-44e3-810a-2017e1dcb817', id, '2026-03-23', '2026-03-23 07:11:00', '2026-03-23 18:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.23, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '97750cc4-3db6-4f78-ae08-5e1f231881ff', id, '2026-03-23', '2026-03-23 07:29:00', '2026-03-23 18:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.90, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5f55ba4b-970b-4f34-9309-7a3cb7c3e03d', id, '2026-03-24', '2026-03-24 07:52:00', '2026-03-24 18:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.48, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '02c2537d-398b-4fa4-8e20-d491ebc3fde8', id, '2026-03-24', '2026-03-24 07:34:00', '2026-03-24 17:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.12, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f349dd91-37bb-477e-83f6-4ba541be0493', id, '2026-03-24', '2026-03-24 07:17:00', '2026-03-24 18:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.27, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5b240d96-3340-40f8-a729-a7a49475a5f6', id, '2026-03-24', '2026-03-24 07:56:00', '2026-03-24 17:48:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.87, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '75626adf-963e-4caf-86b0-a69af815994a', id, '2026-03-24', '2026-03-24 07:49:00', '2026-03-24 17:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.73, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e76f2030-ff32-4733-93ef-11eb8d113b83', id, '2026-03-25', '2026-03-25 08:39:00', '2026-03-25 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.18, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4b43251f-4afa-4514-a0dd-eefa175c70d6', id, '2026-03-25', '2026-03-25 07:36:00', '2026-03-25 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.00, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f5e8e502-fcca-4bff-9e5c-c7b7f921de75', id, '2026-03-25', '2026-03-25 07:29:00', '2026-03-25 18:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.45, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'aa1af9cb-4b56-48b8-bee2-4bf47c50c8eb', id, '2026-03-25', '2026-03-25 07:08:00', '2026-03-25 18:49:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.68, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7ec34867-c099-483a-b628-052ac2d19a49', id, '2026-03-25', '2026-03-25 07:57:00', '2026-03-25 18:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.02, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b50f70f8-561b-42ae-9381-46ce0d244a1f', id, '2026-03-26', '2026-03-26 07:39:00', '2026-03-26 17:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.48, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '32c99f14-b8ae-4c11-b684-f8bdd975d3ba', id, '2026-03-26', '2026-03-26 07:12:00', '2026-03-26 18:54:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.70, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7930c49d-8f00-4019-907b-92df19a336a7', id, '2026-03-26', '2026-03-26 07:04:00', '2026-03-26 17:11:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.12, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2b008757-b6ea-411b-b52a-51ac49e43dec', id, '2026-03-26', '2026-03-26 07:39:00', '2026-03-26 17:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.78, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4588dd0d-ad32-49a3-9646-e4601dd73b07', id, '2026-03-26', '2026-03-26 07:06:00', '2026-03-26 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.93, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '06b17db2-33ed-41d6-937d-108f97ff505d', id, '2026-03-27', '2026-03-27 07:00:00', '2026-03-27 17:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.42, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '78792e10-6c16-4337-87ca-c37aa8ae2d0d', id, '2026-03-27', '2026-03-27 07:07:00', '2026-03-27 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.72, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '43863627-b2e8-457c-b886-a2c0522ee374', id, '2026-03-27', '2026-03-27 08:18:00', '2026-03-27 17:20:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.03, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f8b1caf6-4e6c-413f-abd4-363a1ab9a3a6', id, '2026-03-27', '2026-03-27 07:58:00', '2026-03-27 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.38, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd4c6b238-3aa7-4f21-8305-0f2f6408d9f0', id, '2026-03-30', '2026-03-30 07:36:00', '2026-03-30 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.80, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '00ea5de5-f9a1-44e8-913d-0ad9c7468769', id, '2026-03-30', '2026-03-30 07:56:00', '2026-03-30 17:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.68, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7b108cf9-6b10-489f-9bf6-bc39cc1ea4f0', id, '2026-03-30', '2026-03-30 07:20:00', '2026-03-30 18:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.80, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8cede49c-0f09-45b5-95a6-0d0fb47a9211', id, '2026-03-30', '2026-03-30 07:09:00', '2026-03-30 18:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.50, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd151065d-fb2e-432a-8626-5aa418bb4cb2', id, '2026-04-02', '2026-04-02 08:14:00', '2026-04-02 18:53:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.65, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '934befbd-1e89-46d9-bea2-34b42507d52b', id, '2026-04-02', '2026-04-02 07:40:00', '2026-04-02 18:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.30, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7e41222c-223b-40ba-9601-a15f1c6a7b26', id, '2026-04-02', '2026-04-02 07:03:00', '2026-04-02 18:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.62, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '75e0797a-6a11-4d14-bc39-65244ea0f0c1', id, '2026-04-02', '2026-04-02 07:24:00', '2026-04-02 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.87, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '52e955c0-a011-4da2-bac7-90145ced703e', id, '2026-04-02', '2026-04-02 07:31:00', '2026-04-02 18:35:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.07, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '86fb0970-0de4-4988-b022-fe045f14037a', id, '2026-04-03', '2026-04-03 07:27:00', '2026-04-03 18:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.70, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1eae44ca-a977-4bce-8b14-1024790807d0', id, '2026-04-03', '2026-04-03 07:36:00', '2026-04-03 17:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.23, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '56baf4c1-3b40-4f40-ae1a-8660a0395651', id, '2026-04-03', '2026-04-03 07:45:00', '2026-04-03 18:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.60, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '79c74c9c-6ab5-4ec7-8a33-a8946e83e76f', id, '2026-04-03', '2026-04-03 07:43:00', '2026-04-03 17:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.83, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '45916e7e-5aaa-47f8-ade9-2bffdda912d8', id, '2026-04-06', '2026-04-06 08:44:00', '2026-04-06 17:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.52, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '103ecc65-bb9c-40ee-b730-7f6f376a73f7', id, '2026-04-06', '2026-04-06 07:12:00', '2026-04-06 18:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.32, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0259a696-7d80-4046-b7a2-626ee3fe19f9', id, '2026-04-06', '2026-04-06 08:53:00', '2026-04-06 17:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.90, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7329dd28-6ed0-4e29-bc1e-cd521e5d9ffe', id, '2026-04-06', '2026-04-06 07:50:00', '2026-04-06 18:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.22, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '24816ec7-f71d-4501-8320-cbbc8ade7f39', id, '2026-04-06', '2026-04-06 08:53:00', '2026-04-06 18:49:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.93, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd8badde4-8721-4222-a831-73b7b75ee17e', id, '2026-04-07', '2026-04-07 07:37:00', '2026-04-07 17:53:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.27, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5f93b0e6-76a3-4557-9055-7a99cabd9de3', id, '2026-04-07', '2026-04-07 07:44:00', '2026-04-07 17:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.57, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4025cba0-7399-4da9-b113-d00afec01fd0', id, '2026-04-07', '2026-04-07 07:41:00', '2026-04-07 17:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.23, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '59eee518-e56c-4158-9830-a8d0530f866a', id, '2026-04-07', '2026-04-07 07:45:00', '2026-04-07 17:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.57, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c753c526-ece2-4441-913b-df3855013bc1', id, '2026-04-07', '2026-04-07 07:27:00', '2026-04-07 17:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.42, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6fc2bcad-2c6f-4d04-90d4-a6bd9eb5d278', id, '2026-04-08', '2026-04-08 07:03:00', '2026-04-08 17:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.35, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e2890c92-2a1e-4206-bef2-35bdf336fffc', id, '2026-04-08', '2026-04-08 07:12:00', '2026-04-08 18:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.37, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '11b54a4e-6b27-495b-84dc-fb53303124d7', id, '2026-04-08', '2026-04-08 07:52:00', '2026-04-08 17:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.33, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c572556c-5773-403a-a72d-8ea6329aa1cd', id, '2026-04-08', '2026-04-08 07:17:00', '2026-04-08 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.55, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2b73712b-bf16-461f-9690-ab487ce422aa', id, '2026-04-08', '2026-04-08 07:44:00', '2026-04-08 17:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.75, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dfaa3a9d-6ac1-491a-8972-35bf809c7566', id, '2026-04-09', '2026-04-09 07:42:00', '2026-04-09 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.13, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '725fc743-c7c6-47dc-8e6e-519a8d28febd', id, '2026-04-09', '2026-04-09 08:59:00', '2026-04-09 17:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.30, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '25dd52b0-0049-449f-aef2-cbd949f605c7', id, '2026-04-09', '2026-04-09 07:58:00', '2026-04-09 17:53:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.92, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '64fc5d00-31c9-42a4-81a8-52b7e46c453e', id, '2026-04-09', '2026-04-09 08:11:00', '2026-04-09 17:11:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.00, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a2942980-66e7-4a42-ae9d-c7bce8b885cc', id, '2026-04-09', '2026-04-09 07:43:00', '2026-04-09 18:20:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.62, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f00e5bae-8ef7-40dc-85e0-52b811b89ae8', id, '2026-04-10', '2026-04-10 08:29:00', '2026-04-10 18:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.20, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f00770f2-4f00-469a-8761-f9e518b558cf', id, '2026-04-10', '2026-04-10 08:59:00', '2026-04-10 17:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.12, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e1e415a2-5541-4572-9f5f-b852d3c0e932', id, '2026-04-10', '2026-04-10 07:10:00', '2026-04-10 17:45:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.58, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b8906bf8-c3da-40b5-a0bd-d04600c97254', id, '2026-04-10', '2026-04-10 08:08:00', '2026-04-10 18:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.22, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2b5f6612-b0b8-4232-9da6-e131ab70b409', id, '2026-04-13', '2026-04-13 07:18:00', '2026-04-13 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.63, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4a503bcb-aeec-4ab6-8f2e-18f8e377e3f9', id, '2026-04-13', '2026-04-13 07:37:00', '2026-04-13 17:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.93, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b4b08f17-aed1-487b-a863-03100d836062', id, '2026-04-13', '2026-04-13 07:16:00', '2026-04-13 17:22:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.10, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '385d51c4-8d7e-4b49-8c53-27f0667a83ea', id, '2026-04-13', '2026-04-13 07:15:00', '2026-04-13 17:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.17, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '129ec70d-4c8b-4cd9-9b49-362dabb47f00', id, '2026-04-14', '2026-04-14 07:31:00', '2026-04-14 17:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.10, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '821c505d-2fd3-44f5-a920-c551b03c4294', id, '2026-04-14', '2026-04-14 07:44:00', '2026-04-14 18:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.33, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c6cef3ef-e1c8-4bfb-915c-1490d70c7b23', id, '2026-04-14', '2026-04-14 07:45:00', '2026-04-14 17:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.12, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fe6d80d8-8dac-4775-b763-38a626ed80e4', id, '2026-04-14', '2026-04-14 08:32:00', '2026-04-14 17:14:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.70, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd98fb087-f9d4-443e-ba3e-4ff3e4fe76a1', id, '2026-04-14', '2026-04-14 07:41:00', '2026-04-14 17:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.17, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4a5b68df-3e62-46f3-9815-648441f58e65', id, '2026-04-15', '2026-04-15 07:58:00', '2026-04-15 17:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.45, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c0222784-43a4-449c-9450-5b08b6323c35', id, '2026-04-15', '2026-04-15 08:19:00', '2026-04-15 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.20, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '22d2e54e-1b7c-49e9-aeef-96969f2aa458', id, '2026-04-15', '2026-04-15 08:11:00', '2026-04-15 17:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.50, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2aed6d78-5df6-4fd3-99d9-6a998bd29bf6', id, '2026-04-15', '2026-04-15 08:02:00', '2026-04-15 18:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.05, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e074b1b9-a04c-4dc5-846b-ddc662fdee8a', id, '2026-04-15', '2026-04-15 07:23:00', '2026-04-15 18:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.90, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '70f43201-2ca3-4b9a-a83c-db56a6a592ab', id, '2026-04-16', '2026-04-16 07:56:00', '2026-04-16 18:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.17, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ba5f34ae-a0e9-4ab4-babe-e9955b1d96a1', id, '2026-04-16', '2026-04-16 07:52:00', '2026-04-16 17:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.22, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cc429e80-3fbc-43d0-ba90-3c56252f57a4', id, '2026-04-16', '2026-04-16 07:32:00', '2026-04-16 18:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.25, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '956789cc-b139-445b-865f-b78661e50f43', id, '2026-04-16', '2026-04-16 08:17:00', '2026-04-16 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.55, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '862f1aac-6ba6-43eb-b0da-57145f4dd551', id, '2026-04-16', '2026-04-16 08:47:00', '2026-04-16 18:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.30, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'aac5d37a-2548-4943-a2f6-7722882abaf3', id, '2026-04-17', '2026-04-17 07:51:00', '2026-04-17 17:11:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.33, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ef435d8b-ef78-41ff-9a06-02f4232626ad', id, '2026-04-17', '2026-04-17 07:54:00', '2026-04-17 18:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.30, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ad1c627c-a0f2-4339-ae1b-c9debdea24a3', id, '2026-04-17', '2026-04-17 07:33:00', '2026-04-17 17:13:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.67, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '224ae814-747a-4678-bb5f-f0468c3488d9', id, '2026-04-17', '2026-04-17 07:43:00', '2026-04-17 18:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.70, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '907aa293-b138-40d4-986c-def65ee7ce4c', id, '2026-04-17', '2026-04-17 08:44:00', '2026-04-17 17:59:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.25, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '623dd5f1-9f9c-4168-90a6-255037b5ae88', id, '2026-04-20', '2026-04-20 07:29:00', '2026-04-20 18:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.67, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '818b2bc0-e01e-493d-8047-53926be41ba1', id, '2026-04-20', '2026-04-20 08:12:00', '2026-04-20 17:43:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.52, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '89f3ad8d-ab5b-43d5-87c5-bd6a387c3bb9', id, '2026-04-20', '2026-04-20 07:36:00', '2026-04-20 17:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.88, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eb547907-7572-4ff3-a278-c41efd801c8b', id, '2026-04-20', '2026-04-20 07:28:00', '2026-04-20 17:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.57, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9811d885-b1f4-4e41-b400-53663ce0c976', id, '2026-04-20', '2026-04-20 07:53:00', '2026-04-20 18:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.75, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '97f45d2d-df67-4c6a-82b7-8fa34a0ca26b', id, '2026-04-21', '2026-04-21 08:14:00', '2026-04-21 17:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.07, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a9db7609-ca1a-4824-b95c-d548584b580d', id, '2026-04-21', '2026-04-21 08:02:00', '2026-04-21 18:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.90, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7d0971f4-3764-4644-9efb-aff168f19a6c', id, '2026-04-21', '2026-04-21 07:17:00', '2026-04-21 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.98, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dab4b6ea-9660-4948-a34a-a3ec39d91c6f', id, '2026-04-21', '2026-04-21 07:44:00', '2026-04-21 17:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.30, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c7ab6d6a-8cb7-456b-a803-bbc57fe253e8', id, '2026-04-21', '2026-04-21 07:17:00', '2026-04-21 18:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.72, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a9c5aece-f260-44fe-8b7d-8d0c3ee8ef46', id, '2026-04-22', '2026-04-22 08:03:00', '2026-04-22 18:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.38, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'aaee7234-41b6-4553-983f-d7985596afe5', id, '2026-04-22', '2026-04-22 07:59:00', '2026-04-22 17:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.42, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '14770f3a-52c3-457c-b667-785da7464069', id, '2026-04-22', '2026-04-22 07:02:00', '2026-04-22 18:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.27, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '42b88c81-9447-461d-8a19-476f282822cc', id, '2026-04-22', '2026-04-22 07:08:00', '2026-04-22 18:01:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.88, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eb4b3013-cb24-4c84-b8f9-e710408ab281', id, '2026-04-22', '2026-04-22 08:36:00', '2026-04-22 17:42:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.10, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '61203e0e-0fcd-4079-b1c2-27dd798c304c', id, '2026-04-23', '2026-04-23 07:50:00', '2026-04-23 17:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.03, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '039617e4-3e2b-4c08-97d0-43296f0b2837', id, '2026-04-23', '2026-04-23 08:26:00', '2026-04-23 17:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.82, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8dbfa528-f3a4-45b5-af49-43b7842149ef', id, '2026-04-23', '2026-04-23 07:50:00', '2026-04-23 18:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.83, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '62891a79-b07f-42cd-9ac0-eed246d7b2c2', id, '2026-04-23', '2026-04-23 07:21:00', '2026-04-23 17:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.92, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dc7d03fa-1eee-46b8-bdd7-8f37cab2e5a5', id, '2026-04-23', '2026-04-23 08:13:00', '2026-04-23 17:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.63, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '43c2e762-f563-4cf6-8620-2b94e1008e35', id, '2026-04-24', '2026-04-24 07:54:00', '2026-04-24 17:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.88, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0511b5cf-f7ef-4800-88e5-12e117e46710', id, '2026-04-24', '2026-04-24 07:59:00', '2026-04-24 17:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.70, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4537e848-9c86-41c5-9c8b-0c04c7f3c473', id, '2026-04-24', '2026-04-24 08:22:00', '2026-04-24 17:43:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.35, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '83ee07f6-590b-4aef-b6c8-f3c2b1ba9f17', id, '2026-04-24', '2026-04-24 07:21:00', '2026-04-24 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.00, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '28f9bf4b-0e69-47f1-ad9b-3f45af4e9afc', id, '2026-04-24', '2026-04-24 07:24:00', '2026-04-24 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.87, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '50bc2816-001d-4406-a165-7eaa58420cbe', id, '2026-04-27', '2026-04-27 07:52:00', '2026-04-27 17:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.68, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9528063e-98e9-41fd-9aac-04b3bf554efc', id, '2026-04-27', '2026-04-27 07:30:00', '2026-04-27 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.02, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c4569bc7-f4cb-41d5-b1cc-f243276ca134', id, '2026-04-27', '2026-04-27 08:48:00', '2026-04-27 18:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.27, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f4d4e52d-da63-487e-91d1-e31279d84cd0', id, '2026-04-27', '2026-04-27 07:20:00', '2026-04-27 18:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.95, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ad5ac955-a622-46a1-80c0-a95b97348d87', id, '2026-04-27', '2026-04-27 08:45:00', '2026-04-27 18:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.68, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5e74e694-c341-4166-813a-03365e19f3fb', id, '2026-04-28', '2026-04-28 07:47:00', '2026-04-28 17:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.05, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd1839fb5-ba81-40c7-9b64-22f1a772da17', id, '2026-04-28', '2026-04-28 07:50:00', '2026-04-28 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.77, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6464f28c-a80c-4050-950f-c54f9ab2807e', id, '2026-04-28', '2026-04-28 07:04:00', '2026-04-28 18:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.18, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '71dff727-fb1a-465e-a6e5-3689191aedd9', id, '2026-04-28', '2026-04-28 07:45:00', '2026-04-28 18:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.30, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c00dde49-3627-49c7-8c54-67dccfffe80f', id, '2026-04-29', '2026-04-29 08:41:00', '2026-04-29 17:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.43, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'bd3c7fe1-1733-4fce-aefd-31a632580604', id, '2026-04-29', '2026-04-29 07:30:00', '2026-04-29 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.02, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0763e8c0-6642-4367-a1e2-3991c8a199b1', id, '2026-04-29', '2026-04-29 07:07:00', '2026-04-29 17:49:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.70, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '223945e3-986a-446e-be3e-a018ef44eb37', id, '2026-04-29', '2026-04-29 07:48:00', '2026-04-29 17:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.85, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8fee4d64-3a36-408a-a8e6-a921fbc31867', id, '2026-04-29', '2026-04-29 07:15:00', '2026-04-29 17:45:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.50, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5b09bf77-1071-4a93-8d65-9bc10311e8ed', id, '2026-04-30', '2026-04-30 07:46:00', '2026-04-30 18:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.15, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'acc2879a-3c9c-4846-8e93-855cd7b22020', id, '2026-04-30', '2026-04-30 08:10:00', '2026-04-30 18:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.93, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f3171e1b-5718-4c87-98fa-def35445fd5f', id, '2026-04-30', '2026-04-30 07:41:00', '2026-04-30 18:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.78, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'aa03a7b4-e6d7-4e1e-9303-6e48830c2f8f', id, '2026-04-30', '2026-04-30 07:50:00', '2026-04-30 18:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.23, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
SET FOREIGN_KEY_CHECKS = 1;
-- Total records: 387
