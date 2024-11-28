USE `11_softuni_stores_system`;
--
DELETE
FROM `employees`
WHERE `salary` >= 6000
  AND `manager_id` IS NOT NULL;