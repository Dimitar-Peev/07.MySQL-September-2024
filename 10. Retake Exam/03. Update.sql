USE `foods_friends`;
--
UPDATE `offerings`
SET `name` = UPPER(`name`)
WHERE `name` LIKE '%Pizza%';