USE `01_go_roadie`;

SELECT ds.`name`,
       ds.`average_lesson_price`
FROM `driving_schools` AS ds
         INNER JOIN `cars` AS c
                    ON ds.`car_id` = c.`id`
WHERE c.`brand` = 'Mercedes-Benz'
ORDER BY ds.`average_lesson_price` DESC;

DROP PROCEDURE IF EXISTS udp_find_school_by_car;

DELIMITER ~
--
CREATE PROCEDURE udp_find_school_by_car(p_brand VARCHAR(20))
BEGIN
    SELECT ds.`name`,
           ds.`average_lesson_price`
    FROM `driving_schools` AS ds
             INNER JOIN `cars` AS c
                        ON ds.`car_id` = c.`id`
    WHERE c.`brand` = p_brand
    ORDER BY ds.`average_lesson_price` DESC;
END
--
~
CALL udp_find_school_by_car('Mercedes-Benz');
