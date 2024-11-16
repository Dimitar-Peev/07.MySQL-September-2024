USE `08_online_store`;

SELECT c.`first_name`, c.`last_name`, COUNT(*)
FROM `customers` AS c
         INNER JOIN `orders` AS o
                   ON c.`id` = o.`customer_id`
         INNER JOIN `orders_products` AS op
                   ON o.`id` = op.`order_id`
WHERE c.`first_name` = 'Shirley'
GROUP BY c.`id`;

DROP FUNCTION IF EXISTS udf_customer_products_count;

DELIMITER ~
--
CREATE FUNCTION udf_customer_products_count(f_name VARCHAR(30))
    RETURNS INTEGER
    NOT DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    DECLARE total_number INT;
    SET total_number := (SELECT COUNT(*)
                         FROM `customers` AS c
                                  INNER JOIN `orders` AS o
                                             ON c.`id` = o.`customer_id`
                                  INNER JOIN `orders_products` AS op
                                             ON o.`id` = op.`order_id`
                         WHERE c.`first_name` = f_name
                         GROUP BY c.`id`);
    RETURN total_number;
END
--
~
SELECT c.`first_name`, c.`last_name`, udf_customer_products_count('Shirley') AS `total_products`
FROM `customers` AS c
WHERE c.`first_name` = 'Shirley';
