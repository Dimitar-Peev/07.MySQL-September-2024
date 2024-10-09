USE `ep_preserves_db`;
--
DELIMITER $$

CREATE FUNCTION udf_average_salary_by_position_name(target_name VARCHAR(40))
    RETURNS DECIMAL(19, 2)
    DETERMINISTIC
BEGIN
    RETURN (SELECT AVG(salary)
            FROM workers w
                     JOIN positions p
                          ON w.position_id = p.id
            WHERE p.name = target_name);
END $$

DELIMITER ;

SELECT p.name, udf_average_salary_by_position_name('Forester') as position_average_salary
FROM positions p
WHERE p.name = 'Forester';

