USE `15_colonial_blog_db`;
--
DROP PROCEDURE IF EXISTS udp_like_article;

DELIMITER ~
--
CREATE PROCEDURE udp_like_article(target_username VARCHAR(30), target_title VARCHAR(30))
BEGIN
    START TRANSACTION;
    IF ((SELECT COUNT(*)
         FROM `users` AS u
         WHERE u.`username` = target_username) = 0)
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Non-existent user.';
        ROLLBACK;
    ELSEIF ((SELECT COUNT(*)
             FROM `articles` AS a
             WHERE a.`title` = target_title) = 0)
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Non-existent article.';
        ROLLBACK;
    ELSE
        INSERT INTO `likes`(`article_id`, `comment_id`, `user_id`)
        VALUES ((SELECT a.`id` FROM `articles` AS a WHERE a.`title` = target_title),
                NULL,
                (SELECT u.`id` FROM `users` AS u WHERE u.`username` = target_username));
    END IF;
    COMMIT;
END
--
~
CALL udp_like_article('Pesho123', 'Donnybrook, Victoria');

CALL udp_like_article('BlaAntigadsa', 'Na Pesho statiqta');

CALL udp_like_article('BlaAntigadsa', 'Donnybrook, Victoria');

SELECT a.`title`,
       u.`username`
FROM `articles` AS a
         INNER JOIN `likes` AS l
                    ON a.`id` = l.`article_id`
         INNER JOIN `users` AS u
                    ON l.user_id = u.id;
