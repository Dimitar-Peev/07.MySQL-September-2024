DROP DATABASE IF EXISTS `15_colonial_blog_db`;
CREATE DATABASE `15_colonial_blog_db`;
USE `15_colonial_blog_db`;
--
CREATE TABLE `categories`
(
    `id`       INT AUTO_INCREMENT,
    `category` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `articles`
(
    `id`          INT AUTO_INCREMENT,
    `title`       VARCHAR(50) NOT NULL,
    `content`     TEXT        NOT NULL,
    `category_id` INT,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_articles_categories
        FOREIGN KEY `articles` (`category_id`)
            REFERENCES `categories` (`id`)
);

CREATE TABLE `users`
(
    `id`       INT AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(30) NOT NULL,
    `email`    VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `users_articles`
(
    `user_id`    INT,
    `article_id` INT,

    CONSTRAINT fk_users_articles_users
        FOREIGN KEY `users_articles` (`user_id`)
            REFERENCES `users` (`id`),

    CONSTRAINT fk_users_articles_articles
        FOREIGN KEY `users_articles` (`article_id`)
            REFERENCES `articles` (`id`)
);

CREATE TABLE `comments`
(
    `id`         INT AUTO_INCREMENT,
    `comment`    VARCHAR(255) NOT NULL,
    `article_id` INT          NOT NULL,
    `user_id`    INT          NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_comments_articles
        FOREIGN KEY `comments` (`article_id`)
            REFERENCES `articles` (`id`),

    CONSTRAINT fk_comments_users
        FOREIGN KEY `comments` (`user_id`)
            REFERENCES `users` (`id`)
);

CREATE TABLE `likes`
(
    `id`         INT AUTO_INCREMENT,
    `article_id` INT,
    `comment_id` INT,
    `user_id`    INT NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_likes_articles
        FOREIGN KEY `likes` (`article_id`)
            REFERENCES `articles` (`id`),

    CONSTRAINT fk_likes_comments
        FOREIGN KEY `likes` (`comment_id`)
            REFERENCES `comments` (`id`),

    CONSTRAINT fk_likes_users
        FOREIGN KEY `likes` (`user_id`)
            REFERENCES `users` (`id`)
);