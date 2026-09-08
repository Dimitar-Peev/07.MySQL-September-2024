DROP DATABASE IF EXISTS `19_report_service`;

CREATE DATABASE `19_report_service`;

USE `19_report_service`;
--
CREATE TABLE `users`
(
    `id`        INT UNSIGNED AUTO_INCREMENT,
    `username`  VARCHAR(30) UNIQUE NOT NULL,
    `password`  VARCHAR(50)        NOT NULL,
    `name`      VARCHAR(50),
    `gender`    VARCHAR(1),
    `birthdate` DATETIME,
    `age`       INT UNSIGNED,
    `email`     VARCHAR(50)        NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `departments`
(
    `id`   INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `employees`
(
    `id`            INT UNSIGNED AUTO_INCREMENT,
    `first_name`    VARCHAR(25),
    `last_name`     VARCHAR(25),
    `gender`        VARCHAR(1),
    `birthdate`     DATETIME,
    `age`           INT UNSIGNED,
    `department_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_employees_departments
        FOREIGN KEY (`department_id`)
            REFERENCES `departments` (`id`)
);

CREATE TABLE `categories`
(
    `id`            INT UNSIGNED AUTO_INCREMENT,
    `name`          VARCHAR(50) NOT NULL,
    `department_id` INT UNSIGNED,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_categories_departments
        FOREIGN KEY (`department_id`)
            REFERENCES `departments` (`id`)
);

CREATE TABLE `status`
(
    `id`    INT UNSIGNED AUTO_INCREMENT,
    `label` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `reports`
(
    `id`          INT UNSIGNED AUTO_INCREMENT,
    `category_id` INT UNSIGNED NOT NULL,
    `status_id`   INT UNSIGNED NOT NULL,
    `open_date`   DATETIME     NOT NULL,
    `close_date`  DATETIME,
    `description` VARCHAR(200),
    `user_id`     INT UNSIGNED NOT NULL,
    `employee_id` INT UNSIGNED,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_reports_categories
        FOREIGN KEY (`category_id`)
            REFERENCES `categories` (`id`),

    CONSTRAINT fk_reports_status
        FOREIGN KEY (`status_id`)
            REFERENCES `status` (`id`),

    CONSTRAINT fk_reports_users
        FOREIGN KEY (`user_id`)
            REFERENCES `users` (`id`),

    CONSTRAINT fk_reports_employees
        FOREIGN KEY (`employee_id`)
            REFERENCES `employees` (`id`)
);
