USE `08_online_store`;
--
SELECT COUNT(p.`id`)              AS 'items_count',
       c.`name`,
       SUM(p.`quantity_in_stock`) AS 'total_quantity'
FROM `products` AS p
         INNER JOIN `categories` AS c
                    ON p.`category_id` = c.`id`
GROUP BY p.`category_id`
ORDER BY `items_count` DESC, `total_quantity`
LIMIT 5;