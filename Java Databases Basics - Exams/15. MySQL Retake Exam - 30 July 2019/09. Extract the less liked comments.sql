USE `15_colonial_blog_db`;
--
SELECT CONCAT(LEFT(c.`comment`, 20), '...') AS 'summary'
FROM `comments` AS c
         LEFT JOIN `likes` AS l
                   ON c.`id` = l.`comment_id`
WHERE l.`comment_id` IS NULL
ORDER BY c.`id` DESC;