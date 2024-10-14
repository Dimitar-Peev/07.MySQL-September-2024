USE `06_restaurant_db`;

DROP PROCEDURE IF EXISTS udp_happy_hour;

DELIMITER ~
--
CREATE PROCEDURE udp_happy_hour(p_type VARCHAR(50))
BEGIN
    UPDATE `products`
    SET `price` = `price` * 0.80
    WHERE `price` >= 10
      AND `type` = p_type;
END
--
~
CALL udp_happy_hour('Cognac');

SELECT *
FROM `products`
WHERE `type` = 'Cognac';