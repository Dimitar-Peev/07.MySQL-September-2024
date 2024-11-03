USE `03_real_estate_db`;
--
DELETE
FROM `property_transactions`
WHERE `is_successful` IS FALSE;