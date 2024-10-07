USE `ep_go_rodie`;
--
DELIMITER $$

CREATE FUNCTION udf_average_lesson_price_by_city(target_name VARCHAR(40))
    RETURNS DECIMAL(10, 2)
    DETERMINISTIC
BEGIN
    RETURN (SELECT AVG(average_lesson_price)
            FROM driving_schools ds
                     JOIN cities c
                          ON ds.city_id = c.id
            WHERE c.name = target_name);
END $$

SELECT c.name, udf_average_lesson_price_by_city('London') AS average_lesson_price
FROM cities c
WHERE c.name = 'London';

