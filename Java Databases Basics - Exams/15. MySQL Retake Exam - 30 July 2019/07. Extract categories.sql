USE `15_colonial_blog_db`;
--
SELECT c.`category`,
       COUNT(DISTINCT a.`id`) AS 'articles',
       COUNT(l.`id`)          AS 'likes'
FROM `categories` AS c
         LEFT JOIN `articles` AS a
                   ON c.`id` = a.`category_id`
         LEFT JOIN `likes` AS l
                   ON a.`id` = l.`article_id`
GROUP BY c.`category`, c.`id`
ORDER BY `likes` DESC, `articles` DESC, c.`id`;
