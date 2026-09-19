USE `20_instagraph_db`;
--
DELETE
FROM `users`
WHERE `id` NOT IN (SELECT `user_id` FROM `users_followers`)
  AND (SELECT COUNT(*)
       FROM `users_followers`
       WHERE `follower_id` = `id`) = 0;
