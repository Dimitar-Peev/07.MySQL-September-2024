USE `foods_friends`;
--
DROP PROCEDURE IF EXISTS udp_update_prices;

DELIMITER ~
--
CREATE PROCEDURE udp_update_prices(IN `restaurant_type` VARCHAR(40))
BEGIN
    UPDATE `offerings` AS o
        INNER JOIN `restaurants` AS r
        ON o.`restaurant_id` = r.`id`
    SET o.`price` = o.`price` + 5.00
    WHERE r.`type` = `restaurant_type`
      AND r.`non_stop` = TRUE;
END
--
~
-- check price before update
SELECT o.`id`,
       o.`name`  AS 'offering_name',
       o.`price` AS 'price_before'
FROM `offerings` AS o
         INNER JOIN `restaurants` AS r
                    ON o.`restaurant_id` = r.`id`
WHERE r.`type` = 'buffet'
  AND r.`non_stop` = TRUE
ORDER BY o.`id`;

CALL udp_update_prices('buffet');

-- check price after update
SELECT o.`id`,
       o.`name`  AS 'offering_name',
       o.`price` AS 'price_before'
FROM `offerings` AS o
         INNER JOIN `restaurants` AS r
                    ON o.`restaurant_id` = r.`id`
WHERE r.`type` = 'buffet'
  AND r.`non_stop` = TRUE
ORDER BY o.`id`;