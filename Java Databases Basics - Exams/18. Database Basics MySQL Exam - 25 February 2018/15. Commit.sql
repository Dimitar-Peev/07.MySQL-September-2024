USE `18_buhtig`;
--
DROP PROCEDURE IF EXISTS udp_commit;

DELIMITER ~
--
CREATE PROCEDURE udp_commit(IN p_username VARCHAR(30),
                            IN p_password VARCHAR(30),
                            IN p_message VARCHAR(255),
                            IN p_issue_id INT)
BEGIN
    IF ((SELECT COUNT(u.`id`)
         FROM `users` AS u
         WHERE u.`username` = p_username) = 0)
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No such user!';

    ELSEIF ((SELECT COUNT(u.`id`)
             FROM `users` AS u
             WHERE u.`username` = p_username
               AND u.`password` = p_password) = 0)
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Password is incorrect!';

    ELSEIF ((SELECT COUNT(i.`id`)
             FROM `issues` AS i
             WHERE i.`id` = p_issue_id) = 0)
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The issue does not exist!';

    ELSE
        INSERT INTO `commits`(`message`, `issue_id`, `repository_id`, `contributor_id`)
        VALUES (p_message,
                p_issue_id,
                (SELECT i.`repository_id`
                 FROM `issues` AS i
                 WHERE i.`id` = p_issue_id
                 LIMIT 1),
                (SELECT u.`id`
                 FROM `users` AS u
                 WHERE u.`username` = p_username
                 LIMIT 1));

        UPDATE `issues`
        SET `issue_status` = 'closed'
        WHERE `id` = p_issue_id;

    END IF;
END
--
~

CALL udp_commit('WhoDenoteBel', 'ajmISQi*', 'Fixed issue: Invalid welcoming in READ.html', 2);

SELECT *
FROM `commits`
WHERE `contributor_id` = (SELECT `id`
                          FROM `users`
                          WHERE `username` = 'WhoDenoteBel')
  AND `issue_id` = 2
ORDER BY `id` DESC
LIMIT 1;