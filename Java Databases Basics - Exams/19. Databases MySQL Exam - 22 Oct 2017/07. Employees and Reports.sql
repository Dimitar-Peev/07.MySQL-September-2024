USE `19_report_service`;
--
SELECT e.`first_name`,
       e.`last_name`,
       r.`description`,
       DATE(r.`open_date`) AS 'open_date'
FROM `reports` AS r
         INNER JOIN `employees` AS e
                    ON r.`employee_id` = e.`id`
ORDER BY r.`employee_id`, `open_date`, r.`id`;