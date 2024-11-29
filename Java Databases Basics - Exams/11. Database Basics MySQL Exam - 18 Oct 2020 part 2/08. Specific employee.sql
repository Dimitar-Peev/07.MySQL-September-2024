USE `11_softuni_stores_system`;
--
SELECT CONCAT(e.`first_name`, ' ', e.`last_name`) AS `Full_name`,
       s.`name`                                   AS `Store_name`,
       a.`name`                                   AS `address`,
       e.`salary`
FROM `employees` AS e
         INNER JOIN `stores` AS s
                    ON s.`id` = e.`store_id`
         INNER JOIN `addresses` AS a
                    ON a.`id` = s.`address_id`
WHERE e.`salary` < 4000
  AND a.`name` REGEXP '[5]'
  AND CHAR_LENGTH(s.`name`) > 8
  AND RIGHT(e.`last_name`, 1) = 'n';
