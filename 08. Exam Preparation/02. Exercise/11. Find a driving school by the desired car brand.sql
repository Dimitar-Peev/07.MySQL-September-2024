USE `ep_go_rodie`;
--
DELIMITER $$

CREATE PROCEDURE udp_find_school_by_car(target_brand VARCHAR(20))
BEGIN
    SELECT ds.name,
           ds.average_lesson_price
    FROM driving_schools ds
             JOIN cars c
                  ON ds.car_id = c.id
    WHERE c.brand = target_brand
    ORDER BY ds.average_lesson_price DESC;
END $$

CALL udp_find_school_by_car('Mercedes-Benz');
