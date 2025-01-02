USE `01_go_roadie`;
--
SELECT CONCAT(`first_name`, ' ', students.`last_name`), `age`
FROM `students`
WHERE `first_name` REGEXP '[a]'
ORDER BY `age`, `id`
LIMIT 3;