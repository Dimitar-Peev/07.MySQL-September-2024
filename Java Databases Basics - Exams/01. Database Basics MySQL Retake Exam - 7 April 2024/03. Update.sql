USE `01_go_roadie`;
--
UPDATE `driving_schools`
SET `average_lesson_price` = `average_lesson_price` + 30
WHERE `city_id` = 5
  AND `night_time_driving` IS TRUE;