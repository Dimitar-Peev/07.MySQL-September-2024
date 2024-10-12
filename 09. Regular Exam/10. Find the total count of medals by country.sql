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


# DELIMITER ==
# CREATE FUNCTION udf_total_medals_count_by_country(target_name VARCHAR(40))
#     RETURNS INT
#     DETERMINISTIC
# BEGIN
#     DECLARE total_country_medals INT;
#     SET total_country_medals := (SELECT COUNT(dam.medal_id)
#                                  FROM disciplines_athletes_medals AS dam
#                                           JOIN athletes AS a ON a.country_id = dam.athlete_id
#                                           JOIN countries AS c ON c.id = a.country_id
#                                  WHERE c.name = target_name
#                                  GROUP BY c.name);
#     RETURN total_country_medals;
# END;
# ==
#
# SELECT c.name, udf_total_medals_count_by_country('Bahamas') as count_of_medals
# FROM countries c
# WHERE c.name = 'Bahamas';
