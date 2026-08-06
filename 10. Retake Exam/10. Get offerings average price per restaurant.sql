USE `foods_friends`;
--
DROP FUNCTION IF EXISTS udf_get_offerings_average_price_per_restaurant;

DELIMITER ~
--
CREATE FUNCTION udf_get_offerings_average_price_per_restaurant(`restaurant_name` VARCHAR(40))
    RETURNS DECIMAL(19, 2)
    DETERMINISTIC
BEGIN
    DECLARE `avg_price` DECIMAL(19, 2);

    SELECT ROUND(AVG(o.`price`), 2)
    INTO `avg_price`
    FROM `offerings` AS o
             INNER JOIN `restaurants` AS r
                        ON o.`restaurant_id` = r.`id`
    WHERE r.`name` = `restaurant_name`;

    RETURN `avg_price`;
END
--
~
SELECT r.`name`                                                       AS 'restaurant_name',
       udf_get_offerings_average_price_per_restaurant('Burger Haven') AS 'average_offering_price'
FROM `restaurants` AS r
WHERE r.`name` = 'Burger Haven'
