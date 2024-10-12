USE `summer_olympics`;
--
SELECT c.`id`, c.`name`
FROM `countries` AS c
         LEFT JOIN `athletes` AS a
                   ON c.`id` = a.`country_id`
WHERE a.`country_id` IS NULL
ORDER BY c.`name` DESC
LIMIT 15;