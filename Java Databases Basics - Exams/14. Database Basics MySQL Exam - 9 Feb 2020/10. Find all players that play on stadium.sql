USE `14_football_scout`;

DROP FUNCTION IF EXISTS udf_stadium_players_count;

DELIMITER ~
--
CREATE FUNCTION udf_stadium_players_count(stadium_name VARCHAR(30))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE number_of_players INT;
    SET number_of_players := (SELECT COUNT(p.`id`)
                              FROM `players` AS p
                                       RIGHT JOIN `teams` AS t
                                                  ON t.`id` = p.`team_id`
                                       RIGHT JOIN `stadiums` AS s
                                                  ON s.`id` = t.`stadium_id`
                              WHERE s.`name` = stadium_name);
    RETURN number_of_players;
END
--
~
SELECT udf_stadium_players_count('Jaxworks') AS `count`;

SELECT udf_stadium_players_count('Linklinks') AS `count`;