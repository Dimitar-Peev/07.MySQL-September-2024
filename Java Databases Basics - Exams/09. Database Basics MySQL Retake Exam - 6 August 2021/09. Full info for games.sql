USE `09_sgd`;
--
SELECT g.`name`,
       (CASE
            WHEN g.`budget` < 50000 THEN 'Normal budget'
            WHEN g.`budget` >= 50000 THEN 'Insufficient budget'
       END) AS 'budget_level',
       t.`name` AS 'team_name',
       a.`name` AS 'address_name'
FROM `games` AS g
         LEFT JOIN `games_categories` AS gc
                   ON gc.`game_id` = g.`id`
         INNER JOIN `teams` AS t
                    ON g.`team_id` = t.`id`
         INNER JOIN `offices` AS o
                    ON t.`office_id` = o.`id`
         INNER JOIN `addresses` AS a
                    ON o.`address_id` = a.`id`
WHERE g.`release_date` IS NULL
  AND gc.`category_id` IS NULL
ORDER BY g.`name`;