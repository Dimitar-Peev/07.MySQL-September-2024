USE `15_colonial_blog_db`;
--
DROP FUNCTION IF EXISTS udf_users_articles_count;

DELIMITER ~
--
CREATE FUNCTION udf_users_articles_count(target_username VARCHAR(30))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE result INT;
    SET result := (SELECT COUNT(ua.`article_id`)
                   FROM `users_articles` AS ua
                            RIGHT JOIN `users` AS u
                                       ON u.`id` = ua.`user_id`
                   WHERE u.`username` = target_username);
    RETURN result;
END
--
~

SELECT u.`username`,
       udf_users_articles_count('UnderSinduxrein') AS 'count'
FROM `articles` AS a
         INNER JOIN `users_articles` AS ua
                    ON a.`id` = ua.`article_id`
         INNER JOIN `users` AS u
                    On ua.`user_id` = u.`id`
WHERE u.`username` = 'UnderSinduxrein'
GROUP BY u.`id`;
