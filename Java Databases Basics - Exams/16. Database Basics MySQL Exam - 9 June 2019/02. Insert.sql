USE `16_ruk_database`;
--
SELECT COUNT(*) AS 'count'
FROM `cards`; -- 500
--
INSERT INTO `cards`(`card_number`, `card_status`, `bank_account_id`)
    (SELECT REVERSE(`full_name`),
            'Active',
            `id`
     FROM `clients`
#      WHERE `id` >= 191 AND `id` <= 200;
     WHERE `id` BETWEEN 191 AND 200);
--
SELECT COUNT(*) AS 'count'
FROM `cards`; -- 510