USE `13_instd`;

DROP PROCEDURE IF EXISTS udp_modify_user;

DELIMITER ~
--
CREATE PROCEDURE udp_modify_user(p_address VARCHAR(30), p_town VARCHAR(30))
BEGIN
    UPDATE `users` AS u
        INNER JOIN `addresses` AS a
        ON u.`id` = a.`user_id`
    SET `age` = `age` + 10
    WHERE a.`address` = p_address
      AND a.`town` = p_town;
END
--
~
CALL udp_modify_user('97 Valley Edge Parkway', 'Divinópolis');

SELECT u.`username`, u.`email`, u.`gender`, u.`age`, u.`job_title`
FROM `users` AS u
WHERE u.`username` = 'eblagden21';
