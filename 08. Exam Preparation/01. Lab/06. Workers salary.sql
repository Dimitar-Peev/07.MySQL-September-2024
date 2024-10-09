USE `ep_preserves_db`;
--
SELECT w.id,
       w.first_name,
       w.last_name,
       p.name,
       c.country_code
FROM workers w
         JOIN preserves p
              ON p.id = w.preserve_id
         JOIN countries_preserves cp
              ON p.id = cp.preserve_id
         JOIN countries c
              ON c.id = cp.country_id
WHERE w.salary > 5000
  AND w.age < 50
ORDER BY c.country_code;