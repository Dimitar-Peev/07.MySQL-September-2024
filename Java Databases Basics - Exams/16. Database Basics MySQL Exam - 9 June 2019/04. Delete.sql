USE `16_ruk_database`;
--
DELETE e
FROM `employees` AS e
         LEFT JOIN `employees_clients` AS ec
                   ON ec.`employee_id` = e.`id`
WHERE ec.`client_id` IS NULL;
