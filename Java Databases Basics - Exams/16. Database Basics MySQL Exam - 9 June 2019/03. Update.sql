USE `16_ruk_database`;
--
UPDATE `employees_clients` AS ec
SET ec.`employee_id` = (SELECT ecc.`employee_id`
                        FROM (SELECT *
                              FROM `employees_clients`) AS ecc
                        GROUP BY `employee_id`
                        ORDER BY COUNT(`client_id`), `employee_id`
                        LIMIT 1)
WHERE ec.`employee_id` = ec.`client_id`;