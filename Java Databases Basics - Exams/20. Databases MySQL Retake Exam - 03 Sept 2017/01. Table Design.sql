DROP DATABASE IF EXISTS `20_instagraph_db`;
CREATE SCHEMA `20_instagraph_db`;
USE `20_instagraph_db`;
--
CREATE TABLE `pictures`
(
    `id`   INT            NOT NULL AUTO_INCREMENT,
    `path` VARCHAR(255)   NOT NULL,
    `size` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `users`
(
    `id`                 INT         NOT NULL AUTO_INCREMENT,
    `username`           VARCHAR(30) NOT NULL UNIQUE,
    `password`           VARCHAR(30) NOT NULL,
    `profile_picture_id` INT,
    PRIMARY KEY (`id`),

#     UNIQUE KEY `username_UNIQUE` (`username`),
#     KEY `fk_users_pictures_idx` (profile_picture_id),

    CONSTRAINT `fk_users_pictures`
        FOREIGN KEY (`profile_picture_id`)
            REFERENCES `pictures` (`id`)
);

CREATE TABLE `posts`
(
    `id`         INT          NOT NULL AUTO_INCREMENT,
    `caption`    VARCHAR(255) NOT NULL,
    `user_id`    INT          NOT NULL,
    `picture_id` INT          NOT NULL,
    PRIMARY KEY (`id`),

    INDEX `fk_posts_users_idx` (`user_id` ASC),
    INDEX `fk_posts_pictures_idx` (`picture_id` ASC),

    CONSTRAINT `fk_posts_pictures`
        FOREIGN KEY (`picture_id`)
            REFERENCES `pictures` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,

    CONSTRAINT `fk_posts_users`
        FOREIGN KEY (`user_id`)
            REFERENCES `users` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE `comments`
(
    `id`      INT          NOT NULL AUTO_INCREMENT,
    `content` VARCHAR(255) NOT NULL,
    `user_id` INT          NOT NULL,
    `post_id` INT          NOT NULL,
    PRIMARY KEY (`id`),

    INDEX `fk_comments_users_idx` (`user_id` ASC),
    INDEX `fk_comments_posts_idx` (`post_id` ASC),

    CONSTRAINT `fk_comments_posts`
        FOREIGN KEY (`post_id`)
            REFERENCES `posts` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,

    CONSTRAINT `fk_comments_users`
        FOREIGN KEY (`user_id`)
            REFERENCES `users` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE `users_followers`
(
    `user_id`     INT NOT NULL,
    `follower_id` INT NOT NULL,

    INDEX `fk_users_followers_idx` (`user_id` ASC),
    INDEX `fk_users_following_idx` (`follower_id` ASC),

    CONSTRAINT `fk_users_followers`
        FOREIGN KEY (`user_id`)
            REFERENCES `users` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,

    CONSTRAINT `fk_users_following`
        FOREIGN KEY (`follower_id`)
            REFERENCES `users` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);