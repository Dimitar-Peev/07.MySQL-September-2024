USE `foods_friends`;
--
SELECT `name`  AS 'offering_name',
       CASE
           WHEN `price` <= 10 THEN 'cheap'
           WHEN `price` > 10 AND `price` <= 25 THEN 'affordable'
           WHEN `price` > 25 THEN 'expensive'
           END AS 'price_category'
FROM `offerings`
ORDER BY `price` DESC, `name`;