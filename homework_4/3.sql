use vk;

ALTER TABLE profiles  ADD is_active BOOL DEFAULT TRUE;


UPDATE profiles 
SET is_active = FALSE
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) < 18;

