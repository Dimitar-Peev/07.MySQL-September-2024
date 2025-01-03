USE `01_go_roadie`;
--
SELECT CONCAT(`first_name`, ' ', `last_name`) AS 'full_name',
       CASE
           WHEN YEAR(`has_a_license_from`) >= 1980 AND YEAR(`has_a_license_from`) < 1990 THEN 'Specialist'
           WHEN YEAR(`has_a_license_from`) >= 1990 AND YEAR(`has_a_license_from`) < 2000 THEN 'Advanced'
           WHEN YEAR(`has_a_license_from`) >= 2000 AND YEAR(`has_a_license_from`) < 2008 THEN 'Experienced'
           WHEN YEAR(`has_a_license_from`) >= 2008 AND YEAR(`has_a_license_from`) < 2015 THEN 'Qualified'
           WHEN YEAR(`has_a_license_from`) >= 2015 AND YEAR(`has_a_license_from`) < 2020 THEN 'Provisional'
           WHEN YEAR(`has_a_license_from`) >= 2020 THEN 'Trainee'
           END                                AS 'level'
FROM `instructors`
ORDER BY YEAR(`has_a_license_from`), `first_name`;