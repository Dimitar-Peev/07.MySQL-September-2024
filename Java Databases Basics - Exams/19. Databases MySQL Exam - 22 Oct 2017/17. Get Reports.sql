USE `19_report_service`;
--
DROP FUNCTION IF EXISTS udf_get_reports_count;

DELIMITER ~
--
CREATE FUNCTION udf_get_reports_count(employee_id INT, status_id INT)
    RETURNS INT
    DETERMINISTIC
    READS SQL DATA
BEGIN
    DECLARE reports_count INT;

    SELECT COUNT(r.`id`)
    INTO reports_count
    FROM `reports` AS r
    WHERE r.`employee_Id` = employee_id
      AND r.`status_id` = status_id;

    RETURN reports_count;
END
--
~

SELECT `id`,
       `first_name`,
       `last_name`,
       udf_get_reports_count(id, 2) AS 'reports_count'
FROM `employees`
ORDER BY `id`;

