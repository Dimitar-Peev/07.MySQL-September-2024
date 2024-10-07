USE `04_airlines_db`;
--
INSERT INTO `airplanes`(`model`, `passengers_capacity`, `tank_capacity`, `cost`)
    (SELECT CONCAT(REVERSE(`first_name`), '797'),
            CHAR_LENGTH(`last_name`) * 17,
            `id` * 790,
            CHAR_LENGTH(`first_name`) * 50.6
     FROM `passengers`
     WHERE `id` <= 5);