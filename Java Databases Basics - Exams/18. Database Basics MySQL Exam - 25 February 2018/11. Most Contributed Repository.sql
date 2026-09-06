USE `18_buhtig`;
--
SELECT r.`id`,
       r.`name`,
       (SELECT COUNT(c.`id`)
        FROM `commits` AS c
        WHERE c.`repository_id` = r.`id`)  AS 'commits',
       (SELECT COUNT(rc.`contributor_id`)
        FROM `repositories_contributors` AS rc
        WHERE rc.`repository_id` = r.`id`) AS 'contributors'
FROM `repositories` AS r
WHERE r.`id` = (SELECT rc.`repository_id`
                FROM `repositories_contributors` AS rc
                GROUP BY rc.`repository_id`
                ORDER BY COUNT(rc.`contributor_id`) DESC, `repository_id`
                LIMIT 1);