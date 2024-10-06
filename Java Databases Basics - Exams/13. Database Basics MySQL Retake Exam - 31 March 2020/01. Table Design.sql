DROP DATABASE IF EXISTS `13_instd`;
CREATE DATABASE `13_instd`;
USE `13_instd`;
--
CREATE TABLE `users`
(
    `id`        INT AUTO_INCREMENT,
    `username`  VARCHAR(30) NOT NULL UNIQUE,
    `password`  VARCHAR(30) NOT NULL,
    `email`     VARCHAR(50) NOT NULL,
    `gender`    CHAR(1)     NOT NULL CHECK ( `gender` IN ('M', 'F') ),
    `age`       INT         NOT NULL,
    `job_title` VARCHAR(40) NOT NULL,
    `ip`        VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `addresses`
(
    `id`      INT AUTO_INCREMENT,
    `address` VARCHAR(30) NOT NULL,
    `town`    VARCHAR(30) NOT NULL,
    `country` VARCHAR(30) NOT NULL,
    `user_id` INT         NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_addresses_users
        FOREIGN KEY `addresses` (`user_id`)
            REFERENCES `users` (`id`)
);

CREATE TABLE `photos`
(
    `id`          INT AUTO_INCREMENT,
    `description` TEXT     NOT NULL,
    `date`        DATETIME NOT NULL,
    `views`       INT      NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
);

CREATE TABLE `comments`
(
    `id`       INT AUTO_INCREMENT,
    `comment`  VARCHAR(255) NOT NULL,
    `date`     DATETIME     NOT NULL,
    `photo_id` INT          NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_comments_photos
        FOREIGN KEY `comments` (`photo_id`)
            REFERENCES `photos` (`id`)
);

CREATE TABLE `users_photos`
(
    `user_id`  INT NOT NULL,
    `photo_id` INT NOT NULL,

    KEY `users_photos` (`user_id`, `photo_id`),

    CONSTRAINT fk_users_photos_users
        FOREIGN KEY `users_photos` (`user_id`)
            REFERENCES `users` (`id`),

    CONSTRAINT fk_users_photos_photos
        FOREIGN KEY `users_photos` (`photo_id`)
            REFERENCES `photos` (`id`)
);

CREATE TABLE `likes`
(
    `id`       INT AUTO_INCREMENT,
    `user_id`  INT,
    `photo_id` INT,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_likes_users
        FOREIGN KEY `likes` (`user_id`)
            REFERENCES `users` (`id`),

    CONSTRAINT fk_likes_photos
        FOREIGN KEY `likes` (`photo_id`)
            REFERENCES `photos` (`id`)
);