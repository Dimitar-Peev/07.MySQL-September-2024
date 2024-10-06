USE `13_instd`;
--
DELETE
FROM `addresses`
WHERE `id` % 3 = 0;