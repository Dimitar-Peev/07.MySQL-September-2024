USE `04_airlines_db`;

DROP FUNCTION IF EXISTS udf_count_flights_from_country;

DELIMITER ~

--
CREATE FUNCTION udf_count_flights_from_country(f_country VARCHAR(50))
    RETURNS INTEGER
    DETERMINISTIC
BEGIN
    DECLARE flights_count INT;
    SET flights_count := (SELECT COUNT(*)
                          FROM `flights` AS f
                                   INNER JOIN `countries` AS c
                                              ON c.`id` = f.`departure_country`
                          WHERE `name` = f_country);
    RETURN flights_count;
END
--
~
SELECT udf_count_flights_from_country('Brazil') AS 'flights_count';

SELECT udf_count_flights_from_country('Philippines') AS 'flights_count';