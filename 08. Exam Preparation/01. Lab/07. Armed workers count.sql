USE `ep_preserves_db`;
--
SELECT p.name,
       COUNT(*) AS armed_workers
FROM preserves p
         JOIN workers w
              ON p.id = w.preserve_id
WHERE w.is_armed = 1
GROUP BY p.id
ORDER BY armed_workers DESC, p.name;