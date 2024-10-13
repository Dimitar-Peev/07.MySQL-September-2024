USE `06_restaurant_db`;

SELECT COUNT(*) AS 'count'
FROM `products`;

SELECT *
FROM `waiters`
WHERE `id` > 6;
--
INSERT INTO `products` (`name`, `type`, `price`)
    (SELECT CONCAT(`last_name`, ' specialty'),
            'Cocktail',
            CEIL(0.01 * `salary`)
     FROM `waiters`
     WHERE `id` > 6);