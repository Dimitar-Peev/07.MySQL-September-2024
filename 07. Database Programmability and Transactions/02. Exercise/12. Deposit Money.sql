USE `soft_uni`;
--
DROP PROCEDURE IF EXISTS usp_deposit_money;

DELIMITER ~
--
CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(19, 4))
BEGIN
    START TRANSACTION;
    IF (money_amount <= 0) THEN
        ROLLBACK;
    ELSE
        UPDATE `accounts` AS ac
        SET ac.`balance` = ac.`balance` + money_amount
        WHERE ac.`id` = account_id;
        COMMIT;
    END IF;
END
--
~
CALL usp_deposit_money(1, 10);

SELECT `id` AS 'account_id', `account_holder_id`, `balance`
FROM `accounts`
WHERE `id` = 1;