USE `11_softuni_stores_system`;
--
SELECT REVERSE(s.`name`)                      AS 'reversed_name',
       CONCAT(UPPER(t.`name`), '-', a.`name`) AS 'full_address',
       COUNT(e.`id`)                          AS 'employees_count'
FROM `stores` AS s
         INNER JOIN `addresses` AS a
                    ON a.`id` = s.`address_id`
         INNER JOIN `towns` AS t
                    ON t.`id` = a.`town_id`
         INNER JOIN `employees` AS e
                    ON s.`id` = e.`store_id`
GROUP BY s.`id`
HAVING `employees_count` >= 1
ORDER BY `full_address`;