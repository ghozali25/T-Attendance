-- Attendance Seed Data (Jan - May 2026)
USE t_absensi;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM attendance;
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9d1f46df-e2dd-4f66-83f8-335298dbbea2', id, '2026-01-02', '2026-01-02 07:27:00', '2026-01-02 18:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.03, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eb74db13-e6f7-4471-be2f-f78eed618544', id, '2026-01-02', '2026-01-02 07:32:00', '2026-01-02 18:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.43, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'deaa8b8c-43d5-4d7c-9043-8c5557c32783', id, '2026-01-02', '2026-01-02 07:40:00', '2026-01-02 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.27, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'bc831cec-aec2-4c7c-b7fa-24a9391ad477', id, '2026-01-02', '2026-01-02 07:51:00', '2026-01-02 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.98, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fdd96f97-d9b1-45bd-bf15-ab7ec0e8c987', id, '2026-01-02', '2026-01-02 07:26:00', '2026-01-02 18:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.25, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '81692ec5-20cf-413d-b542-dda5de887b89', id, '2026-01-05', '2026-01-05 07:14:00', '2026-01-05 17:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.08, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '66935d11-5ee1-4105-a4c5-31a26f5ed785', id, '2026-01-05', '2026-01-05 08:46:00', '2026-01-05 17:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.30, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'df690d04-d095-497a-abe9-d8bcbd5afa2d', id, '2026-01-05', '2026-01-05 08:40:00', '2026-01-05 17:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.80, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ca44a486-8066-407b-8eaf-442f0bf8ce27', id, '2026-01-05', '2026-01-05 07:34:00', '2026-01-05 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.47, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd8007fbe-71e7-4df0-a1b7-6b5d6b2cc994', id, '2026-01-05', '2026-01-05 07:00:00', '2026-01-05 17:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.68, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '30ef7943-b7ce-42ab-8274-b56e77ca2169', id, '2026-01-06', '2026-01-06 08:18:00', '2026-01-06 18:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.02, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a8f84a65-00d5-4715-bf67-f7aa0cd7da94', id, '2026-01-06', '2026-01-06 07:45:00', '2026-01-06 18:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.40, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e1c30774-61b8-4655-93d5-0ab81df9d825', id, '2026-01-06', '2026-01-06 07:07:00', '2026-01-06 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.15, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7250c0c3-9fa0-4d66-844c-d70f3de766ef', id, '2026-01-06', '2026-01-06 07:37:00', '2026-01-06 17:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.58, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f4471360-07a5-40de-b63a-1238d45e360d', id, '2026-01-06', '2026-01-06 07:05:00', '2026-01-06 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.07, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '44547d6f-436e-4213-bf2b-c82909902d3e', id, '2026-01-07', '2026-01-07 07:36:00', '2026-01-07 17:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.40, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '47d3bffe-1075-4887-89e7-2b790a443e2c', id, '2026-01-07', '2026-01-07 07:41:00', '2026-01-07 18:32:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.85, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1abdf1ce-0a7d-482c-a207-f995148b0fe5', id, '2026-01-07', '2026-01-07 07:26:00', '2026-01-07 18:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.82, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e05ea5fc-1469-458d-8f7d-ac69edc14490', id, '2026-01-07', '2026-01-07 07:44:00', '2026-01-07 18:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.18, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '95178a2f-520f-43c4-a076-3546fa4c180f', id, '2026-01-07', '2026-01-07 07:48:00', '2026-01-07 18:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.72, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '97fb2c56-5ff6-4b86-8721-069e99d5b4c1', id, '2026-01-08', '2026-01-08 07:08:00', '2026-01-08 17:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.73, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8d52ce85-f549-4bab-9855-63fc3e7f845a', id, '2026-01-08', '2026-01-08 07:45:00', '2026-01-08 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.08, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '70889b08-0b31-4e58-9a67-6caa2fd2c445', id, '2026-01-08', '2026-01-08 07:19:00', '2026-01-08 17:11:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.87, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e146478a-b6b1-4753-993c-43d49c70a2e6', id, '2026-01-08', '2026-01-08 08:51:00', '2026-01-08 17:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.20, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a03348b5-ff00-4083-96bc-c3e0182ccc34', id, '2026-01-08', '2026-01-08 07:56:00', '2026-01-08 18:13:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.28, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'aed8bc74-c01d-4629-99cf-274b73d466f3', id, '2026-01-09', '2026-01-09 07:54:00', '2026-01-09 17:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.40, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b2357e16-39fd-4797-b4ff-b7d4eae7b5d0', id, '2026-01-09', '2026-01-09 07:25:00', '2026-01-09 18:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.05, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ce96e190-2399-4ea6-b2e1-0d3bbbb102be', id, '2026-01-09', '2026-01-09 07:27:00', '2026-01-09 17:01:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.57, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '41f27108-fc78-4b2d-813e-e699a1363e3a', id, '2026-01-09', '2026-01-09 07:20:00', '2026-01-09 18:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.87, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '18ed2948-6221-4a6a-bb30-d5f4d76db18c', id, '2026-01-13', '2026-01-13 07:26:00', '2026-01-13 17:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.85, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'bd97d5cc-00dc-4369-8fb9-1055773c457b', id, '2026-01-13', '2026-01-13 07:40:00', '2026-01-13 18:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.47, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '017ff714-6c81-42fa-b2a2-88c456e946d0', id, '2026-01-13', '2026-01-13 07:30:00', '2026-01-13 18:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.62, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1bedaa97-02c2-4d73-8254-678ca9612036', id, '2026-01-13', '2026-01-13 07:51:00', '2026-01-13 18:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.35, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ef10f179-32f5-4d0c-ae52-d98aff2ce597', id, '2026-01-13', '2026-01-13 07:47:00', '2026-01-13 18:14:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.45, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f196005f-59fb-4ead-81f1-0a06957076b9', id, '2026-01-14', '2026-01-14 07:21:00', '2026-01-14 18:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.60, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b88444d3-1d49-4587-b18f-b228302c3855', id, '2026-01-14', '2026-01-14 07:29:00', '2026-01-14 17:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.57, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f9dd1376-e592-47af-9548-c44e30339f0e', id, '2026-01-14', '2026-01-14 07:01:00', '2026-01-14 17:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.08, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd3824175-75bc-4bd9-8a84-68702ac1a819', id, '2026-01-14', '2026-01-14 08:02:00', '2026-01-14 17:30:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.47, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f4840085-b2d7-4954-a8f6-aadcd2b8fc2f', id, '2026-01-15', '2026-01-15 07:16:00', '2026-01-15 18:20:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.07, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e9375298-90b7-444a-a168-9fd3078f1e06', id, '2026-01-15', '2026-01-15 07:18:00', '2026-01-15 18:53:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.58, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5fd1a35e-098b-4ff3-baf3-f431f0bf8db4', id, '2026-01-15', '2026-01-15 07:11:00', '2026-01-15 17:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.95, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0c171c85-410b-4d72-b969-463676f21ca6', id, '2026-01-15', '2026-01-15 07:12:00', '2026-01-15 17:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.72, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd5f8ccb4-3be4-4b3b-8105-a31eb207c347', id, '2026-01-15', '2026-01-15 08:10:00', '2026-01-15 17:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.27, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8569d28f-f16c-4a95-a8f1-65f90a925c7d', id, '2026-01-16', '2026-01-16 07:48:00', '2026-01-16 17:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.85, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f5785e56-cb90-4b0a-ab99-0fe468638c17', id, '2026-01-16', '2026-01-16 07:05:00', '2026-01-16 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.32, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '66704b2a-5ca3-4256-ba97-d3d5ebf87df5', id, '2026-01-16', '2026-01-16 07:52:00', '2026-01-16 17:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.60, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2c464686-ee70-47d0-abc7-9595b70c33d5', id, '2026-01-16', '2026-01-16 07:53:00', '2026-01-16 17:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.95, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f90c634e-fe32-4f3b-b62b-64a167e93d9b', id, '2026-01-16', '2026-01-16 07:52:00', '2026-01-16 17:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.90, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '95d18a48-c365-4569-8e7d-e69766b35b0f', id, '2026-01-19', '2026-01-19 07:19:00', '2026-01-19 17:48:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.48, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd9b9997c-e7d3-4afa-8623-e36d190f0cac', id, '2026-01-19', '2026-01-19 07:20:00', '2026-01-19 18:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.82, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4e843f42-7ce3-40e7-9de0-d0d46df7c255', id, '2026-01-19', '2026-01-19 07:32:00', '2026-01-19 18:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.93, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0da61630-eb92-462b-824d-24a8acae5016', id, '2026-01-19', '2026-01-19 07:39:00', '2026-01-19 18:45:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.10, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '687e4632-321b-452f-9053-81df465ac374', id, '2026-01-19', '2026-01-19 07:09:00', '2026-01-19 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.78, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '01aa009b-bc72-4716-b421-52f466a3ee90', id, '2026-01-20', '2026-01-20 07:19:00', '2026-01-20 17:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.08, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1672338a-fabb-435c-a89d-277809bbffbe', id, '2026-01-20', '2026-01-20 07:14:00', '2026-01-20 17:35:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.35, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c8eaa9cd-07f8-4ec5-92f7-a3dc0ba5838d', id, '2026-01-20', '2026-01-20 07:32:00', '2026-01-20 17:27:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.92, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '598c9263-5c3d-4f71-84d5-912c4e9d5f4f', id, '2026-01-20', '2026-01-20 08:04:00', '2026-01-20 17:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.72, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '913d7d35-fc01-46b5-ad7b-2a00e90a117f', id, '2026-01-20', '2026-01-20 07:31:00', '2026-01-20 17:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.15, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3421eb98-1ea5-4792-aa10-16a8cadc4d66', id, '2026-01-21', '2026-01-21 07:57:00', '2026-01-21 18:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.18, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '368ecde5-0b4b-49bd-abf2-509a39dd4b06', id, '2026-01-21', '2026-01-21 07:54:00', '2026-01-21 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.13, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9c0470d6-467f-4b1a-b8d6-4ce72de33253', id, '2026-01-21', '2026-01-21 08:03:00', '2026-01-21 17:20:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.28, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5d749017-9f7a-49e9-bc3f-30f9b22b1bf5', id, '2026-01-21', '2026-01-21 07:02:00', '2026-01-21 17:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.25, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0d13b2a5-a237-42d1-be6e-be2bbf0fe79e', id, '2026-01-22', '2026-01-22 08:05:00', '2026-01-22 17:48:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.72, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '036dbceb-8409-41ed-9cd9-1ed5e34a8ff0', id, '2026-01-22', '2026-01-22 07:23:00', '2026-01-22 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.45, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7f829aad-0806-479a-8616-13fe9ad0c20f', id, '2026-01-22', '2026-01-22 08:51:00', '2026-01-22 17:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.83, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b8ba9d68-a9ae-410e-80c0-5e721f6c1f4d', id, '2026-01-22', '2026-01-22 07:29:00', '2026-01-22 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.03, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dc5b3b93-6191-41a7-8f84-bda76b304428', id, '2026-01-23', '2026-01-23 07:30:00', '2026-01-23 18:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.63, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '364ac381-877c-4142-b30f-21a0dc140a01', id, '2026-01-23', '2026-01-23 07:45:00', '2026-01-23 18:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.40, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eae937cc-f564-459a-99a1-9f5a2fd6f58e', id, '2026-01-23', '2026-01-23 07:50:00', '2026-01-23 17:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.72, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4f752529-29d2-4f7c-8297-4ca649939048', id, '2026-01-27', '2026-01-27 07:25:00', '2026-01-27 18:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.75, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '76bd1b6d-9de4-4254-bb9f-b7f257de466a', id, '2026-01-27', '2026-01-27 07:55:00', '2026-01-27 17:20:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.42, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '126703c2-3e46-4191-a720-9398a937236b', id, '2026-01-27', '2026-01-27 07:23:00', '2026-01-27 17:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.40, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0763c944-dedd-430a-b382-f5974d57651e', id, '2026-01-27', '2026-01-27 07:43:00', '2026-01-27 18:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.70, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e8f7084b-2009-4a77-898b-fa10f159265d', id, '2026-01-27', '2026-01-27 07:01:00', '2026-01-27 17:45:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.73, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '98e9a82d-4e3e-4b84-bb75-7cfeb7c694e0', id, '2026-01-28', '2026-01-28 07:17:00', '2026-01-28 18:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.18, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '066c5f41-9626-4f3c-9314-b2d08f31b8ab', id, '2026-01-28', '2026-01-28 07:29:00', '2026-01-28 17:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.38, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'def0556a-fc44-41d0-88a3-f211d56b4d63', id, '2026-01-28', '2026-01-28 07:19:00', '2026-01-28 18:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.45, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e1025f79-c8a3-46f5-ba7e-a3238ef8dd7d', id, '2026-01-28', '2026-01-28 07:41:00', '2026-01-28 18:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.78, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c659e23b-eff3-42ea-9489-4995e21c3ef3', id, '2026-01-28', '2026-01-28 07:33:00', '2026-01-28 18:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.52, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1a874848-eb57-485e-92e5-fc331f3c1a54', id, '2026-01-29', '2026-01-29 07:32:00', '2026-01-29 17:42:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.17, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '95c6f4da-39da-4fdf-a308-5c993c2308d8', id, '2026-01-29', '2026-01-29 07:22:00', '2026-01-29 17:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.75, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '87564817-498c-45ad-941b-59e84dd0666d', id, '2026-01-29', '2026-01-29 07:14:00', '2026-01-29 17:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.68, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f64a7053-fe9b-43fe-bc8b-ee574339e92b', id, '2026-01-29', '2026-01-29 07:49:00', '2026-01-29 17:32:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.72, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b7e3e929-e68e-48a8-a6c0-09e5c4ee7cfc', id, '2026-01-29', '2026-01-29 08:33:00', '2026-01-29 17:27:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.90, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9626af22-8465-4ba4-826e-bc47faff9724', id, '2026-01-30', '2026-01-30 07:04:00', '2026-01-30 17:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.10, '2026-01' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '08932bbc-6296-46d7-835b-f67ca5b97381', id, '2026-01-30', '2026-01-30 07:51:00', '2026-01-30 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.30, '2026-01' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '800691a8-206b-4d5b-a9c9-8772d51f27a4', id, '2026-01-30', '2026-01-30 08:00:00', '2026-01-30 17:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.48, '2026-01' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '53032337-85f3-4759-872a-d661cc5d1159', id, '2026-01-30', '2026-01-30 07:23:00', '2026-01-30 18:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.17, '2026-01' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '53effb1c-63a8-4a95-9bae-c600e90e3340', id, '2026-01-30', '2026-01-30 07:13:00', '2026-01-30 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.82, '2026-01' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7ef39cbf-0277-4c3e-b4f8-ed9c6176765e', id, '2026-02-02', '2026-02-02 08:45:00', '2026-02-02 18:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.77, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd029af8d-e043-4d58-a567-4652cf95330f', id, '2026-02-02', '2026-02-02 08:35:00', '2026-02-02 17:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.37, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '65f7c8e5-530f-4d66-afaa-30a8e332c304', id, '2026-02-02', '2026-02-02 07:07:00', '2026-02-02 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.03, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '251bc5ce-aacb-4d12-a589-d0d6b1319401', id, '2026-02-02', '2026-02-02 07:33:00', '2026-02-02 18:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.83, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5e12bd99-c0a5-4a95-8478-238a07679636', id, '2026-02-02', '2026-02-02 07:33:00', '2026-02-02 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.80, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '09a136b8-db49-463e-9526-525b0bd0779e', id, '2026-02-03', '2026-02-03 07:26:00', '2026-02-03 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '570c4903-4b52-4200-9fd9-38903a960152', id, '2026-02-03', '2026-02-03 07:16:00', '2026-02-03 17:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.28, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c6c3fc29-b1c8-4f86-abe5-cde87828761b', id, '2026-02-03', '2026-02-03 07:45:00', '2026-02-03 17:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.30, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '688bd200-10a7-49a2-864b-3385fa8a760b', id, '2026-02-03', '2026-02-03 07:08:00', '2026-02-03 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.13, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '54f7a769-b3cb-4c6d-a487-8e136ce9478d', id, '2026-02-04', '2026-02-04 07:37:00', '2026-02-04 17:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.52, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1e84097c-11a3-4257-a158-5fad8379b020', id, '2026-02-04', '2026-02-04 07:00:00', '2026-02-04 18:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.32, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1e60317d-55eb-4f1e-90d1-29b25ed059ec', id, '2026-02-04', '2026-02-04 07:33:00', '2026-02-04 18:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.05, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '65463950-70af-4eef-99be-aba792d74335', id, '2026-02-04', '2026-02-04 07:29:00', '2026-02-04 18:44:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.25, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1e3aa40b-8809-4f0d-b11b-83d01e1c9f28', id, '2026-02-04', '2026-02-04 07:46:00', '2026-02-04 17:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.87, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '41831458-ebae-4859-8d75-5eb8a02cf040', id, '2026-02-05', '2026-02-05 07:53:00', '2026-02-05 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.15, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '167a33fa-22f4-4352-98b8-7e686c30332c', id, '2026-02-05', '2026-02-05 07:30:00', '2026-02-05 17:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.67, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '646a989c-e4a8-42e5-8bf8-ee346625ccd2', id, '2026-02-05', '2026-02-05 07:54:00', '2026-02-05 17:59:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.08, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9215a995-90a9-497c-a7ef-e036128b8c7b', id, '2026-02-05', '2026-02-05 08:24:00', '2026-02-05 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.75, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9bf2e1dd-4565-4b21-a46d-614fb22bf3a6', id, '2026-02-05', '2026-02-05 08:36:00', '2026-02-05 17:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.18, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2fe7587c-5280-4b22-bbdb-5dd9b36de95e', id, '2026-02-06', '2026-02-06 08:01:00', '2026-02-06 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.13, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b4ca81bc-42be-4e6b-9255-e9feaf29043c', id, '2026-02-06', '2026-02-06 07:19:00', '2026-02-06 18:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.32, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c5cd4c17-9b6a-4d81-be67-c2f070b864d9', id, '2026-02-06', '2026-02-06 07:53:00', '2026-02-06 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.15, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6c4415f9-94e4-42c9-984b-42c51edf8979', id, '2026-02-06', '2026-02-06 07:42:00', '2026-02-06 18:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8e8c25af-4901-472d-86c6-acc66e8cb9d4', id, '2026-02-06', '2026-02-06 07:14:00', '2026-02-06 18:44:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.50, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f4672df2-1de6-4186-a38e-051d211366d7', id, '2026-02-09', '2026-02-09 07:59:00', '2026-02-09 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.05, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'da280cc6-5727-4f6a-adc7-528b83e0f6e4', id, '2026-02-09', '2026-02-09 07:22:00', '2026-02-09 18:45:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.38, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7bcdc1e3-3179-4342-a84d-99b1d0544171', id, '2026-02-09', '2026-02-09 07:50:00', '2026-02-09 17:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.13, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '91aa4aa7-c14b-4d23-8d6a-ebb80e3288c6', id, '2026-02-09', '2026-02-09 07:07:00', '2026-02-09 17:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.35, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '749edce1-6088-489e-9fe4-990525dab904', id, '2026-02-09', '2026-02-09 07:59:00', '2026-02-09 17:14:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.25, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b2e1375b-e87d-4216-a317-c1278f2ea359', id, '2026-02-10', '2026-02-10 07:17:00', '2026-02-10 17:01:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.73, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6b13d6f4-730d-4d6b-95d1-d21a0863a9bd', id, '2026-02-10', '2026-02-10 07:31:00', '2026-02-10 17:30:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.98, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd7df0917-48c6-48cf-921b-0384043a85fb', id, '2026-02-10', '2026-02-10 07:54:00', '2026-02-10 18:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.15, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '205d1f6e-06d8-4c45-baef-26b6d0c6c9c5', id, '2026-02-10', '2026-02-10 07:38:00', '2026-02-10 18:42:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.07, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6e1498f8-69a2-4c79-8cc0-3304ac2939b4', id, '2026-02-11', '2026-02-11 07:34:00', '2026-02-11 17:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.57, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7d313283-a9ca-4372-b937-7682129b634f', id, '2026-02-11', '2026-02-11 07:58:00', '2026-02-11 18:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.10, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f76ccece-9cac-410d-b6db-bc94152e94a2', id, '2026-02-11', '2026-02-11 07:10:00', '2026-02-11 17:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.77, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c168e87b-892e-4a3f-852d-07ca599c14e4', id, '2026-02-11', '2026-02-11 07:24:00', '2026-02-11 18:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.60, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cedea83e-62bb-4a18-9da9-e07aff6b1324', id, '2026-02-11', '2026-02-11 07:24:00', '2026-02-11 18:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.90, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a5165c7d-5f4d-42cf-9e1e-fea5ae0db70b', id, '2026-02-12', '2026-02-12 07:06:00', '2026-02-12 18:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.52, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f7c4b949-8145-47e0-a181-124103892df1', id, '2026-02-12', '2026-02-12 07:57:00', '2026-02-12 17:20:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.38, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dca25542-b117-4f29-917c-9d0e34014ba3', id, '2026-02-12', '2026-02-12 07:15:00', '2026-02-12 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.90, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '24215918-bf74-41ab-a4d9-fa6c9ae33a2f', id, '2026-02-12', '2026-02-12 07:31:00', '2026-02-12 18:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.80, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9d8660c7-a297-45f7-b17c-8e85c37b3287', id, '2026-02-12', '2026-02-12 07:44:00', '2026-02-12 17:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.27, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0d95e65e-7aab-4939-bf3b-9180f1d176eb', id, '2026-02-13', '2026-02-13 07:23:00', '2026-02-13 18:27:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.07, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '78bdf3ca-5670-4159-b4d2-11d9ea35781b', id, '2026-02-13', '2026-02-13 07:09:00', '2026-02-13 18:54:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.75, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '613b8ed2-f217-42c3-b06d-db4c840ba6ec', id, '2026-02-13', '2026-02-13 07:33:00', '2026-02-13 17:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.72, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b2fc6b77-3fc1-4609-b861-4027ae721e0e', id, '2026-02-13', '2026-02-13 07:50:00', '2026-02-13 17:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.37, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '098b8249-a6ec-4b63-b2d3-f55cb3e32df5', id, '2026-02-13', '2026-02-13 07:09:00', '2026-02-13 17:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.68, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4151f5ba-320e-4d2a-b616-873ae09d039a', id, '2026-02-16', '2026-02-16 08:36:00', '2026-02-16 18:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.52, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '336d8266-ed8e-4e91-9451-23b6b5f5339f', id, '2026-02-16', '2026-02-16 08:44:00', '2026-02-16 17:14:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.50, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2dc557de-e15a-477f-8a61-46f016cf2d66', id, '2026-02-16', '2026-02-16 07:54:00', '2026-02-16 18:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.20, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ab638c11-c998-411c-b9dd-75abaa8cc363', id, '2026-02-16', '2026-02-16 08:11:00', '2026-02-16 17:27:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.27, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ff2b3584-4757-4914-a156-7bfdcf7c0ece', id, '2026-02-16', '2026-02-16 07:25:00', '2026-02-16 18:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.20, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'bfd11738-25cc-43ea-ab8a-f283b8380b7e', id, '2026-02-17', '2026-02-17 07:18:00', '2026-02-17 18:53:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.58, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '09340851-3702-45ae-ad09-6a88aa2c8a61', id, '2026-02-17', '2026-02-17 07:55:00', '2026-02-17 18:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.18, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3b0761a5-0d64-4c44-b2a6-f309eb407b59', id, '2026-02-17', '2026-02-17 08:33:00', '2026-02-17 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.97, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9f3833c0-4caa-444a-8ae8-99ad5cc7bba8', id, '2026-02-17', '2026-02-17 08:25:00', '2026-02-17 18:11:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.77, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0453957b-8160-4ca6-9612-528e9ae57cce', id, '2026-02-18', '2026-02-18 07:17:00', '2026-02-18 17:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.67, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7fe709b2-befe-44e6-be5f-0648c32d3665', id, '2026-02-18', '2026-02-18 07:06:00', '2026-02-18 18:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.67, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '361172ce-cc51-4e05-aba8-14d68718da26', id, '2026-02-18', '2026-02-18 07:45:00', '2026-02-18 17:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.55, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9d7a679b-7cf6-4761-811a-b0c06058d286', id, '2026-02-18', '2026-02-18 07:04:00', '2026-02-18 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.08, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '87553f3c-8ef5-4389-9294-554c61bc75d1', id, '2026-02-18', '2026-02-18 08:27:00', '2026-02-18 17:59:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.53, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '81c84889-ca1f-443e-9e7f-3c768d9ed14b', id, '2026-02-19', '2026-02-19 07:23:00', '2026-02-19 18:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.47, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dce0ce1b-9277-480e-9c95-6a19c01d6297', id, '2026-02-19', '2026-02-19 07:53:00', '2026-02-19 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.95, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b2af61a7-3c86-451d-9f2e-590d4fc4d55f', id, '2026-02-19', '2026-02-19 07:31:00', '2026-02-19 18:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.58, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'bfca7947-072c-4f36-86c1-0b074a8cb56b', id, '2026-02-19', '2026-02-19 07:55:00', '2026-02-19 18:22:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.45, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'db3db00a-fe39-4693-8fa8-3831a8051520', id, '2026-02-19', '2026-02-19 07:38:00', '2026-02-19 17:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.57, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e66c0d35-62f3-4dde-a837-a0c8e4f3a4d2', id, '2026-02-20', '2026-02-20 07:46:00', '2026-02-20 17:11:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.42, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3bea4953-d6f8-4803-be65-e459dd3d7630', id, '2026-02-20', '2026-02-20 07:45:00', '2026-02-20 18:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.82, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'bec71972-8eb9-4b24-9b79-cd66e30ae606', id, '2026-02-20', '2026-02-20 08:52:00', '2026-02-20 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.97, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '962a372f-de56-4bb6-9c08-570b18a3ad39', id, '2026-02-20', '2026-02-20 07:57:00', '2026-02-20 18:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.57, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '591dbb8b-4356-4c12-b832-c828e9693b65', id, '2026-02-20', '2026-02-20 08:20:00', '2026-02-20 18:20:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.00, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd6e0e014-b403-44b9-a544-1e3e9a1767bb', id, '2026-02-23', '2026-02-23 08:02:00', '2026-02-23 17:42:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.67, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '532ec1e6-019c-4371-8a35-074e5f2ecf09', id, '2026-02-23', '2026-02-23 07:50:00', '2026-02-23 18:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.33, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0cb336e9-f4d3-4e14-a0a0-5914b9f2d156', id, '2026-02-23', '2026-02-23 07:59:00', '2026-02-23 17:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.97, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cff4464a-189c-4877-83ec-1930551b680d', id, '2026-02-23', '2026-02-23 08:25:00', '2026-02-23 17:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.98, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9322b955-5ec8-40f1-bd8f-de92eb68c060', id, '2026-02-23', '2026-02-23 07:38:00', '2026-02-23 18:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.13, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a1198d5f-abe9-44de-a215-e92ab429747b', id, '2026-02-24', '2026-02-24 08:40:00', '2026-02-24 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.93, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ebfba285-6ac4-4e3f-b497-1fe27bb1e615', id, '2026-02-24', '2026-02-24 08:06:00', '2026-02-24 18:32:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.43, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '003e6ab1-ffbf-47ff-8649-4353c1af92cf', id, '2026-02-24', '2026-02-24 07:23:00', '2026-02-24 17:43:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.33, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fc90bed0-0529-4b15-9fe2-e762167bc3be', id, '2026-02-24', '2026-02-24 07:48:00', '2026-02-24 18:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.12, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b9274ac6-bdea-4e08-9c1b-142987265ad7', id, '2026-02-24', '2026-02-24 07:24:00', '2026-02-24 17:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.65, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ef63a104-9f38-46f2-b6eb-49861f141703', id, '2026-02-25', '2026-02-25 07:08:00', '2026-02-25 18:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.30, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ece59654-9f4e-49f7-a691-449805d5a7ae', id, '2026-02-25', '2026-02-25 07:59:00', '2026-02-25 18:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.62, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f03bcee6-5d2f-4d77-bb4d-c1037daa1c6e', id, '2026-02-25', '2026-02-25 07:16:00', '2026-02-25 17:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.22, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4b7f115e-2234-4aaa-a4a5-900c3d264022', id, '2026-02-25', '2026-02-25 07:44:00', '2026-02-25 18:22:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.63, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7c395bed-7bac-4a2e-ba25-18f3d986e912', id, '2026-02-25', '2026-02-25 07:01:00', '2026-02-25 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.33, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9c9d96b0-4396-496f-955d-a5ccc2756410', id, '2026-02-26', '2026-02-26 07:32:00', '2026-02-26 18:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.13, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '71752a72-cf7a-48f8-a432-270764d388c2', id, '2026-02-26', '2026-02-26 07:34:00', '2026-02-26 18:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.48, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cacc97d2-1373-4865-ba99-6e0d3d084d51', id, '2026-02-26', '2026-02-26 07:10:00', '2026-02-26 17:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.90, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '233ec1dc-3b2a-49bd-ab09-575822dbc23b', id, '2026-02-26', '2026-02-26 07:52:00', '2026-02-26 17:54:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.03, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '26b217cf-f265-4832-a3f3-5fbb003755e2', id, '2026-02-26', '2026-02-26 07:19:00', '2026-02-26 17:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.97, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'edf21c4f-e58b-4bef-a283-d7d55268438e', id, '2026-02-27', '2026-02-27 07:53:00', '2026-02-27 17:35:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.70, '2026-02' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '01e7a258-89dd-4f8d-bcad-f2e4d2f63811', id, '2026-02-27', '2026-02-27 07:23:00', '2026-02-27 18:45:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.37, '2026-02' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2c27975f-ea12-4932-8a01-469bd9f213ad', id, '2026-02-27', '2026-02-27 08:19:00', '2026-02-27 17:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.32, '2026-02' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '33b28d97-f043-45dd-b47b-ca068850cf28', id, '2026-02-27', '2026-02-27 07:33:00', '2026-02-27 18:43:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.17, '2026-02' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '17117a4c-2112-466a-b308-9f9b929166f8', id, '2026-02-27', '2026-02-27 07:06:00', '2026-02-27 17:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.97, '2026-02' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5300a72f-8478-493f-846b-3e603093c8f0', id, '2026-03-02', '2026-03-02 07:57:00', '2026-03-02 17:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.90, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4b3a407a-180e-479c-aabe-dc4e1ab77196', id, '2026-03-02', '2026-03-02 07:26:00', '2026-03-02 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.92, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9a9c64f4-dd96-4ef8-9824-a5862904be27', id, '2026-03-02', '2026-03-02 07:24:00', '2026-03-02 18:44:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.33, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '16a2d74d-f477-448d-a9dc-3734ae67c1ee', id, '2026-03-02', '2026-03-02 07:24:00', '2026-03-02 18:13:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.82, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '81e863cc-2356-4e5f-a76b-8835ed1108a3', id, '2026-03-02', '2026-03-02 08:05:00', '2026-03-02 17:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.33, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '27f9166a-7beb-42b4-84fc-3ea571c236dd', id, '2026-03-03', '2026-03-03 08:17:00', '2026-03-03 17:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.35, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'df048fcc-1648-4ee5-87bc-96dc0acbcd32', id, '2026-03-03', '2026-03-03 07:49:00', '2026-03-03 18:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.10, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '62716230-c290-4051-8e0e-c00cbd6c584b', id, '2026-03-03', '2026-03-03 08:51:00', '2026-03-03 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.75, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '76156c03-d2e4-4333-9213-1ead3346d06e', id, '2026-03-03', '2026-03-03 07:43:00', '2026-03-03 17:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.12, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2c72b72e-c852-472b-92b0-e38317251a84', id, '2026-03-03', '2026-03-03 07:55:00', '2026-03-03 18:13:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.30, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '94eaecc5-08f4-4f9e-a6f6-00246c2e9099', id, '2026-03-04', '2026-03-04 07:35:00', '2026-03-04 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.68, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ed4e47bc-6777-462c-bd68-87472a398556', id, '2026-03-04', '2026-03-04 07:29:00', '2026-03-04 17:30:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.02, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '072c34e2-0a7d-4bc2-9723-014ca9890206', id, '2026-03-04', '2026-03-04 07:44:00', '2026-03-04 18:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.62, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f7e757c4-c77a-4560-b12d-cd1a26dd96b9', id, '2026-03-04', '2026-03-04 07:51:00', '2026-03-04 17:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.40, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f20ae55c-45af-45bc-bbfc-7602e4cd2441', id, '2026-03-05', '2026-03-05 07:55:00', '2026-03-05 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.12, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7f5f9cce-ab3e-4969-b706-ef8e7e46622e', id, '2026-03-05', '2026-03-05 07:03:00', '2026-03-05 17:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.07, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '642c753b-e2b4-40a2-9e77-21f030e4634d', id, '2026-03-05', '2026-03-05 07:03:00', '2026-03-05 17:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.22, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8156724e-a03c-447c-947f-49813d947ff6', id, '2026-03-05', '2026-03-05 07:37:00', '2026-03-05 17:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.47, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b61c1dbc-abf3-468f-8d19-8bf9aa2e2e24', id, '2026-03-06', '2026-03-06 07:04:00', '2026-03-06 18:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.98, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '55945e27-d745-45ca-9102-f9d028a1d499', id, '2026-03-06', '2026-03-06 07:20:00', '2026-03-06 17:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.32, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '16a4d412-341d-4f59-a842-d3af99fd9cc3', id, '2026-03-06', '2026-03-06 07:59:00', '2026-03-06 17:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.40, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4705f4b7-3840-494c-aff7-edcb76ff032c', id, '2026-03-06', '2026-03-06 07:28:00', '2026-03-06 17:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.73, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '57a280df-73ca-4b12-9a7b-74887e021297', id, '2026-03-06', '2026-03-06 07:34:00', '2026-03-06 18:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.60, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'db545a82-db97-4bb2-8cf7-bf0dd5b0a148', id, '2026-03-09', '2026-03-09 07:11:00', '2026-03-09 18:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.60, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '71cf427c-ca26-4245-84a8-24abee5e0f38', id, '2026-03-09', '2026-03-09 08:17:00', '2026-03-09 18:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.13, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c33564cf-bda6-416e-a262-ccc87415b45a', id, '2026-03-09', '2026-03-09 07:42:00', '2026-03-09 17:44:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.03, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2a334703-cee9-46e7-99ed-9996b10ae656', id, '2026-03-09', '2026-03-09 07:03:00', '2026-03-09 17:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.98, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1f69ad86-2507-4540-a6bf-25a63fc28ee3', id, '2026-03-09', '2026-03-09 07:04:00', '2026-03-09 17:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.48, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4534c184-b7ad-42dd-973b-9bbfce466bab', id, '2026-03-10', '2026-03-10 07:13:00', '2026-03-10 17:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.43, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '37bb0240-befd-48c2-9861-483633accc17', id, '2026-03-10', '2026-03-10 07:29:00', '2026-03-10 17:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.72, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '91046ebd-d934-439e-9ff5-09db28625162', id, '2026-03-10', '2026-03-10 07:33:00', '2026-03-10 17:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.42, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6b3eef09-5ade-44b3-b609-3e23b0fb3a07', id, '2026-03-10', '2026-03-10 07:11:00', '2026-03-10 18:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.07, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '513f150a-f433-4211-9941-1ae6344a76d6', id, '2026-03-10', '2026-03-10 07:25:00', '2026-03-10 18:59:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.57, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4d9cbcd1-3d76-466c-8e5e-ad56ec1e7866', id, '2026-03-11', '2026-03-11 07:43:00', '2026-03-11 18:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.57, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '81e95aea-13e9-42d1-9655-ffe7063d0912', id, '2026-03-11', '2026-03-11 07:11:00', '2026-03-11 17:43:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.53, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1ab7b5a4-9b9b-4fbb-8433-71f8815638cb', id, '2026-03-11', '2026-03-11 07:35:00', '2026-03-11 18:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.10, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3c97fb3b-7d70-40fe-b1de-7815eefe8a67', id, '2026-03-11', '2026-03-11 07:52:00', '2026-03-11 17:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.38, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9b4f8f8b-f80e-4796-bccd-c9f22ba0fc4f', id, '2026-03-11', '2026-03-11 07:25:00', '2026-03-11 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.18, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '70455a3c-7847-4ccf-b72b-ff572fe2039b', id, '2026-03-12', '2026-03-12 07:17:00', '2026-03-12 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.07, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '68a5169b-7665-4306-8295-3879bef394e4', id, '2026-03-12', '2026-03-12 07:19:00', '2026-03-12 17:42:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.38, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a6b29faa-b562-4db9-be8b-c36645504adc', id, '2026-03-12', '2026-03-12 07:14:00', '2026-03-12 17:27:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.22, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0cab8772-6f7f-4d11-858c-c7ac5e80d064', id, '2026-03-12', '2026-03-12 07:02:00', '2026-03-12 18:35:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.55, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b40a2a98-2b31-4982-a48a-fbb66cd821fa', id, '2026-03-12', '2026-03-12 07:12:00', '2026-03-12 18:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.18, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e1fb5385-f8a8-4363-be5e-d891125dd850', id, '2026-03-13', '2026-03-13 07:30:00', '2026-03-13 17:42:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.20, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f799ec23-ee00-4eac-b685-17d7bc1103b0', id, '2026-03-13', '2026-03-13 07:36:00', '2026-03-13 17:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.97, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '125a85b0-64bd-4af9-9609-d421086e0c0b', id, '2026-03-13', '2026-03-13 08:29:00', '2026-03-13 17:30:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.02, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd167e02c-fe14-4366-82ed-78435a9a2b3a', id, '2026-03-13', '2026-03-13 08:54:00', '2026-03-13 18:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.97, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7fe0b307-7baf-4cea-b336-6dc946209f1e', id, '2026-03-13', '2026-03-13 07:45:00', '2026-03-13 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.40, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fed8f164-fe41-4fc8-81d7-cc9ffb7d1da8', id, '2026-03-16', '2026-03-16 07:32:00', '2026-03-16 18:14:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.70, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '52258e09-d96b-4939-8324-62e535c85198', id, '2026-03-16', '2026-03-16 08:03:00', '2026-03-16 17:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.72, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b00c6fc7-5ec5-40b0-9ede-461d9a4ebd02', id, '2026-03-16', '2026-03-16 08:19:00', '2026-03-16 17:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.98, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '84bb1c74-a5a3-480e-9d75-5687eb20d858', id, '2026-03-17', '2026-03-17 08:32:00', '2026-03-17 17:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.08, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '47cd9f8c-3b1d-42e1-981b-e1f979318055', id, '2026-03-17', '2026-03-17 07:03:00', '2026-03-17 18:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.20, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b8499b5f-9a8d-40db-8581-1e0a653487a6', id, '2026-03-17', '2026-03-17 08:40:00', '2026-03-17 18:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.45, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fb29b9d8-f409-4c25-b381-16e997fe6e1d', id, '2026-03-18', '2026-03-18 07:25:00', '2026-03-18 17:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.63, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd86a0e4c-1c33-4361-9ba9-e059812c38d8', id, '2026-03-18', '2026-03-18 07:20:00', '2026-03-18 17:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.15, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6e056fed-12fe-4812-a6eb-7fb14ed49cb9', id, '2026-03-18', '2026-03-18 08:18:00', '2026-03-18 18:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.33, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9c1cb1b7-b8c7-4ff4-bcaa-eb177ac576a6', id, '2026-03-18', '2026-03-18 07:28:00', '2026-03-18 17:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.63, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fccf58f8-6732-43e8-b1a0-4acb6adeab4b', id, '2026-03-19', '2026-03-19 07:14:00', '2026-03-19 17:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.88, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9c1b9b09-96d3-4333-8ac5-0ee794a2b50c', id, '2026-03-19', '2026-03-19 07:27:00', '2026-03-19 17:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.47, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e14881b4-e0d9-424e-8883-c0caba1ebb53', id, '2026-03-19', '2026-03-19 08:28:00', '2026-03-19 17:08:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.67, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd6ca4251-6533-4ca3-a882-a97b0c99c617', id, '2026-03-19', '2026-03-19 07:58:00', '2026-03-19 18:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.82, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5212077b-f706-4dec-8068-31a54fbb3bae', id, '2026-03-19', '2026-03-19 08:05:00', '2026-03-19 17:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.23, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '831d5b4e-f13b-452c-8902-440602dd2310', id, '2026-03-20', '2026-03-20 07:56:00', '2026-03-20 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.10, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cf6b7c5d-a54a-491c-8d61-3d0fef5305f2', id, '2026-03-20', '2026-03-20 07:33:00', '2026-03-20 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.28, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '945c9103-ed69-4936-889f-48e3f6e44dbb', id, '2026-03-20', '2026-03-20 07:54:00', '2026-03-20 18:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.77, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '093b7076-1198-42e0-86f0-d45e32e66ed1', id, '2026-03-20', '2026-03-20 07:55:00', '2026-03-20 18:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.75, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4608138f-bf68-4081-b302-be4c5b35fdd8', id, '2026-03-20', '2026-03-20 07:28:00', '2026-03-20 17:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.00, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'efa20fff-99cf-444a-80af-d40dea511409', id, '2026-03-23', '2026-03-23 07:49:00', '2026-03-23 18:30:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.68, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd5c40449-f205-4af9-bb2f-624f46cf7596', id, '2026-03-23', '2026-03-23 07:18:00', '2026-03-23 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.22, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '428083a3-c677-497b-8e2d-c7d3212e5f77', id, '2026-03-23', '2026-03-23 07:28:00', '2026-03-23 17:49:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.35, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '17432f13-3f88-410d-a99b-29ef7f01d76f', id, '2026-03-23', '2026-03-23 07:14:00', '2026-03-23 17:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.15, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1ac2ddc0-4a5c-4e0c-96a0-d6beb61792aa', id, '2026-03-23', '2026-03-23 07:58:00', '2026-03-23 18:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.13, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5f0cc6a0-0d26-4c0a-b954-4b0d5186d366', id, '2026-03-24', '2026-03-24 07:05:00', '2026-03-24 18:59:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.90, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4dd9c2cf-1bc7-4619-8edf-45887fe03519', id, '2026-03-24', '2026-03-24 07:56:00', '2026-03-24 18:32:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.60, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0da77261-fe83-4b1b-9694-4cd43713ab2f', id, '2026-03-24', '2026-03-24 07:31:00', '2026-03-24 18:18:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.78, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5eccb476-ebfe-4f95-8bc7-df74f822cc5c', id, '2026-03-24', '2026-03-24 07:07:00', '2026-03-24 18:53:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.77, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '47c3bda8-9124-4e4a-b6e2-93cd86500462', id, '2026-03-25', '2026-03-25 07:40:00', '2026-03-25 18:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.10, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '40b35689-1279-42dd-990b-e2706da2d31b', id, '2026-03-25', '2026-03-25 07:47:00', '2026-03-25 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.57, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'bcefba2b-f6a9-4221-b0f8-790a7c651f0c', id, '2026-03-25', '2026-03-25 07:31:00', '2026-03-25 18:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.05, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5c7016ad-a83f-42a5-bbd5-02a8acc724d3', id, '2026-03-25', '2026-03-25 08:31:00', '2026-03-25 18:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.10, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '587c616d-9f2d-4624-8c4e-b2361fd24f6a', id, '2026-03-25', '2026-03-25 07:16:00', '2026-03-25 18:55:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.65, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fee44ff4-110c-4359-8134-0ea02bb9d9bc', id, '2026-03-26', '2026-03-26 07:53:00', '2026-03-26 18:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.05, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '78ee736d-e98c-4418-b7b4-56d95d9bcafb', id, '2026-03-26', '2026-03-26 08:45:00', '2026-03-26 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.52, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0c2ed76f-73f3-4e5f-badb-4207b6ee6375', id, '2026-03-26', '2026-03-26 07:15:00', '2026-03-26 18:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.35, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9f54db5e-08ca-491f-8914-5fd0a42d0a8c', id, '2026-03-26', '2026-03-26 07:29:00', '2026-03-26 17:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.15, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '139ab584-04a1-4c96-a7b2-1f09d5239e16', id, '2026-03-26', '2026-03-26 07:30:00', '2026-03-26 18:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.77, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b8fcd33a-9232-414d-bcbd-07106f1cbee5', id, '2026-03-27', '2026-03-27 08:58:00', '2026-03-27 17:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.08, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9945273b-01fd-4813-88da-8eeab98b72a9', id, '2026-03-27', '2026-03-27 07:12:00', '2026-03-27 18:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.23, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '65ed64ec-eb93-477e-80e1-3a186ee8a02c', id, '2026-03-27', '2026-03-27 07:11:00', '2026-03-27 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.17, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2609bdbf-500e-4799-a275-406724c1ac99', id, '2026-03-27', '2026-03-27 07:31:00', '2026-03-27 18:01:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.50, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c7009828-aaf8-4f30-aa58-23545ec3d841', id, '2026-03-27', '2026-03-27 07:35:00', '2026-03-27 18:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.27, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cceb404a-842f-4212-930b-ded5555ee550', id, '2026-03-30', '2026-03-30 07:35:00', '2026-03-30 17:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.67, '2026-03' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7d79614d-ae81-41bf-a427-2983ff796bd9', id, '2026-03-30', '2026-03-30 07:30:00', '2026-03-30 17:46:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.27, '2026-03' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd745187b-8ca7-44ce-b26b-8957b640ca41', id, '2026-03-30', '2026-03-30 07:36:00', '2026-03-30 18:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.95, '2026-03' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '06196f69-a522-4a87-8587-4972fdf88c87', id, '2026-03-30', '2026-03-30 07:01:00', '2026-03-30 17:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.10, '2026-03' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '67c586d7-c6f1-4778-9908-90ba33a2a593', id, '2026-03-30', '2026-03-30 07:28:00', '2026-03-30 17:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.20, '2026-03' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ac04eb8f-35c5-4883-a6a0-6e008e7f8b9c', id, '2026-04-02', '2026-04-02 07:05:00', '2026-04-02 18:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.03, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '47f52b10-eeff-48d7-9698-3a4dbd13f8b8', id, '2026-04-02', '2026-04-02 07:29:00', '2026-04-02 18:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.63, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5dc12e59-adda-4c32-b27c-af328734ad66', id, '2026-04-02', '2026-04-02 07:55:00', '2026-04-02 17:35:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.67, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3772cd76-c657-4e0e-b73d-23ea7e9fd128', id, '2026-04-02', '2026-04-02 08:46:00', '2026-04-02 17:11:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.42, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f693ea47-30c2-43fd-9098-9df34dbb30b8', id, '2026-04-02', '2026-04-02 07:41:00', '2026-04-02 18:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.57, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '14e2df65-c223-4ab6-b00e-4025bc0e9b2a', id, '2026-04-03', '2026-04-03 07:43:00', '2026-04-03 17:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.67, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fd9f2866-1c01-47a1-9d8c-f38b8a333ef7', id, '2026-04-03', '2026-04-03 07:26:00', '2026-04-03 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.97, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4263cef1-1702-42ad-8f88-94e82aa8165f', id, '2026-04-03', '2026-04-03 07:28:00', '2026-04-03 18:19:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.85, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6a8fb94d-d2e2-4e2f-a218-ee984bcb8999', id, '2026-04-03', '2026-04-03 07:05:00', '2026-04-03 18:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.43, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dea9a96a-33e3-42a5-822b-b395c149e89a', id, '2026-04-03', '2026-04-03 07:17:00', '2026-04-03 17:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.10, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5f3df110-4ee6-4336-98f7-1dc0ed2505c5', id, '2026-04-06', '2026-04-06 07:34:00', '2026-04-06 17:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.05, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4e061ba0-525f-4a2a-9665-69cf04ef20cb', id, '2026-04-06', '2026-04-06 07:37:00', '2026-04-06 18:23:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.77, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '3890de60-0578-49c7-90e9-82bcfd402707', id, '2026-04-06', '2026-04-06 07:55:00', '2026-04-06 17:30:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.58, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9dd75935-58a0-43c2-b371-1e313f2dd8be', id, '2026-04-06', '2026-04-06 07:20:00', '2026-04-06 18:35:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.25, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '95f82e99-9ccc-486d-a361-2b50ba5df8f0', id, '2026-04-06', '2026-04-06 07:53:00', '2026-04-06 18:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.23, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5d2ea273-e413-4734-ae27-aafd1ee41c3a', id, '2026-04-07', '2026-04-07 08:15:00', '2026-04-07 18:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.87, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a417dac1-41df-47b5-8e4f-4fb8464a68f2', id, '2026-04-07', '2026-04-07 08:56:00', '2026-04-07 18:49:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.88, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '46bd5c97-091b-4a58-9519-8cb44cdaf705', id, '2026-04-07', '2026-04-07 07:35:00', '2026-04-07 17:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.70, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '028738ed-ba6f-4f8b-8736-4266d4968e2d', id, '2026-04-07', '2026-04-07 07:21:00', '2026-04-07 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.17, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0ef7b0ae-9a7d-4789-8b3f-0ead8a8be892', id, '2026-04-07', '2026-04-07 07:02:00', '2026-04-07 18:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.92, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8476f28d-5ca4-4ca7-abad-7eb1d0bb8ddb', id, '2026-04-08', '2026-04-08 07:06:00', '2026-04-08 17:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.38, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '162c9744-a8d8-4968-8253-8c3703b3c14a', id, '2026-04-08', '2026-04-08 07:35:00', '2026-04-08 17:32:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.95, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9ec5a2e1-cfda-4c3a-97ef-b0507a577b4c', id, '2026-04-08', '2026-04-08 07:54:00', '2026-04-08 18:01:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.12, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f917d17c-80f4-4fbe-8d19-b6e4596e823a', id, '2026-04-08', '2026-04-08 08:08:00', '2026-04-08 18:28:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.33, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '20964a98-8e52-466f-b32c-360d355590cd', id, '2026-04-09', '2026-04-09 07:36:00', '2026-04-09 18:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.37, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c253f19d-b463-4b23-a880-fc3e9ab7dc5f', id, '2026-04-09', '2026-04-09 08:09:00', '2026-04-09 17:17:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.13, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f580007c-c41b-4459-b5d6-cd985433fff0', id, '2026-04-09', '2026-04-09 07:43:00', '2026-04-09 18:54:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.18, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2bede908-c566-46d3-b3be-da4bda15f8a9', id, '2026-04-09', '2026-04-09 07:28:00', '2026-04-09 17:32:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.07, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '875466ce-acd3-48dd-949f-24f09cd515c6', id, '2026-04-09', '2026-04-09 07:01:00', '2026-04-09 17:20:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.32, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '60aa34f5-1192-49fc-b529-b76987597325', id, '2026-04-10', '2026-04-10 07:00:00', '2026-04-10 18:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.20, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd41a3dd4-4c95-4be4-be16-edcdeb24aad7', id, '2026-04-10', '2026-04-10 07:41:00', '2026-04-10 17:25:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.73, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '944bc89c-1941-4609-9445-b76e0c15059c', id, '2026-04-10', '2026-04-10 08:00:00', '2026-04-10 17:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.85, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a6a78769-7305-470f-bba0-873fa7290c7a', id, '2026-04-10', '2026-04-10 08:04:00', '2026-04-10 17:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.57, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f6a58730-b361-4e64-bf42-6527787f9e58', id, '2026-04-10', '2026-04-10 08:49:00', '2026-04-10 17:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.85, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '1ab213e8-979a-467b-9361-51bae4b85b5a', id, '2026-04-13', '2026-04-13 08:44:00', '2026-04-13 18:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.83, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cbdab820-2520-4492-92a4-e4f30456823d', id, '2026-04-13', '2026-04-13 08:15:00', '2026-04-13 18:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.72, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '20d55ba8-8b13-49bf-99b9-9cf9a02359b5', id, '2026-04-13', '2026-04-13 07:28:00', '2026-04-13 18:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.63, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'aa0ae484-2d9d-4b52-8f1e-6a62d7a0f545', id, '2026-04-13', '2026-04-13 07:23:00', '2026-04-13 18:44:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.35, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'cf8af524-b6ea-4355-9ee8-a0678dded473', id, '2026-04-13', '2026-04-13 07:56:00', '2026-04-13 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.58, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a9fa05e3-559a-46d7-9f58-d5d22003a457', id, '2026-04-14', '2026-04-14 07:17:00', '2026-04-14 18:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.72, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4fb9d802-0205-42ef-b1bc-64ac92a66aba', id, '2026-04-14', '2026-04-14 07:20:00', '2026-04-14 17:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.73, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '703c4c33-8a0d-4547-915a-a465216b23db', id, '2026-04-14', '2026-04-14 07:03:00', '2026-04-14 18:56:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.88, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '25e87566-d778-47a7-a595-389458c49c4c', id, '2026-04-14', '2026-04-14 08:00:00', '2026-04-14 18:49:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.82, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fa770d45-6f9c-48b6-b87d-927c29157d35', id, '2026-04-14', '2026-04-14 07:09:00', '2026-04-14 18:06:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.95, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f9e1891d-e2b1-488f-add8-6839e05910b8', id, '2026-04-15', '2026-04-15 07:53:00', '2026-04-15 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.72, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9337fd36-8fda-41b0-bbba-4677927e269e', id, '2026-04-15', '2026-04-15 07:54:00', '2026-04-15 17:53:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.98, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '8aa3bbc2-67a7-4394-ac37-477eb2b3bc4c', id, '2026-04-15', '2026-04-15 08:30:00', '2026-04-15 18:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.18, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4f32faed-977e-4d19-9009-1d4fa679fe7a', id, '2026-04-15', '2026-04-15 08:54:00', '2026-04-15 17:38:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.73, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '74a4507b-8b4f-4cc8-8d11-d2a6900a8c9d', id, '2026-04-15', '2026-04-15 07:41:00', '2026-04-15 17:26:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.75, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c9f235a5-2e37-4696-bf8c-e7980e1e8110', id, '2026-04-16', '2026-04-16 07:19:00', '2026-04-16 18:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.80, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '59a63bca-7cd7-4b0b-ab54-2159ef84308f', id, '2026-04-16', '2026-04-16 07:55:00', '2026-04-16 18:29:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.57, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e0117a7b-b7f1-4186-9c45-e60ddafb47d8', id, '2026-04-16', '2026-04-16 07:19:00', '2026-04-16 17:12:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.88, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '5c948ab4-ffeb-4fdb-bcdc-b48d8def13bb', id, '2026-04-16', '2026-04-16 08:28:00', '2026-04-16 17:07:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 8.65, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9341c0c9-903c-4c32-bbbd-1ca4033fef2e', id, '2026-04-16', '2026-04-16 07:30:00', '2026-04-16 17:27:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.95, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '483544c2-9c88-4157-b150-e4c1b824b6df', id, '2026-04-17', '2026-04-17 07:57:00', '2026-04-17 17:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.83, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '83c62422-7518-498e-a73a-4710ba0f11a4', id, '2026-04-17', '2026-04-17 07:45:00', '2026-04-17 17:34:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.82, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'be51f0d0-2fbf-489e-8638-82bf1ede44f0', id, '2026-04-17', '2026-04-17 07:23:00', '2026-04-17 18:30:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.12, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ec8a5869-c75b-41dc-9d8c-20b332457f4c', id, '2026-04-17', '2026-04-17 07:38:00', '2026-04-17 18:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.02, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f973b228-7473-44a9-a58d-447897c1408b', id, '2026-04-17', '2026-04-17 07:56:00', '2026-04-17 17:59:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.05, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '80111797-b5cb-496d-8c57-d0339cde57eb', id, '2026-04-20', '2026-04-20 07:54:00', '2026-04-20 17:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.95, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '37e00414-fa12-4b13-b41a-d1f1c60a9d10', id, '2026-04-20', '2026-04-20 07:24:00', '2026-04-20 17:52:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.47, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '85f45d48-00cd-4b67-a97f-9522a455357c', id, '2026-04-20', '2026-04-20 07:36:00', '2026-04-20 18:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.00, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'a585e4ff-097b-4753-bb2b-d23ca9cd29dd', id, '2026-04-20', '2026-04-20 07:20:00', '2026-04-20 18:43:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.38, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '6c5c7098-583a-4b12-b661-ef24a1fb1387', id, '2026-04-20', '2026-04-20 08:14:00', '2026-04-20 17:40:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.43, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '91d621db-ece0-4452-9f27-2f65fa2bca9b', id, '2026-04-21', '2026-04-21 07:14:00', '2026-04-21 18:35:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.35, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'dec420d4-6bc3-41f4-b8ed-895466577a8b', id, '2026-04-21', '2026-04-21 08:07:00', '2026-04-21 18:24:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.28, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c7929cce-5821-4cca-a4ec-d44400467679', id, '2026-04-21', '2026-04-21 07:41:00', '2026-04-21 17:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.27, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b242bd86-6de1-49cb-b8d6-8c72c643947b', id, '2026-04-21', '2026-04-21 07:05:00', '2026-04-21 17:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.18, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fbd838b6-1721-4d96-9715-3c40fd63a077', id, '2026-04-21', '2026-04-21 07:05:00', '2026-04-21 18:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.57, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '67a84602-a8e0-4ebb-b39b-677ef3dc6bca', id, '2026-04-22', '2026-04-22 07:35:00', '2026-04-22 17:47:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.20, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'ea108176-b609-4f47-9101-56f655d7db0e', id, '2026-04-22', '2026-04-22 07:50:00', '2026-04-22 17:09:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.32, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '665d3818-91b9-41e4-afe7-85ce40067b40', id, '2026-04-22', '2026-04-22 07:10:00', '2026-04-22 18:02:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.87, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '7d0a506d-61c7-48a0-b5a6-ee34d98f86ff', id, '2026-04-22', '2026-04-22 07:27:00', '2026-04-22 17:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.72, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '50f16d2a-3515-4871-b4af-ca48f5c06854', id, '2026-04-22', '2026-04-22 07:07:00', '2026-04-22 17:37:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.50, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '63b60a52-96d2-4916-beba-a509fdbc12cf', id, '2026-04-23', '2026-04-23 07:17:00', '2026-04-23 17:15:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.97, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'fed7f2a9-3386-4258-b741-e60300b5c64c', id, '2026-04-23', '2026-04-23 07:58:00', '2026-04-23 17:48:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.83, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '24c9c262-3f97-4a3c-8d1e-12c897c291a8', id, '2026-04-23', '2026-04-23 08:56:00', '2026-04-23 18:41:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.75, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'e18d7ee3-efa9-4ce0-b99b-b8d0adb8c2ca', id, '2026-04-23', '2026-04-23 07:13:00', '2026-04-23 17:53:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.67, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '93c3c2a9-bad8-47b0-8a86-9b18f931e070', id, '2026-04-23', '2026-04-23 07:43:00', '2026-04-23 18:51:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.13, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'bb7261e2-f317-4854-9e67-a77d68386b3f', id, '2026-04-24', '2026-04-24 07:41:00', '2026-04-24 18:50:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.15, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '9d14fdaf-dd77-431f-96dd-9dd236e8c80c', id, '2026-04-24', '2026-04-24 07:23:00', '2026-04-24 18:10:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.78, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '12bbeee5-ffb4-4a55-a0f3-974ade042d26', id, '2026-04-24', '2026-04-24 07:51:00', '2026-04-24 18:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.22, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '74b9b9d0-d72a-4e22-b97b-3034e5917622', id, '2026-04-24', '2026-04-24 07:21:00', '2026-04-24 18:32:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.18, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'db5dd2af-5cbc-4153-b7af-3699a4f241ca', id, '2026-04-24', '2026-04-24 08:17:00', '2026-04-24 18:04:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.78, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '920b28e9-3022-4de5-b0ae-1db7b36543bf', id, '2026-04-27', '2026-04-27 07:12:00', '2026-04-27 17:21:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.15, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'df89c006-2113-42b2-9bce-896cca9ac701', id, '2026-04-27', '2026-04-27 07:28:00', '2026-04-27 18:54:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.43, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '22aff92e-de0b-4225-a55c-6a5ed2be8ac1', id, '2026-04-27', '2026-04-27 07:36:00', '2026-04-27 18:05:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.48, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'daf8c8dd-b1ff-4472-9440-b8ab1d40a74d', id, '2026-04-27', '2026-04-27 07:55:00', '2026-04-27 17:58:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.05, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'edc96d44-6f0c-4245-a2f5-eab61d92a1f6', id, '2026-04-27', '2026-04-27 07:16:00', '2026-04-27 17:13:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.95, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '85cda594-9899-4b50-b02e-fddad6d43d91', id, '2026-04-28', '2026-04-28 07:49:00', '2026-04-28 17:39:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.83, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '809f67ec-e047-4d2a-a815-ab7993948687', id, '2026-04-28', '2026-04-28 07:37:00', '2026-04-28 18:03:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.43, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'f0035d21-a89d-4ece-b67f-6dbff4f970c7', id, '2026-04-28', '2026-04-28 08:37:00', '2026-04-28 18:42:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.08, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '39986ff7-d81b-477a-beb8-f3c41dd2bd2a', id, '2026-04-28', '2026-04-28 07:27:00', '2026-04-28 18:14:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.78, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd26790eb-119b-4b41-bf0d-2d01b844e0b2', id, '2026-04-29', '2026-04-29 08:06:00', '2026-04-29 18:13:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.12, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '0b250b7c-c289-418c-b9b8-06956a324b58', id, '2026-04-29', '2026-04-29 07:00:00', '2026-04-29 18:13:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 11.22, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '09059515-3eb7-44a3-a1b0-3cdf7298e8c9', id, '2026-04-29', '2026-04-29 08:29:00', '2026-04-29 17:57:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 9.47, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'd6399835-fbfd-4494-bd81-b849d79272ec', id, '2026-04-29', '2026-04-29 07:47:00', '2026-04-29 17:00:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.22, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2fb54d3a-cc88-4686-8d53-27532c178f25', id, '2026-04-29', '2026-04-29 07:11:00', '2026-04-29 17:36:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.42, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'c971bf4e-3d8a-4468-9b42-03624b21d8ec', id, '2026-04-30', '2026-04-30 07:38:00', '2026-04-30 17:43:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.08, '2026-04' FROM users WHERE email = 'karyawan1@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '4ec6c232-fbd6-415e-81e7-44b142679e2c', id, '2026-04-30', '2026-04-30 07:32:00', '2026-04-30 17:33:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 10.02, '2026-04' FROM users WHERE email = 'karyawan2@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT '2d19e779-8f01-4a78-a3f1-b30e78ebab6f', id, '2026-04-30', '2026-04-30 07:32:00', '2026-04-30 17:31:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.98, '2026-04' FROM users WHERE email = 'karyawan3@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'b81d9247-fb20-46f6-9d5d-e093ed0337f5', id, '2026-04-30', '2026-04-30 07:36:00', '2026-04-30 17:16:00', -6.2088, 106.8456, -6.2088, 106.8456, 'present', 9.67, '2026-04' FROM users WHERE email = 'karyawan4@talenta.com';
INSERT INTO attendance (id, user_id, date, clock_in, clock_out, clock_in_lat, clock_in_lng, clock_out_lat, clock_out_lng, status, work_hours, period_month) 
SELECT 'eeba64a7-5be8-4480-a489-3459f3fb9bd9', id, '2026-04-30', '2026-04-30 08:06:00', '2026-04-30 18:27:00', -6.2088, 106.8456, -6.2088, 106.8456, 'late', 10.35, '2026-04' FROM users WHERE email = 'karyawan5@talenta.com';
SET FOREIGN_KEY_CHECKS = 1;
-- Total Working Days: 81
-- Total Attendance Records: 386
-- Avg Attendance per User: 77.2 / 81
