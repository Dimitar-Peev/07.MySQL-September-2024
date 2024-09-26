USE `soft_uni`;

DROP PROCEDURE IF EXISTS usp_get_employees_from_town;

DELIMITER ~
--
CREATE PROCEDURE usp_get_employees_from_town(searched_town VARCHAR(50))
BEGIN
    SELECT `first_name`, `last_name`
    FROM `employees`
             INNER JOIN `addresses`
                        USING (address_id)
             INNER JOIN `towns` AS t
                        USING (town_id)
    WHERE t.`name` = searched_town
    ORDER BY `first_name`, `last_name`;
END
--
~
CALL usp_get_employees_from_town('Sofia');