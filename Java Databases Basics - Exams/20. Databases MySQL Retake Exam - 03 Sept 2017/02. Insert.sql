USE `20_instagraph_db`;
--
SELECT COUNT(*) AS 'comments_count'
FROM `comments`; -- 50

INSERT INTO `comments` (`content`, `user_id`, `post_id`)
    (SELECT CONCAT('Omg!', (SELECT `username` FROM `users` WHERE `id` = `user_id`), '!This is so cool!') AS 'content',
            CEIL((`id` * 3) / 2)                                                                         AS 'user_id',
            `id`                                                                                         AS 'post_id'
     FROM `posts`
     WHERE `id` BETWEEN 1 AND 10);

SELECT COUNT(*) AS 'comments_count'
FROM `comments`; -- 60