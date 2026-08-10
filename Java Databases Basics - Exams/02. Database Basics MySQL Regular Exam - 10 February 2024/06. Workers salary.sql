USE `02_preserves_db`;
--
SELECT w.`id`,
       w.`first_name`,
       w.`last_name`,
       p.`name` AS 'preserve_name',
       c.`country_code`
FROM `workers` AS w
         INNER JOIN `preserves` AS p
                    ON p.`id` = w.`preserve_id`
         INNER JOIN `countries_preserves` AS cp
                    ON p.`id` = cp.`preserve_id`
         INNER JOIN `countries` AS c
                    ON c.`id` = cp.`country_id`
WHERE w.`salary` > 5000
  AND w.`age` < 50
ORDER BY c.`country_code`;