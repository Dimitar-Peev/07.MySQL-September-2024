USE `04_airlines_db`;
--
UPDATE `flights`
SET `airplane_id` = `airplane_id` + 1
WHERE `departure_country` = 22;