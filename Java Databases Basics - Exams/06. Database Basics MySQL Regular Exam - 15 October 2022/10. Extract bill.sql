USE `06_restaurant_db`;
--
DROP FUNCTION IF EXISTS udf_client_bill;

DELIMITER ~
--
CREATE FUNCTION udf_client_bill(f_full_name VARCHAR(50))
    RETURNS DECIMAL(19, 2)
    DETERMINISTIC
BEGIN
    DECLARE total_price DECIMAL(19, 2);
    SET total_price := (SELECT SUM(p.`price`)
                        FROM `clients` AS c
                                 INNER JOIN `orders_clients` AS oc
                                            ON c.id = oc.client_id
                                 INNER JOIN `orders` AS o
                                            ON oc.order_id = o.id
                                 INNER JOIN `orders_products` AS op
                                            ON o.id = op.order_id
                                 INNER JOIN `products` AS p
                                            ON op.product_id = p.id
                        WHERE CONCAT(c.`first_name`, ' ', c.`last_name`) = f_full_name);
    RETURN total_price;
END
--
~

SELECT c.`first_name`,
       c.`last_name`,
       udf_client_bill('Silvio Blyth') as 'bill'
FROM `clients` AS c
WHERE c.`first_name` = 'Silvio'
  AND c.`last_name` = 'Blyth';
