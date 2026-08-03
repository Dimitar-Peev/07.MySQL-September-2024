USE `foods_friends`;
--
INSERT INTO `offerings` (`name`, `price`, `vegan`, `restaurant_id`)
SELECT CONCAT(`name`, ' costs:'),
       `price`,
       `vegan`,
       `restaurant_id`
FROM `offerings`
WHERE `name` LIKE 'Grill%';