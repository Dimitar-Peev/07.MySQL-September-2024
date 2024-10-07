USE `ep_go_rodie`;
--
UPDATE driving_schools dc
    JOIN cities c ON dc.city_id = c.id
SET average_lesson_price = average_lesson_price + 30
WHERE night_time_driving = 1
  AND c.name = 'London';