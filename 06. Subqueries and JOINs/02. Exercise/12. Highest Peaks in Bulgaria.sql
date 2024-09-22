USE `geography`;
--
SELECT mc.`country_code`, m.`mountain_range`, p.`peak_name`, p.`elevation`
FROM `peaks` AS p
         INNER JOIN `mountains` AS m
                    ON p.`mountain_id` = m.`id`
         INNER JOIN `mountains_countries` AS mc
                    ON m.`id` = mc.`mountain_id`
WHERE mc.`country_code` = 'BG'
  AND p.`elevation` > 2835
ORDER BY p.`elevation` DESC;