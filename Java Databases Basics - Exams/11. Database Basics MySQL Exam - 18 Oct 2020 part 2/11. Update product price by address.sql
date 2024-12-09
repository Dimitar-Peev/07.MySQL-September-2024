USE `11_softuni_stores_system`;

DROP PROCEDURE IF EXISTS udp_update_product_price;

DELIMITER ~
--
CREATE PROCEDURE udp_update_product_price(p_address_name VARCHAR(50))
BEGIN
    UPDATE `products` AS p
        INNER JOIN `products_stores` AS ps
        ON p.`id` = ps.`product_id`
        INNER JOIN `stores` AS s
        ON s.`id` = ps.`store_id`
        INNER JOIN `addresses` AS a
        ON a.`id` = s.`address_id`
    SET p.`price` = IF(p_address_name LIKE '0%',
                       p.`price` + 100,
                       p.`price` + 200)
    WHERE a.`name` = p_address_name;
END
--
~
CALL udp_update_product_price('07 Armistice Parkway');
SELECT name, price
FROM products
WHERE id = 15;

CALL udp_update_product_price('1 Cody Pass');
SELECT name, price
FROM products
WHERE id = 17;

