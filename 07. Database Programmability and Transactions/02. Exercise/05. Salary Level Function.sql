USE `soft_uni`;

DROP FUNCTION IF EXISTS ufn_get_salary_level;

DELIMITER ~
--
CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(19, 2))
    RETURNS VARCHAR(7)
    DETERMINISTIC
BEGIN
    DECLARE salary_level VARCHAR(7);
    IF salary < 30000 THEN
        SET salary_level := 'Low';
    ELSEIF salary <= 50000 THEN
        SET salary_level := 'Average';
    ELSE
        SET salary_level := 'High';
    END IF;
    RETURN salary_level;
END
--
~
SELECT ufn_get_salary_level(13500) AS 'salary_level';
SELECT ufn_get_salary_level(43300) AS 'salary_level';
SELECT ufn_get_salary_level(125500) AS 'salary_level';