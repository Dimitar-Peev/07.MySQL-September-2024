USE `18_buhtig`;
--
-- Check if there are any repositories without issues
SELECT r.`id`
FROM `repositories` AS r
         LEFT JOIN `issues` AS i
                   ON i.`repository_id` = r.`id`
WHERE i.`repository_id` IS NULL; -- id = 36
--
DELETE
FROM `repositories` AS r
WHERE (SELECT COUNT(i.`id`)
       FROM `issues` AS i
       WHERE i.`repository_id` = r.`id`) = 0;