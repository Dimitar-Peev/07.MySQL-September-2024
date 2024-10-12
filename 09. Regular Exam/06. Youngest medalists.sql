USE `summer_olympics`;
--
SELECT CONCAT_WS(' ', a.`first_name`, a.`last_name`) AS 'full_name',
       a.`age`
FROM `athletes` AS a
        INNER JOIN `disciplines_athletes_medals` AS d
                   ON a.`id` = d.`athlete_id`
GROUP BY a.`age`, a.`id`
ORDER BY a.`age`, a.`id`
LIMIT 2;