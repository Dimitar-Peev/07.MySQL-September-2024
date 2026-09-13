USE `19_report_service`;
--
SELECT DISTINCT(u.`username`)
FROM `reports` AS r
         INNER JOIN `users` AS u
                    ON r.`user_id` = u.`id`
         INNER JOIN `categories` AS c
                    ON r.`category_id` = c.`id`
WHERE c.`id` = LEFT(u.`username`, 1)
   OR c.`id` = RIGHT(u.`username`, 1)
ORDER BY u.`username`;
