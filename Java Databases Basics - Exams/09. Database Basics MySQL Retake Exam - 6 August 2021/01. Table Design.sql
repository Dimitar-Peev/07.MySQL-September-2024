DROP DATABASE IF EXISTS `09_sgd`;
CREATE DATABASE `09_sgd`;
USE `09_sgd`;
--
CREATE TABLE `addresses`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `categories`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `offices`
(
    `id`                 INT AUTO_INCREMENT,
    `workspace_capacity` INT NOT NULL,
    `website`            VARCHAR(50),
    `address_id`         INT NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_offices_addresses
        FOREIGN KEY (`address_id`)
            REFERENCES `addresses` (`id`)
);

CREATE TABLE `employees`
(
    `id`              INT AUTO_INCREMENT,
    `first_name`      VARCHAR(30)    NOT NULL,
    `last_name`       VARCHAR(30)    NOT NULL,
    `age`             INT            NOT NULL,
    `salary`          DECIMAL(10, 2) NOT NULL,
    `job_title`       VARCHAR(20)    NOT NULL,
    `happiness_level` CHAR(1)        NOT NULL CHECK ( `happiness_level` IN ('L', 'N', 'H') ),
    PRIMARY KEY (`id`)
);

CREATE TABLE `teams`
(
    `id`        INT AUTO_INCREMENT,
    `name`      VARCHAR(40) NOT NULL,
    `office_id` INT         NOT NULL,
    `leader_id` INT UNIQUE  NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_teams_offices
        FOREIGN KEY `teams` (`office_id`)
            REFERENCES `offices` (`id`),

    CONSTRAINT fk_teams_employees
        FOREIGN KEY `teams` (`leader_id`)
            REFERENCES `employees` (`id`)
);

CREATE TABLE `games`
(
    `id`           INT AUTO_INCREMENT,
    `name`         VARCHAR(50) UNIQUE NOT NULL,
    `description`  TEXT,
    `rating`       FLOAT              NOT NULL DEFAULT 5.5,
    `budget`       DECIMAL(10, 2)     NOT NULL,
    `release_date` DATE,
    `team_id`      INT                NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_games_teams
        FOREIGN KEY `games` (`team_id`)
            REFERENCES `teams` (`id`)
);

CREATE TABLE `games_categories`
(
    `game_id`     INT NOT NULL,
    `category_id` INT NOT NULL,
    PRIMARY KEY (`game_id`, `category_id`),

    CONSTRAINT fk_games_categories_games
        FOREIGN KEY `games_categories` (`game_id`)
            REFERENCES `games` (`id`),

    CONSTRAINT fk_games_categories_categories
        FOREIGN KEY `games_categories` (`category_id`)
            REFERENCES `categories` (`id`)
);