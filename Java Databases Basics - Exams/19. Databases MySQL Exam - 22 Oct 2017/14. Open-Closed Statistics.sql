USE `19_report_service`;
--
SELECT fn                                AS 'name',
       CONCAT(cnt_closed, '/', cnt_open) AS 'closed_open_reports'
FROM (SELECT CONCAT(e.`first_name`, ' ', e.`last_name`) AS 'fn',
             COUNT(CASE
                       WHEN YEAR(close_date) = 2016 THEN 'closed'
                       WHEN YEAR(open_date) < 2016 AND YEAR(close_date) = 2016 THEN 'closed'
                 END)                                   AS 'cnt_closed',
             COUNT(CASE
                       WHEN YEAR(open_date) = 2016 THEN 'open'
                 END)                                   AS 'cnt_open'
      FROM `employees` AS e
               INNER JOIN `reports` AS r
                          ON e.`id` = r.`employee_id`
      GROUP BY `fn`
      HAVING cnt_open > 0
          OR cnt_closed > 0) AS `select_count`
ORDER BY select_count.fn;
