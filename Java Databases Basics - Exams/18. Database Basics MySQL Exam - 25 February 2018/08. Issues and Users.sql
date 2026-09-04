USE `18_buhtig`;
--
SELECT i.`id`,
       CONCAT(u.`username`, ' : ', i.`title`) AS 'issue_assignee'
FROM `issues` AS i
         INNER JOIN `users` AS u
                    ON i.`assignee_id` = u.`id`
ORDER BY i.`id` DESC;
