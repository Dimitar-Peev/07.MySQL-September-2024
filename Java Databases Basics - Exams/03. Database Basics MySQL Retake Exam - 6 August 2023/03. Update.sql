USE `03_real_estate_db`;
--
UPDATE `properties`
SET `price` = `price` - 50000
WHERE `price` >= 800000;