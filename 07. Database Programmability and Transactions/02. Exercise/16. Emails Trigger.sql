USE `soft_uni`;
--
CREATE TABLE `notification_emails`
(
    `id`        INT AUTO_INCREMENT,
    `recipient` INT NOT NULL,
    `subject`   TEXT,
    `body`      TEXT,
    PRIMARY KEY (`id`)
);

DROP TRIGGER IF EXISTS tr_email_on_new_record;

DELIMITER ~
--
CREATE TRIGGER tr_email_on_new_record
    AFTER INSERT
    ON `logs`
    FOR EACH ROW
BEGIN
    DECLARE subject TEXT;
    DECLARE body TEXT;
    SET subject := CONCAT('Balance change for account: ', NEW.`account_id`);
    SET body := CONCAT('On ', DATE_FORMAT(NOW(), '%b %d %Y at %r'), ' your balance was changed from ',
                       ROUND(NEW.`old_sum`, 2), ' to ', ROUND(NEW.`new_sum`, 2), '.');
    INSERT INTO `notification_emails`(`recipient`, `subject`, `body`)
    VALUES (NEW.`account_id`, `subject`, `body`);
END;
--
~

CALL usp_transfer_money(1, 2, 10);

SELECT *
FROM `notification_emails`;