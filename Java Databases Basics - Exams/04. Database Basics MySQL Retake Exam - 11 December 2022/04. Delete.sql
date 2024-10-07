USE `04_airlines_db`;
--
DELETE f
FROM `flights` AS f
         LEFT JOIN `flights_passengers` AS fp
                   ON f.`id` = fp.`flight_id`
WHERE fp.`flight_id` IS NULL;