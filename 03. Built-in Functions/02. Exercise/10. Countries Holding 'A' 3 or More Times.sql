USE `geography`;
--
SELECT `country_name`, `iso_code`
FROM `countries`
WHERE `country_name` LIKE '%A%A%A%'
ORDER BY `iso_code`;

-- Second way
-- SELECT `country_name`, `iso_code`
-- FROM `countries`
-- WHERE LENGTH(`country_name`) - LENGTH(REPLACE(LOWER(`country_name`), 'a', '')) >= 3
-- ORDER BY `iso_code`;


