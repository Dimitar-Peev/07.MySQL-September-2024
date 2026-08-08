DROP DATABASE IF EXISTS `02_preserves_db`;
CREATE DATABASE `02_preserves_db`;
USE `02_preserves_db`;
--
CREATE TABLE `continents`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(40) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `countries`
(
    `id`           INT AUTO_INCREMENT,
    `name`         VARCHAR(40) UNIQUE NOT NULL,
    `country_code` VARCHAR(10) UNIQUE NOT NULL,
    `continent_id` INT                NOT NULL,
    PRIMARY KEY (`id`)
);

ALTER TABLE `countries`
    ADD CONSTRAINT fk_countries_continents
        FOREIGN KEY (`continent_id`)
            REFERENCES `continents` (`id`);

CREATE TABLE `preserves`
(
    `id`             INT AUTO_INCREMENT,
    `name`           VARCHAR(255) UNIQUE NOT NULL,
    `latitude`       DECIMAL(9, 6),
    `longitude`      DECIMAL(9, 6),
    `area`           INT,
    `type`           VARCHAR(20),
    `established_on` DATE,
    PRIMARY KEY (`id`)
);

CREATE TABLE `positions`
(
    `id`           INT AUTO_INCREMENT,
    `name`         VARCHAR(40) UNIQUE NOT NULL,
    `description`  TEXT,
    `is_dangerous` BOOLEAN            NOT NULL, -- TINYINT(1)
    PRIMARY KEY (`id`)
);

CREATE TABLE `workers`
(
    `id`              INT AUTO_INCREMENT,
    `first_name`      VARCHAR(40)        NOT NULL,
    `last_name`       VARCHAR(40)        NOT NULL,
    `age`             INT,
    `personal_number` VARCHAR(20) UNIQUE NOT NULL,
    `salary`          DECIMAL(19, 2),
    `is_armed`        BOOLEAN            NOT NULL, -- TINYINT(1)
    `start_date`      DATE,
    `preserve_id`     INT,
    `position_id`     INT                NOT NULL,
    PRIMARY KEY (`id`)
);

ALTER TABLE `workers`
    ADD CONSTRAINT fk_workers_preserves
        FOREIGN KEY (`preserve_id`)
            REFERENCES `preserves` (`id`);

ALTER TABLE `workers`
    ADD CONSTRAINT fk_workers_positions
        FOREIGN KEY (`position_id`)
            REFERENCES `positions` (`id`);

CREATE TABLE `countries_preserves`
(
    `country_id`  INT NOT NULL,
    `preserve_id` INT NOT NULL,

#     PRIMARY KEY `pk_countries_preserves` (`country_id` , `preserve_id`),

    CONSTRAINT fk_countries_preserves_countries
        FOREIGN KEY (`country_id`)
            REFERENCES `countries` (`id`),
    CONSTRAINT fk_countries_preserves_preserves
        FOREIGN KEY (`preserve_id`)
            REFERENCES `preserves` (`id`)
);
