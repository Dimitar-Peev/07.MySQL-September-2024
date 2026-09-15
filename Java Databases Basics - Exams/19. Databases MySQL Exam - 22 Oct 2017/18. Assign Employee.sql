USE `19_report_service`;
--
DROP PROCEDURE IF EXISTS usp_assign_employee_to_report;

DELIMITER ~
--
CREATE PROCEDURE usp_assign_employee_to_report(IN employee_id INT, IN report_id INT)
BEGIN
    DECLARE employee_department_id INT;
    DECLARE report_department_id INT;

    START TRANSACTION;

    SELECT e.`department_id`
    INTO employee_department_id
    FROM `employees` AS e
    WHERE e.`id` = employee_id;

    SELECT c.`department_id`
    INTO report_department_id
    FROM `reports` AS r
             INNER JOIN `categories` AS c
                        ON r.`category_id` = c.`id`
    WHERE r.`id` = report_id;

    IF employee_department_id IS NOT NULL
        AND report_department_id IS NOT NULL
        AND employee_department_id = report_department_id THEN

        UPDATE `reports`
        SET `employee_Id` = employee_id
        WHERE `id` = report_id;

        COMMIT;
    ELSE
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Employee doesn''t belong to the appropriate department!';
    END IF;
END
--
~
CALL usp_assign_employee_to_report(30, 1); -- Employee doesn't belong to the appropriate department!
--

CALL usp_assign_employee_to_report(17, 2);
SELECT `employee_id`
FROM `reports`
WHERE `id` = 2; -- 17
