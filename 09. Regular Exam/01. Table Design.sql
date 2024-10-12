DROP DATABASE IF EXISTS `summer_olympics`;
CREATE DATABASE `summer_olympics`;
USE `summer_olympics`;
--
CREATE TABLE `countries`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);
CREATE TABLE `sports`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);
CREATE TABLE `disciplines`
(
    `id`       INT AUTO_INCREMENT,
    `name`     VARCHAR(40) NOT NULL UNIQUE,
    `sport_id` INT         NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_disciplines_sports
        FOREIGN KEY `disciplines` (`sport_id`)
            REFERENCES `sports` (`id`)
);
CREATE TABLE `athletes`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(40) NOT NULL,
    `last_name`  VARCHAR(40) NOT NULL,
    `age`        INT         NOT NULL,
    `country_id` INT         NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_athletes_countries
        FOREIGN KEY `athletes` (`country_id`)
            REFERENCES `countries` (`id`)
);
CREATE TABLE `medals`
(
    `id`   INT AUTO_INCREMENT,
    `type` VARCHAR(10) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);
CREATE TABLE `disciplines_athletes_medals`
(
    `discipline_id` INT NOT NULL,
    `athlete_id`    INT NOT NULL,
    `medal_id`      INT NOT NULL,

    PRIMARY KEY (`discipline_id`, `athlete_id`),

    CONSTRAINT fk_disciplines_athletes_medals_disciplines
        FOREIGN KEY `disciplines_athletes_medals` (`discipline_id`)
            REFERENCES `disciplines` (`id`),

    CONSTRAINT fk_disciplines_athletes_medals_athletes
        FOREIGN KEY `disciplines_athletes_medals` (`athlete_id`)
            REFERENCES `athletes` (`id`),

    CONSTRAINT fk_disciplines_athletes_medals_medals
        FOREIGN KEY `disciplines_athletes_medals` (`medal_id`)
            REFERENCES `medals` (`id`)
);