USE `ep_go_rodie`;
--
SELECT CONCAT(first_name, ' ', last_name), age
FROM students
WHERE first_name LIKE '%a%'
  AND age = (SELECT MIN(age) FROM students)
ORDER BY id;