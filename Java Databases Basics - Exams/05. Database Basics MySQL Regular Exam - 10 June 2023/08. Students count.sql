USE `05_universities_db`;
--
SELECT COUNT(*) AS 'students_count',
       u.`name` AS 'university_name'
FROM `universities` AS u
         INNER JOIN `courses` AS c
                    ON u.`id` = c.`university_id`
         INNER JOIN `students_courses` AS sc
                    ON c.`id` = sc.`course_id`
GROUP BY `university_name`
HAVING `students_count` >= 8
ORDER BY `students_count` DESC, `university_name` DESC;