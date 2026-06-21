USE `soft_uni`;
--
SELECT e.`employee_id`,
       e.`first_name`,
       e.`last_name`,
       d.`name` AS 'department_name'
FROM `employees` AS e
         INNER JOIN `departments` AS d
                    USING (`department_id`)
WHERE d.`name` = 'Sales'
ORDER BY e.`employee_id` DESC;