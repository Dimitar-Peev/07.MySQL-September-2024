USE `05_universities_db`;

DROP FUNCTION IF EXISTS udf_average_alumni_grade_by_course_name;

DELIMITER ~
--
CREATE FUNCTION udf_average_alumni_grade_by_course_name(f_course_name VARCHAR(60))
    RETURNS DECIMAL(3, 2)
    DETERMINISTIC
BEGIN
    DECLARE `average grade` DECIMAL(3, 2);
    SET `average grade` := (SELECT AVG(sc.`grade`)
                            FROM `courses` AS c
                                     INNER JOIN `students_courses` AS sc
                                                ON c.`id` = sc.`course_id`
                                     INNER JOIN `students` AS s
                                                ON s.`id` = sc.`student_id`
                            WHERE c.`name` = `f_course_name`
                              AND s.`is_graduated` IS TRUE
                            GROUP BY c.`id`);
    RETURN `average grade`;
END
--
~
SELECT c.`name`, udf_average_alumni_grade_by_course_name('Quantum Physics') AS average_alumni_grade
FROM `courses` AS c
WHERE c.`name` = 'Quantum Physics';
