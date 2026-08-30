USE `17_cjms_db`;
--
SELECT p.`name` AS 'planet_name',
       s.`name` AS 'spaceport_name'
FROM `spaceports` AS s
         INNER JOIN `journeys` AS j
                    ON s.`id` = j.`destination_spaceport_id`
         INNER JOIN `planets` AS p
                    ON p.`id` = s.`planet_id`
WHERE j.`purpose` = 'Educational'
ORDER BY `spaceport_name` DESC;