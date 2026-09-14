USE `19_report_service`;
--
SELECT d.`name` AS 'department_name',
       IF(SUM(r.`close_date` IS NOT NULL) = 0,
          'no info',
          FLOOR(AVG(DATEDIFF(r.`close_date`, r.`open_date`)))
       )        AS 'average_duration'
FROM `departments` AS d
         INNER JOIN `categories` AS c
                    ON c.`department_id` = d.`id`
         INNER JOIN `reports` AS r
                    ON r.`category_id` = c.`id`
GROUP BY d.`id`, `department_name`
ORDER BY `department_name`;