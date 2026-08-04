USE `foods_friends`;
--
DELETE
FROM `orders_offerings`
WHERE `restaurant_id` IN (SELECT `id`
                          FROM `restaurants`
                          WHERE `name` LIKE '%fast%'
                             OR `type` LIKE '%fast%');

DELETE
FROM `offerings`
WHERE `restaurant_id` IN (SELECT `id`
                          FROM `restaurants`
                          WHERE `name` LIKE '%fast%'
                             OR `type` LIKE '%fast%');

DELETE
FROM `orders`
WHERE `restaurant_id` IN (SELECT `id`
                          FROM `restaurants`
                          WHERE `name` LIKE '%fast%'
                             OR `type` LIKE '%fast%');
--
DELETE
FROM `restaurants`
WHERE `name` LIKE '%fast%'
   OR `type` LIKE '%fast%';