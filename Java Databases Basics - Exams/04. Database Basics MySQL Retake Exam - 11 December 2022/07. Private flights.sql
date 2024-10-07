USE `04_airlines_db`;
--
SELECT CONCAT(UCASE(LEFT(`last_name`, 2)), `country_id`) AS 'flight_code',
       CONCAT(`first_name`, ' ', `last_name`)            AS 'full_name',
       `country_id`
FROM `passengers` AS p
         LEFT JOIN `flights_passengers` AS fp
                   ON p.`id` = fp.`passenger_id`
WHERE `flight_id` IS NULL
ORDER BY `country_id`;