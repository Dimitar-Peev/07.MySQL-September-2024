DROP DATABASE IF EXISTS `04_airlines_db`;
CREATE DATABASE `04_airlines_db`;
USE `04_airlines_db`;
--
CREATE TABLE `countries`
(
    `id`          INT AUTO_INCREMENT,
    `name`        VARCHAR(30) UNIQUE NOT NULL,
    `description` TEXT,
    `currency`    VARCHAR(5)         NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `airplanes`
(
    `id`                  INT AUTO_INCREMENT,
    `model`               VARCHAR(50) UNIQUE NOT NULL,
    `passengers_capacity` INT                NOT NULL,
    `tank_capacity`       DECIMAL(19, 2)     NOT NULL,
    `cost`                DECIMAL(19, 2)     NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `passengers`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(30),
    `last_name`  VARCHAR(30),
    `country_id` INT NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_passengers_countries
        FOREIGN KEY `passengers` (`country_id`)
            REFERENCES `countries` (`id`)
);

CREATE TABLE `flights`
(
    `id`                  INT AUTO_INCREMENT,
    `flight_code`         VARCHAR(30) UNIQUE NOT NULL,
    `departure_country`   INT                NOT NULL,
    `destination_country` INT                NOT NULL,
    `airplane_id`         INT                NOT NULL,
    `has_delay`           BOOLEAN,
    `departure`           DATETIME,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_flights_countries_1
        FOREIGN KEY `flights` (`departure_country`)
            REFERENCES `countries` (`id`),

    CONSTRAINT fk_flights_countries_2
        FOREIGN KEY `flights` (`destination_country`)
            REFERENCES `countries` (`id`),

    CONSTRAINT fk_flights_airplanes
        FOREIGN KEY `flights` (`airplane_id`)
            REFERENCES `airplanes` (`id`)
);

CREATE TABLE `flights_passengers`
(
    `flight_id`    INT,
    `passenger_id` INT,

    KEY k_flights_passengers (`flight_id`, `passenger_id`),

    CONSTRAINT fk_flights_passengers_flights
        FOREIGN KEY `flights_passengers` (`flight_id`)
            REFERENCES `flights` (`id`),

    CONSTRAINT fk_flights_passengers_passengers
        FOREIGN KEY `flights_passengers` (`passenger_id`)
            REFERENCES `passengers` (`id`)
);