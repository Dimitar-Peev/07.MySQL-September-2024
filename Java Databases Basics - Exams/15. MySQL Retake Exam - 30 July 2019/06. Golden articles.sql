USE `15_colonial_blog_db`;
--
SELECT a.`id` AS 'article_id',
       a.`title`
FROM `articles` AS a
         INNER JOIN `users_articles` AS ua
                    ON a.`id` = ua.`article_id`
WHERE ua.`user_id` = ua.`article_id`
ORDER BY a.`id`;