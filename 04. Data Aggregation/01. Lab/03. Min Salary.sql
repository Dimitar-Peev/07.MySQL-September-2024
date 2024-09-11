USE `restaurant`;
--
SELECT `department_id`, ROUND(MIN(`salary`)) AS 'Min Salary'
FROM `employees`
GROUP BY `department_id`
HAVING `Min Salary` > 800;