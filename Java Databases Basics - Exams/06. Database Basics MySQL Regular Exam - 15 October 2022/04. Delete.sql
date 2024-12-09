USE `06_restaurant_db`;
--
DELETE
FROM `waiters`
WHERE `id` NOT IN (SELECT `waiter_id` FROM `orders`);