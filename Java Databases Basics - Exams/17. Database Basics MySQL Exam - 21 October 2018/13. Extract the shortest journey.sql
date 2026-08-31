USE `17_cjms_db`;
--
SELECT j.`id`,
       p.`name`    AS 'planet_name',
       sp.`name`   AS 'spaceport_name',
       j.`purpose` AS 'journey_purpose'
FROM `planets` AS p
         INNER JOIN `spaceports` AS sp
                    ON sp.`planet_id` = p.`id`
         INNER JOIN `journeys` AS j
                    ON j.`destination_spaceport_id` = sp.`id`
ORDER BY j.`journey_end` - j.`journey_start`
LIMIT 1;