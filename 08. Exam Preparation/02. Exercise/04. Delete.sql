USE `ep_go_rodie`;
--
DELETE
FROM instructors_driving_schools
WHERE driving_school_id IN (SELECT id
                            FROM driving_schools
                            WHERE night_time_driving = 0);

DELETE
FROM driving_schools
WHERE night_time_driving = 0;