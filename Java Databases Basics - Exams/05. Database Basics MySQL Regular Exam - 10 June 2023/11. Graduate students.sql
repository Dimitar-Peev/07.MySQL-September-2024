USE `05_universities_db`;

DROP PROCEDURE IF EXISTS udp_graduate_all_students_by_year;

DELIMITER ~
--
CREATE PROCEDURE udp_graduate_all_students_by_year(year_started INT)
BEGIN
    UPDATE `students` AS s
        INNER JOIN `students_courses` AS sc
        ON s.`id` = sc.`student_id`
        INNER JOIN `courses` AS c
        ON sc.`course_id` = c.`id`
    SET s.`is_graduated` = TRUE
    WHERE YEAR(c.`start_date`) = `year_started`;
END
--
~
CALL udp_graduate_all_students_by_year(2017);
