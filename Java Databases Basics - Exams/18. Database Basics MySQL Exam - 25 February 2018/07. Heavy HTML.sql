USE `18_buhtig`;
--
SELECT `id`, `name`, `size`
FROM `files`
WHERE `size` > 1000
  AND `name` LIKE '%html%'
ORDER BY `size` DESC;