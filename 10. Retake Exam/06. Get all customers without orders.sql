USE `foods_friends`;
--
SELECT c.`id`,
       c.`first_name`,
       c.`last_name`
FROM `customers` AS c
         LEFT JOIN `orders` AS o
                   ON c.`id` = o.`customer_id`
WHERE `o`.`id` IS NULL
ORDER BY `c`.`id`;