USE `10_stc`;
--
SELECT a.`name`,
       IF(HOUR(co.`start`) BETWEEN 6 AND 20, 'Day', 'Night') AS 'day_time',
       co.`bill`,
       cl.`full_name`,
       c.`make`,
       c.`model`,
       cat.`name`                                            AS 'category_name'
FROM `addresses` AS a
         INNER JOIN `courses` AS co
                    ON co.`from_address_id` = a.`id`
         INNER JOIN `clients` AS cl
                    ON cl.`id` = co.`client_id`
         INNER JOIN `cars` AS c
                    ON c.`id` = co.`car_id`
         INNER JOIN `categories` AS cat
                    ON cat.`id` = c.`category_id`
ORDER BY co.`id`;