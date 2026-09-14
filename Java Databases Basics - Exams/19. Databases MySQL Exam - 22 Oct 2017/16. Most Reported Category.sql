USE `19_report_service`;
--
SELECT d.`name`                                                AS 'department_name',
       c.`name`                                                AS 'category_name',
       ROUND(COUNT(r.id) * 100 / dept_totals.total_reports, 0) AS 'percentage'
FROM `departments` AS d
         INNER JOIN `categories` AS c
                    ON c.`department_id` = d.`id`
         INNER JOIN `reports` AS r
                    ON r.`category_id` = c.`id`
         INNER JOIN (SELECT c2.`department_id`, COUNT(*) AS 'total_reports'
                     FROM `reports` AS r2
                              INNER JOIN `categories` AS c2
                                  ON r2.`category_id` = c2.`id`
                     GROUP BY c2.`department_id`) AS `dept_totals`
             ON dept_totals.`department_id` = d.`id`
GROUP BY d.id, d.name, c.id, c.name, dept_totals.total_reports
ORDER BY `department_name`, `category_name`, `percentage`;
