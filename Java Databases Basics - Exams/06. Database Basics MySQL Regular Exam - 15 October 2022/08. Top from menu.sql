USE `06_restaurant_db`;
--
SELECT `id`, `name`, COUNT(op.`order_id`) AS 'count'
FROM `products` AS p
         INNER JOIN `orders_products` AS op
                    ON op.`product_id` = p.`id`
GROUP BY p.`name`
HAVING count >= 5
ORDER BY count DESC, p.`name`;