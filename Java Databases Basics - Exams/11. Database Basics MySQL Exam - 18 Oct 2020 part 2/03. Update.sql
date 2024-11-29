USE `11_softuni_stores_system`;
--
UPDATE `employees` AS e
    INNER JOIN `stores` AS s
    ON s.`id` = e.`store_id`
SET e.`manager_id` = 3,
    e.`salary`     = `salary` - 500
WHERE e.`hire_date` > '2003-01-01 00:00:00'
  AND s.`name` NOT IN ('Cardguard', 'Veribet');