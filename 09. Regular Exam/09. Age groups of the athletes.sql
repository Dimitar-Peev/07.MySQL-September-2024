USE `summer_olympics`;
--
SELECT CONCAT_WS(' ', a.`first_name`, a.`last_name`) AS 'full_name',
       (CASE
            WHEN a.`age` <= 18 THEN 'Teenager'
            WHEN a.`age` <= 25 THEN 'Young adult'
            ELSE 'Adult'
       END)                                          AS 'age_group'
FROM `athletes` AS a
ORDER BY a.`age` DESC, a.`first_name`;