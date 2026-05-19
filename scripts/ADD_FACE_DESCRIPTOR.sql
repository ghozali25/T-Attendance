-- ================================================
-- Migration: Add face_descriptor column to profiles
-- ================================================

ALTER TABLE profiles 
ADD COLUMN face_descriptor JSON NULL AFTER avatar_url;

-- Log
SELECT 'Migration completed: face_descriptor column added to profiles table' as status;