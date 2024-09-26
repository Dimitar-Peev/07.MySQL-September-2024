USE `soft_uni`;

DROP PROCEDURE IF EXISTS usp_get_towns_starting_with;

DELIMITER ~
--
CREATE PROCEDURE usp_get_towns_starting_with(town_substring VARCHAR(50))
BEGIN
    SELECT `name`
    FROM `towns`
    WHERE `name` LIKE CONCAT(town_substring, '%')
    ORDER BY `name`;
END
--
~
CALL usp_get_towns_starting_with('b');