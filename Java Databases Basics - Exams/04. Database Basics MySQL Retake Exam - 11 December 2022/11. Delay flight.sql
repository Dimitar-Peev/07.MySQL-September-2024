USE `04_airlines_db`;

DROP PROCEDURE IF EXISTS udp_delay_flight;

DELIMITER ~
--
CREATE PROCEDURE udp_delay_flight(f_code VARCHAR(50))
BEGIN
    UPDATE `flights`
    SET `has_delay` = TRUE,
        `departure` = DATE_ADD(`departure`, INTERVAL 30 MINUTE)
    WHERE `flight_code` = f_code;
END
--
~
-- before
SELECT `flight_code`, `has_delay`, `departure`
FROM `flights`
WHERE `flight_code` = 'ZP-782';

CALL udp_delay_flight('ZP-782');

-- after
SELECT `flight_code`, `has_delay`, `departure`
FROM `flights`
WHERE `flight_code` = 'ZP-782';