USE `19_report_service`;
--
SELECT c.`name`      AS 'category_name',
       COUNT(r.`id`) AS 'reports_number',
       CASE
           WHEN SUM(IF(s.`label` = 'waiting', 1, 0)) > SUM(IF(s.`label` = 'in progress', 1, 0))
               THEN 'waiting'
           WHEN SUM(IF(s.`label` = 'waiting', 1, 0)) < SUM(IF(s.`label` = 'in progress', 1, 0))
               THEN 'in progress'
           ELSE 'equal'
           END       AS 'main_status'
FROM `categories` AS c
         INNER JOIN `reports` AS r
                    ON r.`category_id` = c.`id`
         INNER JOIN `status` AS s
                    ON s.`id` = r.`status_id`
WHERE s.`label` IN ('waiting', 'in progress')
GROUP BY c.`id`, `category_name`
ORDER BY `category_name`;