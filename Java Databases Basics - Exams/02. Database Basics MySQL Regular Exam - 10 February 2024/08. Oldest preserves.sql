USE `02_preserves_db`;
--
SELECT p.`name`                 AS 'name',
       c.`country_code`,
       YEAR(p.`established_on`) AS 'founded_in'
FROM `preserves` AS p
         INNER JOIN `countries_preserves` AS cp
                    ON p.`id` = cp.`preserve_id`
         INNER JOIN `countries` AS c
                    ON cp.`country_id` = c.`id`
WHERE MONTH(p.`established_on`) = 5
ORDER BY p.`established_on`
LIMIT 5;