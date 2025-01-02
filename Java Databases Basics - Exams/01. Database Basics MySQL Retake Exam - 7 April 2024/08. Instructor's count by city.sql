USE `01_go_roadie`;
--
SELECT c.`name`,
       COUNT(DISTINCT i.`id`) AS 'instructors_count'
FROM `driving_schools` AS ds
         INNER JOIN `instructors_driving_schools` AS ids
                    ON ds.`id` = ids.`driving_school_id`
         INNER JOIN `instructors` AS i
                    ON ids.`instructor_id` = i.`id`
         INNER JOIN `cities` AS c
                    ON ds.`city_id` = c.`id`
GROUP BY c.`name`
HAVING `instructors_count` > 0
ORDER BY `instructors_count` DESC;