USE `20_instagraph_db`;
--
UPDATE `users`
SET `profile_picture_id` = CASE
                               WHEN (SELECT COUNT(*)
                                     FROM `users_followers`
                                     WHERE `user_id` = `id`) = 0
                                   THEN `id`
                               ELSE (SELECT COUNT(*)
                                     FROM `users_followers`
                                     WHERE `user_id` = `id`)
    END
WHERE `profile_picture_id` IS NULL;