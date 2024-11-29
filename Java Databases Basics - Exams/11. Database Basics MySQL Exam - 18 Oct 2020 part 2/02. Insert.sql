USE `11_softuni_stores_system`;
--
INSERT INTO `products_stores`
SELECT p.`id`, 1
FROM `products` AS p
         LEFT JOIN `products_stores` AS ps
                   ON p.`id` = ps.`product_id`
WHERE ps.`store_id` IS NULL;