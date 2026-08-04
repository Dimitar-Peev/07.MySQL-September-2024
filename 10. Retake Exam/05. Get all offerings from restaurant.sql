USE `foods_friends`;
--
SELECT o.`name`,
       o.`price`
FROM `offerings` AS o
         INNER JOIN `restaurants` AS r
                    ON o.`restaurant_id` = r.`id`
WHERE r.`name` = 'Burger Haven'
ORDER BY o.`id`;