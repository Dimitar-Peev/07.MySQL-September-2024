USE `soft_uni`;
--
SELECT `town_id`, `name`
FROM `towns`
WHERE LEFT(`name`, 1) IN ('M', 'K', 'B', 'E')
ORDER BY `name`;
