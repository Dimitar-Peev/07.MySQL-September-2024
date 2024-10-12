USE `summer_olympics`;
--
DROP PROCEDURE IF EXISTS udp_first_name_to_upper_case;

DELIMITER ~
--
CREATE PROCEDURE udp_first_name_to_upper_case(letter CHAR(1))
BEGIN
    UPDATE `athletes`
    SET `first_name` = UPPER(`first_name`)
    WHERE `first_name` LIKE CONCAT('%', letter);
END;
--
~
CALL udp_first_name_to_upper_case ('s');

SELECT `id`, `first_name`, `last_name`
FROM `athletes`
WHERE `first_name` LIKE CONCAT('%', 's');