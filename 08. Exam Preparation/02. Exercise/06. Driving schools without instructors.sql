USE `ep_go_rodie`;
--
SELECT dc.id, dc.name, c.brand
FROM driving_schools dc
         JOIN cars c
              ON c.id = dc.car_id
         LEFT JOIN instructors_driving_schools ids
                   ON ids.driving_school_id = dc.id
WHERE ids.instructor_id IS NULL
ORDER BY c.brand, dc.id
LIMIT 5;
