USE `summer_olympics`;
--
SELECT a.`id`,
       a.`first_name`,
       a.`last_name`,
       COUNT(d.`medal_id`) AS 'medals_count',
       s.`name`            AS 'sport'
FROM `athletes` AS a
         LEFT JOIN `disciplines_athletes_medals` AS d
                   ON a.`id` = d.`athlete_id`
         LEFT JOIN `medals` AS m
                   ON m.`id` = d.`athlete_id`
         LEFT JOIN `disciplines` AS di
                   ON d.`discipline_id` = di.`id`
         LEFT JOIN `sports` AS s
                   ON di.`sport_id` = s.`id`
GROUP BY a.`id`, a.`first_name`, a.`last_name`, s.`name`
ORDER BY medals_count DESC, a.`first_name`
LIMIT 10;