USE `soft_uni`;

DROP PROCEDURE IF EXISTS usp_get_employees_salary_above;

DELIMITER ~
--
CREATE PROCEDURE usp_get_employees_salary_above(target DECIMAL(19, 4))
BEGIN
    SELECT `first_name`, `last_name`
    FROM `employees`
    WHERE `salary` >= target
    ORDER BY `first_name`, `last_name`, `employee_id`;
END
--
~
CALL usp_get_employees_salary_above(45000);