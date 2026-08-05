USE `foods_friends`;
--
SELECT o.`id`,
       o.`name`
FROM `offerings` AS o
         INNER JOIN `orders_offerings` AS oo
                    ON o.`id` = oo.`offering_id`
         INNER JOIN `orders` AS ord
                    ON oo.`order_id` = ord.`id`
         INNER JOIN `customers` AS c
                    ON ord.`customer_id` = c.`id`
WHERE c.`first_name` = 'Sofia'
  AND c.`last_name` = 'Sanchez'
  AND o.`vegan` = FALSE
GROUP BY o.`id`, o.`name`
ORDER BY o.`id`;