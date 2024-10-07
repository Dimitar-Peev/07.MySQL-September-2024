USE `04_airlines_db`;
--
SELECT c.`name`,
       c.`currency`,
       COUNT(fp.`passenger_id`) AS 'booked_tickets'
FROM `countries` AS c
         INNER JOIN `flights` AS f
                    ON c.`id` = f.`destination_country`
         INNER JOIN `flights_passengers` AS fp
                    ON f.`id` = fp.`flight_id`
GROUP BY c.`id`
HAVING booked_tickets >= 20
ORDER BY booked_tickets DESC;