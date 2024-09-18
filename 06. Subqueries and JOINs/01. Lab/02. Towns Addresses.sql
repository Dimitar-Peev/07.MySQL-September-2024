USE `soft_uni`;
--
SELECT t.`town_id`, t.`name`, a.`address_text`
FROM `addresses` AS a
         INNER JOIN `towns` AS t
              ON t.`town_id` = a.`town_id`
WHERE t.`name` IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY t.`town_id`, a.`address_id`;