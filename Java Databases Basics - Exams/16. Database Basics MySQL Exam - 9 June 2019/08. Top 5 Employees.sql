USE `16_ruk_database`;
--
SELECT CONCAT_WS(' ', `first_name`, `last_name`) AS 'name',
       e.`started_on`,
       COUNT(ec.`client_id`)                     AS 'count_of_clients'
FROM `employees_clients` AS ec
         LEFT JOIN `employees` AS e
                   ON ec.`employee_id` = e.`id`
GROUP BY ec.`employee_id`
ORDER BY `count_of_clients` DESC, ec.`employee_id`
LIMIT 5;