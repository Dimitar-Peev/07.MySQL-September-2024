USE `soft_uni`;
--
CREATE TABLE `logs`
(
    `log_id`     INT AUTO_INCREMENT,
    `account_id` INT            NOT NULL,
    `old_sum`    DECIMAL(19, 4) NOT NULL,
    `new_sum`    DECIMAL(19, 4) NOT NULL,
    PRIMARY KEY (`log_id`)
);

DROP TRIGGER IF EXISTS tr_change_balance;

DELIMITER ~
--
CREATE TRIGGER tr_change_balance
    AFTER UPDATE
    ON `accounts`
    FOR EACH ROW
BEGIN
    IF OLD.`balance` <> NEW.`balance` THEN
        INSERT INTO `logs`(`account_id`, `old_sum`, `new_sum`)
        VALUES (OLD.`id`, OLD.`balance`, NEW.`balance`);
    END IF;
END
--
~
CALL usp_transfer_money(1, 2, 10);

SELECT *
FROM `logs`
WHERE `account_id` = 1;