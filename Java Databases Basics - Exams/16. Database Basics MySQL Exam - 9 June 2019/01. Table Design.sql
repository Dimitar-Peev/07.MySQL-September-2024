DROP DATABASE IF EXISTS `16_ruk_database`;
CREATE DATABASE `16_ruk_database`;
USE `16_ruk_database`;
--
CREATE TABLE `branches`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(30) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `employees`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(20)    NOT NULL,
    `last_name`  VARCHAR(20)    NOT NULL,
    `salary`     DECIMAL(10, 2) NOT NULL,
    `started_on` DATE           NOT NULL,
    `branch_id`  INT            NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_employees_branches
        FOREIGN KEY `employees` (`branch_id`)
            REFERENCES `branches` (`id`)
);

CREATE TABLE `clients`
(
    `id`        INT AUTO_INCREMENT,
    `full_name` VARCHAR(50) NOT NULL,
    `age`       INT         NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `employees_clients`
(
    `employee_id` INT,
    `client_id`   INT,

    CONSTRAINT fk_employees_clients_employees
        FOREIGN KEY `employees_clients` (`employee_id`)
            REFERENCES `employees` (`id`),

    CONSTRAINT fk_employees_clients_clients
        FOREIGN KEY `employees_clients` (`client_id`)
            REFERENCES `clients` (`id`)
);

CREATE TABLE `bank_accounts`
(
    `id`             INT AUTO_INCREMENT,
    `account_number` VARCHAR(10)    NOT NULL,
    `balance`        DECIMAL(10, 2) NOT NULL,
    `client_id`      INT UNIQUE     NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_bank_accounts_clients
        FOREIGN KEY `bank_accounts` (`client_id`)
            REFERENCES `clients` (`id`)
);

CREATE TABLE `cards`
(
    `id`              INT AUTO_INCREMENT,
    `card_number`     VARCHAR(19) NOT NULL,
    `card_status`     VARCHAR(7)  NOT NULL,
    `bank_account_id` INT         NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_cards_bank_accounts
        FOREIGN KEY `cards` (`bank_account_id`)
            REFERENCES `bank_accounts` (`id`)
);