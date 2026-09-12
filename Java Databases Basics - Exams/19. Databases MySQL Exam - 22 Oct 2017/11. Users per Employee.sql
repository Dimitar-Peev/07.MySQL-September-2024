USE `19_report_service`;
--
SELECT CONCAT(e.`first_name`, ' ', e.`last_name`) AS 'name',
       COUNT(r.`user_id`)                         AS 'users_count'
FROM `employees` AS e
         LEFT JOIN `reports` AS r
                   ON e.`id` = r.`employee_id`
GROUP BY `name`
ORDER BY `users_count` DESC, `name`;