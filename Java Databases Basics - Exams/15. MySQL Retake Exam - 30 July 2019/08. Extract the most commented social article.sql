USE `15_colonial_blog_db`;
--
SELECT a.`title`,
       COUNT(com.`id`) AS 'comments'
FROM `articles` AS a
         INNER JOIN `categories` AS c
                    ON c.`id` = a.`category_id`
         INNER JOIN `comments` AS com
                    ON com.`article_id` = a.`id`
WHERE c.`category` = 'Social'
GROUP BY a.`id`
ORDER BY `comments` DESC
LIMIT 1;