USE `09_sgd`;

-- Check budget before
SELECT `name`, `description`, `budget`, `release_date`
FROM `games` AS g
         LEFT JOIN `games_categories` AS c
                   ON g.`id` = c.`game_id`

WHERE c.`category_id` IS NULL
  AND g.`release_date` IS NOT NULL
  AND g.`rating` > 8;

DROP PROCEDURE IF EXISTS udp_update_budget;

DELIMITER ~
--
CREATE PROCEDURE udp_update_budget(p_min_game_rating FLOAT)
BEGIN
    UPDATE `games` AS g
        LEFT JOIN `games_categories` AS c
        ON g.`id` = c.`game_id`
    SET g.`budget`       = g.`budget` + 100000,
        g.`release_date` = ADDDATE(g.`release_date`, INTERVAL 1 YEAR)
    WHERE c.`category_id` IS NULL
      AND g.`release_date` IS NOT NULL
      AND g.`rating` > p_min_game_rating;
END
--
~
CALL udp_update_budget(8);

-- Check budget after
SELECT `name`, `description`, `budget`, `release_date`
FROM `games` AS g
         LEFT JOIN `games_categories` AS c
                   ON g.`id` = c.`game_id`

WHERE c.`category_id` IS NULL
  AND g.`release_date` IS NOT NULL
  AND g.`rating` > 8;