CREATE DATABASE `online_store`;

USE `online_store`;
--
CREATE TABLE `items`
(
    `item_id`      INT(11) AUTO_INCREMENT,
    `name`         VARCHAR(50),
    `item_type_id` INT(11),
    PRIMARY KEY (`item_id`)
);

CREATE TABLE `item_types`
(
    `item_type_id` INT(11) AUTO_INCREMENT,
    `name`         VARCHAR(50),
    PRIMARY KEY (`item_type_id`)
);

ALTER TABLE `items`
    ADD CONSTRAINT fk_items_item_type
        FOREIGN KEY (`item_type_id`)
            REFERENCES `item_types` (`item_type_id`);


CREATE TABLE `customers`
(
    `customer_id` INT(11) AUTO_INCREMENT,
    `name`        VARCHAR(50),
    `birthday`    DATE,
    `city_id`     INT(11),
    PRIMARY KEY (`customer_id`)
);


CREATE TABLE `cities`
(
    `city_id` INT(11) AUTO_INCREMENT,
    `name`    VARCHAR(50),
    PRIMARY KEY (`city_id`)
);

ALTER TABLE `customers`
    ADD CONSTRAINT fk_customers_cities
        FOREIGN KEY (`city_id`)
            REFERENCES `cities` (`city_id`);

CREATE TABLE `orders`
(
    `order_id`    INT(11) AUTO_INCREMENT,
    `customer_id` INT(11),
    PRIMARY KEY (`order_id`)
);

ALTER TABLE `orders`
    ADD CONSTRAINT fk_orders_customers
        FOREIGN KEY (`customer_id`)
            REFERENCES `customers` (`customer_id`);



CREATE TABLE `order_items`
(
    `item_id`  INT(11) NOT NULL,
    `order_id` INT(11) NOT NULL,
    PRIMARY KEY (`order_id`, `item_id`)
);

ALTER TABLE `order_items`
    ADD CONSTRAINT fk_order_orders
        FOREIGN KEY (`order_id`)
            REFERENCES `orders` (`order_id`);

ALTER TABLE `order_items`
    ADD CONSTRAINT fk_order_items
        FOREIGN KEY (`item_id`)
            REFERENCES `items` (`item_id`);