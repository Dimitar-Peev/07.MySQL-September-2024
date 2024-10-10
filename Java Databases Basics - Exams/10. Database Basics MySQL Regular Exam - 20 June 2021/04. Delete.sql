USE `10_stc`;
--
DELETE c
FROM `clients` AS c
         LEFT JOIN `courses` AS co
                   ON c.`id` = co.`client_id`
WHERE co.`client_id` IS NULL
  AND CHAR_LENGTH(c.`full_name`) > 3;