USE `summer_olympics`;
--
DROP FUNCTION IF EXISTS udf_total_medals_count_by_country;

DELIMITER ~
--
CREATE FUNCTION udf_total_medals_count_by_country(f_name VARCHAR(40))
    RETURNS INTEGER
    NOT DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    DECLARE total_medals INT;

    SET total_medals := (SELECT COUNT(dam.medal_id)
                         FROM `medals` AS m
                                  INNER JOIN `disciplines_athletes_medals` AS dam
                                             ON m.`id` = dam.`medal_id`
                                  INNER JOIN `athletes` AS a
                                             ON dam.`athlete_id` = a.`id`
                                  INNER JOIN `countries` AS c
                                             ON a.`country_id` = c.`id`
                         WHERE c.`name` = f_name);

    RETURN total_medals;
END
--
~
SELECT c.name, udf_total_medals_count_by_country('Bahamas') as count_of_medals
FROM countries c
WHERE c.name = 'Bahamas';