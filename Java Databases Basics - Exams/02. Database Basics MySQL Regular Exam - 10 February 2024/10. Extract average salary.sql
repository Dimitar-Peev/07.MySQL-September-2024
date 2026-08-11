USE `02_preserves_db`;
--
DROP FUNCTION IF EXISTS udf_average_salary_by_position_name;

DELIMITER ~
--
CREATE FUNCTION udf_average_salary_by_position_name(f_name VARCHAR(40))
    RETURNS DECIMAL(10, 2)
    DETERMINISTIC
BEGIN
    DECLARE avg_salary DECIMAL(10, 2);

    SET avg_salary := (SELECT AVG(`salary`)
                       FROM `workers` AS w
                                INNER JOIN `positions` AS p
                                           ON w.`position_id` = p.`id`
                       WHERE p.`name` = f_name);

    RETURN avg_salary;
END;
--
~

SELECT `name`, udf_average_salary_by_position_name('Forester') AS 'position_average_salary'
FROM `positions`
WHERE `name` = 'Forester'
