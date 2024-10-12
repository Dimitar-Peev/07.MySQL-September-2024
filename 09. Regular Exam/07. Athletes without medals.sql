USE `summer_olympics`;
--
SELECT a.`id`,
       a.`first_name`,
       a.`last_name`
FROM athletes AS a
         LEFT JOIN `disciplines_athletes_medals` AS d
                   ON a.`id` = d.`athlete_id`
WHERE d.`athlete_id` IS NULL
ORDER BY a.`id`;