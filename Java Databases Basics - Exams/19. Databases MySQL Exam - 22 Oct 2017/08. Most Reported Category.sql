USE `19_report_service`;
--
SELECT c.`name`      AS 'category_name',
       COUNT(r.`id`) AS 'reports_number'
FROM `categories` AS c
         INNER JOIN `reports` AS r
                    ON r.`category_id` = c.`id`
GROUP BY `category_name`
ORDER BY `reports_number`, `category_name`;