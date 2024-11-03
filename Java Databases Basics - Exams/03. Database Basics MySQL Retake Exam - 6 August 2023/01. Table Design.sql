DROP DATABASE IF EXISTS `03_real_estate_db`;
CREATE DATABASE `03_real_estate_db`;
USE `03_real_estate_db`;

CREATE TABLE `cities`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(60) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `property_types`
(
    `id`          INT AUTO_INCREMENT,
    `type`        VARCHAR(40) UNIQUE NOT NULL,
    `description` TEXT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `properties`
(
    `id`               INT AUTO_INCREMENT,
    `address`          VARCHAR(80) UNIQUE NOT NULL,
    `price`            DECIMAL(19, 2)     NOT NULL,
    `area`             DECIMAL(19, 2),
    `property_type_id` INT,
    `city_id`          INT,
    PRIMARY KEY (`id`)
);

ALTER TABLE `properties`
    ADD CONSTRAINT fk_properties_property_types
        FOREIGN KEY `properties` (`property_type_id`)
            REFERENCES `property_types` (`id`);

ALTER TABLE `properties`
    ADD CONSTRAINT fk_properties_property_cities
        FOREIGN KEY `properties` (`city_id`)
            REFERENCES `cities` (`id`);

CREATE TABLE `agents`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(40)        NOT NULL,
    `last_name`  VARCHAR(40)        NOT NULL,
    `phone`      VARCHAR(20) UNIQUE NOT NULL,
    `email`      VARCHAR(50) UNIQUE NOT NULL,
    `city_id`    INT,
    PRIMARY KEY (`id`)
);

ALTER TABLE `agents`
    ADD CONSTRAINT fk_agents_cities
        FOREIGN KEY (`city_id`)
            REFERENCES `cities` (`id`);

CREATE TABLE `buyers`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(40)        NOT NULL,
    `last_name`  VARCHAR(40)        NOT NULL,
    `phone`      VARCHAR(20) UNIQUE NOT NULL,
    `email`      VARCHAR(50) UNIQUE NOT NULL,
    `city_id`    INT,
    PRIMARY KEY (`id`)
);

ALTER TABLE `buyers`
    ADD CONSTRAINT fk_buyers_cities
        FOREIGN KEY `buyers` (`city_id`)
            REFERENCES `cities` (`id`);

CREATE TABLE `property_offers`
(
    `property_id`    INT            NOT NULL,
    `agent_id`       INT            NOT NULL,
    `price`          DECIMAL(19, 2) NOT NULL,
    `offer_datetime` DATETIME,

    CONSTRAINT fk_property_offers_properties
        FOREIGN KEY `property_offers` (`property_id`)
            REFERENCES `properties` (`id`),

    CONSTRAINT fk_property_offers_agents
        FOREIGN KEY `property_offers` (`agent_id`)
            REFERENCES `agents` (`id`)
);


CREATE TABLE `property_transactions`
(
    `id`               INT AUTO_INCREMENT,
    `property_id`      INT NOT NULL,
    `buyer_id`         INT NOT NULL,
    `transaction_date` DATE,
    `bank_name`        VARCHAR(30),
    `iban`             VARCHAR(40) UNIQUE,
    `is_successful`    BOOLEAN,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_property_transactions_properties
        FOREIGN KEY `property_transactions` (`property_id`)
            REFERENCES `properties` (`id`),

    CONSTRAINT fk_property_transactions_buyers
        FOREIGN KEY `property_transactions` (`buyer_id`)
            REFERENCES `buyers` (`id`)
);