USE `ep_preserves_db`;
--
SELECT p.name,
       c.country_code,
       YEAR(p.established_on) AS founded_in
FROM preserves p
         JOIN countries_preserves cp
              ON p.id = cp.preserve_id
         JOIN countries c
              ON cp.country_id = c.id
WHERE MONTH(p.established_on) = 5
ORDER BY founded_in
LIMIT 5;