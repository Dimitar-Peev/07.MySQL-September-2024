USE `01_go_roadie`;
--
SELECT ds.`id`, ds.`name`, c.`brand`
FROM `driving_schools` AS ds
         LEFT JOIN `instructors_driving_schools` AS ids
                   ON ids.`driving_school_id` = ds.`id`
         LEFT JOIN `cars` AS c
                   ON c.`id` = ds.`car_id`
WHERE ids.`instructor_id` IS NULL
ORDER BY `brand`, `id`
LIMIT 5;
