USE `19_report_service`;
--
SELECT DISTINCT (c.`name`) AS 'category_name'
FROM `reports` AS r
         INNER JOIN `users` AS u
                    ON r.`user_id` = u.`id`
         INNER JOIN `categories` AS c
                    ON r.`category_id` = c.`id`
WHERE DAY(r.`open_date`) = DAY(u.`birthdate`)
  AND MONTH(r.`open_date`) = MONTH(u.`birthdate`)
ORDER BY `category_name`;