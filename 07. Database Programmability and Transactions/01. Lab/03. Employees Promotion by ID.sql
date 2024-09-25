USE `soft_uni`;

DROP PROCEDURE IF EXISTS usp_raise_salary_by_id;

DELIMITER ~
--
CREATE PROCEDURE `usp_raise_salary_by_id`(p_id INT)
BEGIN
    DECLARE count_by_id INT;

    START TRANSACTION;
    SET count_by_id := (SELECT COUNT(*)
                        FROM `employees`
                        WHERE `employee_id` = p_id);

    UPDATE `employees`
    SET `salary` = `salary` * 1.05
    WHERE `employee_id` = p_id;

    IF (count_by_id < 1) THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;

END
--
~

CALL usp_raise_salary_by_id(17);

SELECT `salary`
FROM `employees`
WHERE `employee_id` = 17;