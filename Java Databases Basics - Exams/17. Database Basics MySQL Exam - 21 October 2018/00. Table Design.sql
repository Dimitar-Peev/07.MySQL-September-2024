DROP DATABASE IF EXISTS `17_cjms_db`;
CREATE DATABASE `17_cjms_db`;
USE `17_cjms_db`;
--
CREATE TABLE `planets`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `spaceports`
(
    `id`        INT AUTO_INCREMENT,
    `name`      VARCHAR(50) NOT NULL,
    `planet_id` INT,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_spaceports_planets
        FOREIGN KEY `spaceports` (`planet_id`)
            REFERENCES `planets` (`id`)
);

CREATE TABLE `spaceships`
(
    `id`               INT AUTO_INCREMENT,
    `name`             VARCHAR(50) NOT NULL,
    `manufacturer`     VARCHAR(30) NOT NULL,
    `light_speed_rate` INT DEFAULT 0,
    PRIMARY KEY (`id`)
);

CREATE TABLE `colonists`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(20)     NOT NULL,
    `last_name`  VARCHAR(20)     NOT NULL,
    `ucn`        CHAR(10) UNIQUE NOT NULL,
    `birth_date` DATE            NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `journeys`
(
    `id`                       INT AUTO_INCREMENT,
    `journey_start`            DATETIME                                                 NOT NULL,
    `journey_end`              DATETIME                                                 NOT NULL,
    `purpose`                  ENUM ('Medical', 'Technical', 'Educational', 'Military') NOT NULL,
    `destination_spaceport_id` INT,
    `spaceship_id`             INT,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_journeys_spaceports
        FOREIGN KEY `journeys` (`destination_spaceport_id`)
            REFERENCES `spaceports` (`id`),

    CONSTRAINT fk_journeys_spaceships
        FOREIGN KEY `journeys` (`spaceship_id`)
            REFERENCES `spaceships` (`id`)
);

CREATE TABLE `travel_cards`
(
    `id`                 INT AUTO_INCREMENT,
    `card_number`        CHAR(10) UNIQUE                                          NOT NULL,
    `job_during_journey` ENUM ('Pilot', 'Engineer', 'Trooper', 'Cleaner', 'Cook') NOT NULL,
    `colonist_id`        INT,
    `journey_id`         INT,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_travel_cards_colonists
        FOREIGN KEY `travel_cards` (`colonist_id`)
            REFERENCES `colonists` (`id`),

    CONSTRAINT fk_travel_cards_journeys
        FOREIGN KEY `travel_cards` (`journey_id`)
            REFERENCES `journeys` (`id`)
);
