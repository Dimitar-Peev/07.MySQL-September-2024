USE `13_instd`;
--
SELECT p.`id`,
       p.`date`      AS 'date_and_time',
       p.`description`,
       COUNT(c.`id`) AS 'comments_count'
FROM `photos` AS p
         INNER JOIN `comments` AS c
                    ON p.`id` = c.`photo_id`
GROUP BY p.`id`
ORDER BY comments_count DESC, p.`id`
LIMIT 5;