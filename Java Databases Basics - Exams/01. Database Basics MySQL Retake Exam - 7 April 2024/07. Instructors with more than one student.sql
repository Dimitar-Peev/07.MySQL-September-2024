USE `01_go_roadie`;
--
SELECT i.`first_name`,
       i.`last_name`,
       COUNT(`is`.`student_id`) AS 'students_count',
       c.`name`                 AS 'city'
FROM `instructors` AS i
         INNER JOIN `instructors_students` AS `is`
                    ON i.`id` = `is`.`instructor_id`
         INNER JOIN `instructors_driving_schools` AS ids
                    ON i.`id` = ids.`instructor_id`
         INNER JOIN `driving_schools` AS ds
                    ON ids.`driving_school_id` = ds.`id`
         INNER JOIN `cities` AS c
                    ON ds.`city_id` = c.`id`
GROUP BY i.`id`, i.`first_name`, i.`last_name`, c.`name`
HAVING COUNT(`is`.`student_id`) > 1
ORDER BY `students_count` DESC, i.`first_name`;