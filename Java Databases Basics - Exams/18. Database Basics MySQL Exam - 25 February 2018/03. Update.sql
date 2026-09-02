USE `18_buhtig`;
--
-- Check how many rows in the table must be updated
SELECT *
FROM `repositories_contributors`
WHERE `contributor_id` = `repository_id`; -- 4 rows
--
UPDATE `repositories_contributors` AS rc
SET rc.`repository_id` =
        (SELECT r.`id`
         FROM `repositories` AS r
         WHERE r.`id` NOT IN (SELECT `repository_id`
                              FROM (SELECT `repository_id`
                                    FROM `repositories_contributors`) AS rcri)
         ORDER BY r.`id`
         LIMIT 1)
WHERE rc.`contributor_id` = rc.`repository_id`;