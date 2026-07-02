USE `ep_preserves_db`;
--
DELETE
FROM countries_preserves
WHERE preserve_id IN (SELECT id
                      FROM preserves
                      WHERE established_on IS NULL);

DELETE
FROM preserves
WHERE established_on IS NULL;