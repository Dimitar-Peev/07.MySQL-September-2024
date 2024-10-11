DROP DATABASE IF EXISTS `07_softuni_imdb`;
CREATE DATABASE `07_softuni_imdb`;
USE `07_softuni_imdb`;
--
CREATE TABLE `countries`
(
    `id`        INT AUTO_INCREMENT,
    `name`      VARCHAR(30) UNIQUE NOT NULL,
    `continent` VARCHAR(30)        NOT NULL,
    `currency`  VARCHAR(5)         NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `genres`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `actors`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name`  VARCHAR(50) NOT NULL,
    `birthdate`  DATE        NOT NULL,
    `height`     INT,
    `awards`     INT,
    `country_id` INT         NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_actors_countries
        FOREIGN KEY `actors` (`country_id`)
            REFERENCES `countries` (`id`)
);

CREATE TABLE `movies_additional_info`
(
    `id`            INT AUTO_INCREMENT,
    `rating`        DECIMAL(10, 2) NOT NULL,
    `runtime`       INT            NOT NULL,
    `picture_url`   VARCHAR(80)    NOT NULL,
    `budget`        DECIMAL(10, 2),
    `release_date`  DATE           NOT NULL,
    `has_subtitles` BOOLEAN,
    `description`   TEXT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `movies`
(
    `id`            INT AUTO_INCREMENT,
    `title`         VARCHAR(70) UNIQUE NOT NULL,
    `country_id`    INT                NOT NULL,
    `movie_info_id` INT UNIQUE         NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_movies_countries
        FOREIGN KEY `movies` (`country_id`)
            REFERENCES `countries` (`id`),

    CONSTRAINT fk_movies_movies_additional_info
        FOREIGN KEY `movies` (`movie_info_id`)
            REFERENCES `movies_additional_info` (`id`)
);

CREATE TABLE `movies_actors`
(
    `movie_id` INT,
    `actor_id` INT,
    KEY (`movie_id`, `actor_id`),

    CONSTRAINT fk_movies_actors_movies
        FOREIGN KEY `movies_actors` (`movie_id`)
            REFERENCES `movies` (`id`),

    CONSTRAINT fk_movies_actors_actors
        FOREIGN KEY `movies_actors` (`actor_id`)
            REFERENCES `actors` (`id`)
);

CREATE TABLE `genres_movies`
(
    `genre_id` INT,
    `movie_id` INT,
    KEY (`genre_id`, `movie_id`),

    CONSTRAINT fk_genres_movies_genres
        FOREIGN KEY `genres_movies` (`genre_id`)
            REFERENCES `genres` (`id`),

    CONSTRAINT fk_genres_movies_actors_movies
        FOREIGN KEY `genres_movies` (`movie_id`)
            REFERENCES `movies` (`id`)
);