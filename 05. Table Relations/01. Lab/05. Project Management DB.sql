CREATE DATABASE `project_management_db`;

USE `project_management_db`;

CREATE TABLE `clients`
(
    `id`          INT(11) AUTO_INCREMENT,
    `client_name` VARCHAR(100),
    PRIMARY KEY (`id`)
);

CREATE TABLE `employees`
(
    `id`         INT(11) AUTO_INCREMENT,
    `first_name` VARCHAR(30),
    `last_name`  VARCHAR(30),
    `project_id` INT(11),
    PRIMARY KEY (`id`)
);

CREATE TABLE `projects`
(
    `id`              INT(11) AUTO_INCREMENT,
    `client_id`       INT(11),
    `project_lead_id` INT(11),
    PRIMARY KEY (`id`),

    CONSTRAINT fk_projects_clients
        FOREIGN KEY (`client_id`)
            REFERENCES `clients` (`id`),
    CONSTRAINT fk_projects_employees
        FOREIGN KEY (`project_lead_id`)
            REFERENCES `employees` (`id`)
);

ALTER TABLE `employees`
    ADD CONSTRAINT fk_employees_projects
        FOREIGN KEY (`project_id`)
            REFERENCES `projects` (`id`);