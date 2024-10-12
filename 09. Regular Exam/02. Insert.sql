USE `summer_olympics`;
--

SELECT *
FROM `athletes` AS a
         INNER JOIN `countries` AS c
                    ON a.`country_id` = c.`id`
WHERE LEFT(c.`name`, 1) = 'A';

--
INSERT INTO `athletes` (`first_name`, `last_name`, `age`, `country_id`)
SELECT UPPER(a.`first_name`)                                 AS 'first_name',
       CONCAT_WS(' ', a.`last_name`, 'comes from', c.`name`) AS 'last_name',
       (a.`age` + c.`id`)                                    AS 'age',
       c.`id`
FROM `athletes` AS a
         INNER JOIN `countries` AS c
                    ON a.`country_id` = c.`id`
WHERE LEFT(c.`name`, 1) = 'A';