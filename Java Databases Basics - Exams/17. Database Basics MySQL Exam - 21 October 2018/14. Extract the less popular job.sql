USE `17_cjms_db`;
--
SELECT tc.`job_during_journey` AS 'job_name'
FROM `journeys` AS j
         INNER JOIN `travel_cards` AS tc
              ON j.`id` = tc.`journey_id`
ORDER BY DATEDIFF(j.`journey_end`, j.`journey_start`) DESC
LIMIT 1;