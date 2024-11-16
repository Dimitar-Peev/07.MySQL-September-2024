USE `08_online_store`;
--
DROP PROCEDURE IF EXISTS udp_reduce_price;

DELIMITER ~
--
CREATE PROCEDURE udp_reduce_price(p_category_name VARCHAR(50))
BEGIN
    UPDATE `products` AS p
        INNER JOIN `categories` AS c
        ON c.`id` = p.`category_id`
        INNER JOIN `reviews` AS r
        ON p.`review_id` = r.`id`
    SET p.`price` = p.`price` * 0.7
    WHERE r.`rating` < 4
      AND c.`name` = p_category_name;
END
--
~
CALL udp_reduce_price('Phones and tablets');

SELECT *
FROM `products`
WHERE `category_id` = 1;