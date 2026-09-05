USE `18_buhtig`;
--
SELECT f.`id`,
       f.`name`               AS `Name`,
       CONCAT(f.`size`, 'KB') AS `size`
FROM `files` AS f
         LEFT JOIN `files` AS f2
                   ON f.`id` = f2.`parent_id`
WHERE f2.`parent_id` IS NULL
ORDER BY f.`id`;