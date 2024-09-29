USE `soft_uni`;
--
DROP PROCEDURE IF EXISTS usp_transfer_money;

DELIMITER ~
--
CREATE PROCEDURE usp_transfer_money(from_account_id int, to_account_id int, amount DECIMAL(19, 4))
BEGIN
    START TRANSACTION;
    IF (from_account_id = to_account_id
        OR amount <= 0
        OR (SELECT `balance` from `accounts` WHERE `id` = from_account_id) < amount
        OR (SELECT COUNT(id) FROM `accounts` WHERE `id` = from_account_id) <> 1
        OR (SELECT COUNT(id) FROM `accounts` WHERE `id` = to_account_id) <> 1)
    THEN
        ROLLBACK;
    ELSE
        UPDATE `accounts`
        SET `balance` = `balance` - amount
        WHERE `id` = from_account_id;
        UPDATE `accounts`
        SET `balance` = `balance` + amount
        WHERE `id` = to_account_id;
        COMMIT;
    END IF;
END
--
~
CALL usp_transfer_money(1, 1, 10);

SELECT `id` AS 'account_id', `account_holder_id`, `balance`
FROM `accounts`
WHERE `id` IN (1, 2);