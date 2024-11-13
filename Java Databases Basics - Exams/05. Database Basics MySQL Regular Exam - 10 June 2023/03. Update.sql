USE `05_universities_db`;
--
UPDATE `universities`
SET `tuition_fee` = `tuition_fee` + 300
WHERE `id` BETWEEN 5 AND 12;