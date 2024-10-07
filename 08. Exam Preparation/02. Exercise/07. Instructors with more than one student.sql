USE `ep_go_rodie`;
--
SELECT i.first_name,
       i.last_name,
       COUNT(*)                         AS students_count,
       (SELECT c.name
        FROM cities c
                 JOIN driving_schools ds ON c.id = ds.city_id
                 JOIN instructors_driving_schools ids ON ds.id = ids.driving_school_id
        WHERE i.id = ids.instructor_id) AS name
FROM instructors i
         JOIN instructors_students `is`
              ON i.id = `is`.instructor_id
         JOIN instructors_driving_schools ids
              ON i.id = ids.instructor_id
GROUP BY i.id
HAVING students_count > 1
ORDER BY students_count DESC, i.first_name;