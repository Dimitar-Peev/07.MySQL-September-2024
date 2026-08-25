USE `16_ruk_database`;
--
DROP FUNCTION IF EXISTS udf_client_cards_count;

DELIMITER ~
--
CREATE FUNCTION udf_client_cards_count(target_name VARCHAR(30))
    RETURNS INTEGER
    DETERMINISTIC
BEGIN
    DECLARE number_of_cards INT;
    SET number_of_cards := (SELECT COUNT(c.`id`) AS 'cards'
                            FROM `cards` AS c
                                     LEFT JOIN `bank_accounts` AS ba
                                               ON ba.`id` = c.`bank_account_id`
                                     LEFT JOIN `clients` AS cl
                                               ON cl.`id` = ba.`client_id`
                            WHERE cl.`full_name` = target_name);
    RETURN number_of_cards;
END
--
~
SELECT `full_name`,
       udf_client_cards_count('Baxy David') AS 'cards'
FROM `clients`
WHERE `full_name` = 'Baxy David';
