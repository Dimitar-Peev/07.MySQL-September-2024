USE `ep_go_rodie`;
--
SELECT c.name,
       COUNT(*) AS instructors_count
FROM cities c
         JOIN driving_schools ds
              ON c.id = ds.city_id
         JOIN instructors_driving_schools ids
              ON ds.id = ids.driving_school_id
GROUP BY c.name
HAVING instructors_count > 0
ORDER BY instructors_count DESC;