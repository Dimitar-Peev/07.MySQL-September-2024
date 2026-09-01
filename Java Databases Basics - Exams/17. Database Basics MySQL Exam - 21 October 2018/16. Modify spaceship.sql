USE `17_cjms_db`;
--
DROP PROCEDURE IF EXISTS udp_modify_spaceship_light_speed_rate;

DELIMITER ~
--
CREATE PROCEDURE udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50), light_speed_rate_increase INT)
BEGIN
    IF `spaceship_name` NOT IN (SELECT `name` FROM `spaceships`)
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Spaceship you are trying to modify does not exists.';
    ELSE
        UPDATE `spaceships`
        SET `light_speed_rate` = `light_speed_rate` + light_speed_rate_increase
        WHERE `name` = `spaceship_name`;
    END IF;
END;
--
~

CALL udp_modify_spaceship_light_speed_rate('Na Pesho koraba', 1914);
-- Spaceship you are trying to modify does not exists.

CALL udp_modify_spaceship_light_speed_rate('USS Templar', 5);
SELECT `name`, `light_speed_rate`
FROM `spaceships`
WHERE `name` = 'USS Templar';

