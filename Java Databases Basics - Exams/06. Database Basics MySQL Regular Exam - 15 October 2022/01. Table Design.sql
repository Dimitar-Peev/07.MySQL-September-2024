DROP DATABASE IF EXISTS `06_restaurant_db`;
CREATE DATABASE `06_restaurant_db`;
USE `06_restaurant_db`;
--
CREATE TABLE `products`
(
    `id`    INT AUTO_INCREMENT,
    `name`  VARCHAR(30) UNIQUE NOT NULL,
    `type`  VARCHAR(30)        NOT NULL,
    `price` DECIMAL(10, 2)     NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `clients`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name`  VARCHAR(50) NOT NULL,
    `birthdate`  DATE        NOT NULL,
    `card`       VARCHAR(50),
    `review`     TEXT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `tables`
(
    `id`       INT AUTO_INCREMENT,
    `floor`    INT NOT NULL,
    `reserved` BOOLEAN,
    `capacity` INT NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `waiters`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name`  VARCHAR(50) NOT NULL,
    `email`      VARCHAR(50) NOT NULL,
    `phone`      VARCHAR(50),
    `salary`     DECIMAL(10, 2),
    PRIMARY KEY (`id`)
);

CREATE TABLE `orders`
(
    `id`           INT AUTO_INCREMENT,
    `table_id`     INT  NOT NULL,
    `waiter_id`    INT  NOT NULL,
    `order_time`   TIME NOT NULL,
    `payed_status` BOOLEAN,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_orders_tables
        FOREIGN KEY `orders` (`table_id`)
            REFERENCES `tables` (`id`),

    CONSTRAINT fk_orders_waiters
        FOREIGN KEY `orders` (`waiter_id`)
            REFERENCES `waiters` (`id`)
);

CREATE TABLE `orders_clients`
(
    `order_id`  INT,
    `client_id` INT,

    CONSTRAINT fk_orders_clients_orders
        FOREIGN KEY `orders_clients` (`order_id`)
            REFERENCES `orders` (`id`),

    CONSTRAINT fk_orders_clients_clients
        FOREIGN KEY `orders_clients` (`client_id`)
            REFERENCES `clients` (`id`)
);

CREATE TABLE `orders_products`
(
    `order_id`   INT,
    `product_id` INT,

    CONSTRAINT fk_orders_products_orders
        FOREIGN KEY `orders_products` (`order_id`)
            REFERENCES `orders` (`id`),

    CONSTRAINT fk_orders_products_products
        FOREIGN KEY `orders_products` (`product_id`)
            REFERENCES `products` (`id`)
);