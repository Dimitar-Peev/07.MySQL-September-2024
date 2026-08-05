USE `foods_friends`;
--
SELECT DISTINCT r.`id`,
                r.`name`
FROM `restaurants` AS r
         INNER JOIN `orders` AS o
                    ON r.`id` = o.`restaurant_id`
         INNER JOIN `customers` AS c
                    ON o.`customer_id` = c.`id`
         INNER JOIN `orders_offerings` AS oo
                    ON o.`id` = oo.`order_id`
         INNER JOIN `offerings` AS off
                    ON oo.`offering_id` = off.`id`
WHERE c.`regular` = TRUE
  AND off.`vegan` = TRUE
  AND o.`priority` = 'high'
ORDER BY r.`id`;