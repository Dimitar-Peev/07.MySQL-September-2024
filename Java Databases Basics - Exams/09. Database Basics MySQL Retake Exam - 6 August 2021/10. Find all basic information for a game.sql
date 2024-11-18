USE `09_sgd`;

DROP FUNCTION IF EXISTS udf_game_info_by_name;

DELIMITER ~
--
CREATE FUNCTION udf_game_info_by_name(f_game_name VARCHAR(20))
    RETURNS TEXT
    NOT DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    DECLARE output TEXT;

    SET output := (SELECT CONCAT_WS(' ', 'The', g.`name`, 'is developed by a', t.`name`, 'in an office with an address', a.`name`)
                   FROM `games` AS g
                            INNER JOIN `teams` AS t
                                       ON t.`id` = g.`team_id`
                            INNER JOIN `offices` AS o
                                       ON o.`id` = t.`office_id`
                            INNER JOIN `addresses` AS a
                                       ON a.`id` = o.`address_id`
                   WHERE g.`name` = f_game_name);

    RETURN output;
END
--
~

SELECT udf_game_info_by_name('Bitwolf') AS info;

SELECT udf_game_info_by_name('Fix San') AS info;

SELECT udf_game_info_by_name('Job') AS info;
