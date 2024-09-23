USE `soft_uni`;

DROP FUNCTION IF EXISTS `ufn_count_employees_by_town`;

DELIMITER ~
--
CREATE FUNCTION `ufn_count_employees_by_town`(f_town_name VARCHAR(50))
    RETURNS INT
    DETERMINISTIC
BEGIN

    DECLARE `id_for_town` INT;
    DECLARE `count_by_town` INT;

    SET `id_for_town` := (SELECT `town_id`
                          FROM `towns`
                          WHERE `name` = f_town_name);

    SET `count_by_town` := (SELECT COUNT(*)
                            FROM `employees` AS e
                            WHERE e.`address_id` IN (SELECT `address_id`
                                                     FROM `addresses`
                                                     WHERE `town_id` = id_for_town));
    RETURN `count_by_town`;

END
--
~
SELECT ufn_count_employees_by_town('Sofia') AS 'count';



