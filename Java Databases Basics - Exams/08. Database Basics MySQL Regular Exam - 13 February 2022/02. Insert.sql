USE `08_online_store`;
--
INSERT INTO `reviews` (`content`, `picture_url`, `published_at`, `rating`)
    (SELECT LEFT(`description`, 15),
            REVERSE(`name`),
            DATE('2010-10-10'),
            `price` / 8
     FROM `products`
     WHERE `id` >= 5);

SELECT COUNT(*)
FROM reviews;