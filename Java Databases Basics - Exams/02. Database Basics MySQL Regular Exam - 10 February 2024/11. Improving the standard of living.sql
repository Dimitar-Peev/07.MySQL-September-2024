USE `02_preserves_db`;
--
DROP PROCEDURE IF EXISTS udp_increase_salaries_by_country;

DELIMITER ~
--
CREATE PROCEDURE udp_increase_salaries_by_country(p_country_name VARCHAR(40))
BEGIN
    UPDATE `workers` AS w
        INNER JOIN `preserves` AS p
        ON w.`preserve_id` = p.`id`
        INNER JOIN `countries_preserves` AS cp
        ON p.`id` = cp.`preserve_id`
        INNER JOIN `countries` AS c
        ON cp.`country_id` = c.`id`
    SET w.`salary` = w.`salary` * 1.05
    WHERE c.`name` = p_country_name;
END
--
~

-- Check salary before
SELECT w.`first_name`, w.`last_name`, w.`salary`
FROM `workers` AS w
         INNER JOIN `preserves` AS p
                    ON w.`preserve_id` = p.`id`
         INNER JOIN `countries_preserves` AS cp
                    ON p.`id` = cp.`preserve_id`
         INNER JOIN `countries` AS c
                    ON cp.`country_id` = c.`id`
WHERE c.`name` = 'Germany';

CALL udp_increase_salaries_by_country('Germany');

-- Check salary after
SELECT w.`first_name`, w.`last_name`, w.`salary`
FROM `workers` AS w
         INNER JOIN `preserves` AS p
                    ON w.`preserve_id` = p.`id`
         INNER JOIN `countries_preserves` AS cp
                    ON p.`id` = cp.`preserve_id`
         INNER JOIN `countries` AS c
                    ON cp.`country_id` = c.`id`
WHERE c.`name` = 'Germany';