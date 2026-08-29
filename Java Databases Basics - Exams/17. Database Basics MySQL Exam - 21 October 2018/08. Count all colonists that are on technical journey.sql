USE `17_cjms_db`;
--
SELECT COUNT(tc.`id`) AS 'count'
FROM `travel_cards` AS tc
         INNER JOIN `journeys` AS j
                    ON j.`id` = tc.`journey_id`
WHERE j.`purpose` = 'Technical';
