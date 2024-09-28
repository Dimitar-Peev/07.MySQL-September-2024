USE `soft_uni`;
--
DROP PROCEDURE IF EXISTS usp_get_holders_with_balance_higher_than;

DELIMITER ~
--
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(money DECIMAL(19, 4))
BEGIN
    SELECT `first_name`, `last_name`
    FROM `account_holders` AS ah
             LEFT JOIN `accounts`
                       ON ah.`id` = `account_holder_id`
    GROUP BY ah.`id`
    HAVING SUM(`balance`) > `money`
    ORDER BY ah.`id`;
END
--
~
CALL usp_get_holders_with_balance_higher_than(7000);