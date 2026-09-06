USE `18_buhtig`;
--
SELECT r.`id`,
       r.`name`,
       COUNT(DISTINCT c.`contributor_id`) AS 'users'
FROM `repositories` AS r
         LEFT JOIN `commits` AS c
                   ON r.`id` = c.`repository_id`
GROUP BY r.`id`
ORDER BY `users` DESC, r.`id`;