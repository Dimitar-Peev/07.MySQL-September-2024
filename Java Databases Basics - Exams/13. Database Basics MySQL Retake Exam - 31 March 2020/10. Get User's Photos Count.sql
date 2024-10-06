USE `13_instd`;

DROP FUNCTION IF EXISTS udf_users_photos_count;

DELIMITER ~
--
CREATE FUNCTION udf_users_photos_count(f_username VARCHAR(30))
    RETURNS INTEGER
    DETERMINISTIC
BEGIN
    DECLARE number_of_photos INT;
    SET number_of_photos := (SELECT COUNT(up.`user_id`)
                             FROM `users` AS u
                                      LEFT JOIN `users_photos` AS up
                                                ON u.`id` = up.`user_id`
                             WHERE u.`username` = f_username);
    RETURN number_of_photos;
END
--
~
SELECT udf_users_photos_count('ssantryd') AS 'photos_count';
