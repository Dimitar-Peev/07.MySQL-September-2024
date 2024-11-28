USE `11_softuni_stores_system`;

SELECT *
FROM `employees` AS e
         INNER JOIN `stores` AS s
                    ON e.`store_id` = s.`id`
WHERE s.`name` = 'Stronghold'
ORDER BY e.`salary` DESC
LIMIT 1;

DROP FUNCTION IF EXISTS udf_top_paid_employee_by_store;

DELIMITER ~
--
CREATE FUNCTION udf_top_paid_employee_by_store(f_store_name VARCHAR(50))
    RETURNS TEXT
    DETERMINISTIC
BEGIN
    DECLARE output TEXT;
    SET output := (SELECT CONCAT_WS(' ', e.`first_name`, CONCAT(e.`middle_name`, '.'),
                                    e.`last_name`, 'works in store for',
                                    2020 - YEAR(e.`hire_date`), 'years')
                   FROM `employees` AS e
                            INNER JOIN `stores` AS s
                                       ON s.`id` = e.`store_id`
                   WHERE s.`name` = f_store_name
                   ORDER BY e.`salary` DESC
                   LIMIT 1);
    RETURN output;
END
--
~
SELECT udf_top_paid_employee_by_store('Stronghold') AS 'full_info';