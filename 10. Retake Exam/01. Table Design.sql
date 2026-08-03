DROP DATABASE IF EXISTS `foods_friends`;
CREATE DATABASE `foods_friends`;
USE `foods_friends`;
--
CREATE TABLE `restaurants`
(
    `id`       INT AUTO_INCREMENT,
    `name`     VARCHAR(40) NOT NULL UNIQUE,
    `type`     VARCHAR(20) NOT NULL,
    `non_stop` BOOLEAN     NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `offerings`
(
    `id`            INT AUTO_INCREMENT,
    `name`          VARCHAR(40)    NOT NULL UNIQUE,
    `price`         DECIMAL(19, 2) NOT NULL,
    `vegan`         BOOLEAN        NOT NULL,
    `restaurant_id` INT            NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_offerings_restaurants
        FOREIGN KEY `offerings` (`restaurant_id`)
            REFERENCES `restaurants` (`id`)
);

CREATE TABLE `customers`
(
    `id`           INT AUTO_INCREMENT,
    `first_name`   VARCHAR(40) NOT NULL,
    `last_name`    VARCHAR(40) NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL UNIQUE,
    `regular`      BOOLEAN     NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT UNIQUE (`first_name`, `last_name`)
);

CREATE TABLE `orders`
(
    `id`            INT AUTO_INCREMENT,
    `number`        VARCHAR(10) NOT NULL UNIQUE,
    `priority`      VARCHAR(10) NOT NULL,
    `customer_id`   INT         NOT NULL,
    `restaurant_id` INT         NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_orders_customers
        FOREIGN KEY `orders` (`customer_id`)
            REFERENCES `customers` (`id`),

    CONSTRAINT fk_orders_restaurants
        FOREIGN KEY `orders` (`restaurant_id`)
            REFERENCES `restaurants` (`id`)
);

CREATE TABLE `orders_offerings`
(
    `order_id`      INT NOT NULL,
    `offering_id`   INT NOT NULL,
    `restaurant_id` INT NOT NULL,

    PRIMARY KEY (`order_id`, `offering_id`),

    CONSTRAINT fk_orders_offerings_orders
        FOREIGN KEY `orders_offerings` (`order_id`)
            REFERENCES `orders` (`id`),

    CONSTRAINT fk_orders_offerings_offerings
        FOREIGN KEY `orders_offerings` (`offering_id`)
            REFERENCES `offerings` (`id`),

    CONSTRAINT fk_orders_offerings_restaurants
        FOREIGN KEY `orders_offerings` (`restaurant_id`)
            REFERENCES `restaurants` (`id`)
);