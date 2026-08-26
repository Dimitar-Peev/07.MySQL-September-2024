USE `16_ruk_database`;
--
DROP PROCEDURE IF EXISTS udp_clientinfo;

DELIMITER ~
--
CREATE PROCEDURE udp_clientinfo(target_name VARCHAR(45))
BEGIN
    SELECT c.`full_name`,
           c.`age`,
           ba.`account_number`,
           CONCAT('$', ba.`balance`) AS 'balance'
    FROM `clients` AS c
             INNER JOIN `bank_accounts` AS ba
                        ON ba.`client_id` = c.`id`
    WHERE c.`full_name` = target_name;
END
--
~
CALL udp_clientinfo('Hunter Wesgate');