DROP DATABASE IF EXISTS `10_stc`;
CREATE DATABASE `10_stc`;
USE `10_stc`;
--
CREATE TABLE `addresses`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `categories`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `clients`
(
    `id`           INT AUTO_INCREMENT,
    `full_name`    VARCHAR(50) NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `drivers`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name`  VARCHAR(30) NOT NULL,
    `age`        INT         NOT NULL,
    `rating`     FLOAT DEFAULT 5.5,
    PRIMARY KEY (`id`)
);

CREATE TABLE `cars`
(
    `id`          INT AUTO_INCREMENT,
    `make`        VARCHAR(20) NOT NULL,
    `model`       VARCHAR(20),
    `year`        INT         NOT NULL DEFAULT 0,
    `mileage`     INT                  DEFAULT 0,
    `condition`   CHAR(1)     NOT NULL,
    `category_id` INT         NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_cars_categories
        FOREIGN KEY `cars` (`category_id`)
            REFERENCES `categories` (`id`)
);

CREATE TABLE `courses`
(
    `id`              INT AUTO_INCREMENT,
    `from_address_id` INT      NOT NULL,
    `start`           DATETIME NOT NULL,
    `bill`            DECIMAL(10, 2) DEFAULT 10,
    `car_id`          INT      NOT NULL,
    `client_id`       INT      NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_courses_addresses
        FOREIGN KEY `courses` (`from_address_id`)
            REFERENCES `addresses` (`id`),

    CONSTRAINT fk_courses_cars
        FOREIGN KEY `courses` (`car_id`)
            REFERENCES `cars` (`id`),

    CONSTRAINT fk_courses_clients
        FOREIGN KEY `courses` (`client_id`)
            REFERENCES `clients` (`id`)
);

CREATE TABLE `cars_drivers`
(
    `car_id`    INT NOT NULL,
    `driver_id` INT NOT NULL,
    PRIMARY KEY (`car_id`, `driver_id`),

    CONSTRAINT fk_cars_drivers_cars
        FOREIGN KEY `cars_drivers` (`car_id`)
            REFERENCES `cars` (`id`),

    CONSTRAINT fk_cars_drivers_drivers
        FOREIGN KEY `cars_drivers` (`driver_id`)
            REFERENCES `drivers` (`id`)
);