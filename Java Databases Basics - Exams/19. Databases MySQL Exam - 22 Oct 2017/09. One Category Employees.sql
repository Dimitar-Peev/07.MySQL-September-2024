USE `19_report_service`;
--
SELECT c.`name`      AS 'category_name',
       COUNT(e.`id`) AS 'employees_number'
FROM `categories` AS c
         INNER JOIN `employees` AS e
                    USING (`department_id`)
GROUP BY `category_name`
ORDER BY `category_name`;
