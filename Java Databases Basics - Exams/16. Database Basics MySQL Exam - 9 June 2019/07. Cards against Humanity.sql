USE `16_ruk_database`;
--
SELECT c.`id`,
       CONCAT(c.`card_number`, ' : ', cl.`full_name`) AS 'card_token'
FROM `cards` AS c
         INNER JOIN `bank_accounts` AS ba
                    ON c.`bank_account_id` = ba.`id`
         INNER JOIN `clients` AS cl
                    ON ba.`client_id` = cl.`id`
ORDER BY c.`id` DESC;