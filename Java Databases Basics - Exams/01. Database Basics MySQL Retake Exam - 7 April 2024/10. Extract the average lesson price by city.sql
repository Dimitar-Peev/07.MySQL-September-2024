USE `01_go_roadie`;
--
DROP FUNCTION IF EXISTS udf_average_lesson_price_by_city;

DELIMITER ~
--
CREATE FUNCTION udf_average_lesson_price_by_city(f_name VARCHAR(40))
    RETURNS DECIMAL(10, 2)
    DETERMINISTIC
BEGIN
    DECLARE avg_price DECIMAL(10, 2);

    SET avg_price := (SELECT AVG(ds.`average_lesson_price`)
                      FROM `cities` AS c
                               JOIN `driving_schools` ds
                                    ON ds.`city_id` = c.`id`
                      WHERE c.`name` = f_name);

    RETURN avg_price;
END
--
~
SELECT c.name, udf_average_lesson_price_by_city('London') AS average_lesson_price
FROM cities c
WHERE c.name = 'London'

