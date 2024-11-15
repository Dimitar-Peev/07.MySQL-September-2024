USE `08_online_store`;
--
DELETE
FROM `customers`
WHERE `id` NOT IN (SELECT `customer_id` FROM `orders`);