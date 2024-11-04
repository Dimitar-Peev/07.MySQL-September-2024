USE `03_real_estate_db`;
--
DROP FUNCTION IF EXISTS udf_offers_from_city_name;

DELIMITER ~
--
CREATE FUNCTION udf_offers_from_city_name(f_cityName VARCHAR(50))
    RETURNS INTEGER
    DETERMINISTIC
BEGIN
    DECLARE offers_count INT;
    SET offers_count := (SELECT COUNT(*)
                         FROM `property_offers` AS po
                                  INNER JOIN `properties` AS p
                                             ON po.`property_id` = p.`id`
                                  INNER JOIN `cities` AS c
                                             ON c.`id` = p.`city_id`
                         WHERE f_cityName = c.`name`);
    RETURN offers_count;
END
--
~
SELECT udf_offers_from_city_name('Vienna') AS 'offers_count';

SELECT udf_offers_from_city_name('Amsterdam') AS 'offers_count';