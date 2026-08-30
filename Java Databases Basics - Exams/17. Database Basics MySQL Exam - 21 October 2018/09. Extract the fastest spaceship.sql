USE `17_cjms_db`;
--
SELECT s.`name`  AS 'spaceship_name',
       sp.`name` AS 'spaceport_name'
FROM `spaceships` AS s
         INNER JOIN `journeys` AS j
                    ON s.`id` = j.`spaceship_id`
         INNER JOIN `spaceports` AS sp
                    ON j.`destination_spaceport_id` = sp.`id`
ORDER BY s.`light_speed_rate` DESC
LIMIT 1;