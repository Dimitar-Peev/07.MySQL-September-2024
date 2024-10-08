USE geography;
--
SELECT COUNT(c.`country_code`) AS 'country_count'
FROM `countries` AS c
         LEFT JOIN `mountains_countries` AS mc
                   USING (`country_code`)
         LEFT JOIN `mountains` AS m
                   ON mc.`mountain_id` = m.`id`
WHERE m.`id` IS NULL;