USE `09_sgd`;

SELECT COUNT(*)
FROM employees
WHERE `age` < 40
  AND `salary` < 5000;

--
UPDATE `employees`
SET `salary` = `salary` + 1000
WHERE `age` < 40
  AND `salary` < 5000;

