USE `17_cjms_db`;
--
DROP FUNCTION IF EXISTS udf_count_colonists_by_destination_planet;

DELIMITER ~
--
CREATE FUNCTION udf_count_colonists_by_destination_planet(planet_name VARCHAR(30))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE count_colonists INT;
    SET count_colonists := (SELECT COUNT(c.`id`)
                            FROM `colonists` AS c
                                     INNER JOIN `travel_cards` AS tc
                                                ON c.`id` = tc.`colonist_id`
                                     INNER JOIN `journeys` AS j
                                                ON j.`id` = tc.`journey_id`
                                     INNER JOIN `spaceports` AS s
                                                ON j.`destination_spaceport_id` = s.`id`
                                     INNER JOIN `planets` AS p
                                                ON p.`id` = s.`planet_id`
                            WHERE p.`name` = planet_name);
    RETURN count_colonists;
END
--
~
SELECT p.`name`, udf_count_colonists_by_destination_planet('Otroyphus') AS 'count'
FROM `planets` AS p
WHERE p.`name` = 'Otroyphus';