USE `10_stc`;
--
SELECT c.`full_name`,
       COUNT(co.`client_id`) AS 'count_of_cars',
       SUM(co.`bill`)        AS 'total_sum'
FROM `clients` AS c
         INNER JOIN `courses` AS co
                    ON co.`client_id` = c.`id`
WHERE SUBSTRING(`full_name`, 2, 1) = 'a'
GROUP BY `full_name`
HAVING `count_of_cars` > 1
ORDER BY `full_name`;