DROP DATABASE IF EXISTS `08_online_store`;
CREATE DATABASE `08_online_store`;
USE `08_online_store`;

CREATE TABLE `brands`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(40) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `categories`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(40) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `reviews`
(
    `id`           INT AUTO_INCREMENT,
    `content`      TEXT,
    `rating`       DECIMAL(10, 2) NOT NULL,
    `picture_url`  VARCHAR(80)    NOT NULL,
    `published_at` DATETIME       NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `products`
(
    `id`                INT AUTO_INCREMENT,
    `name`              VARCHAR(40)    NOT NULL,
    `price`             DECIMAL(19, 2) NOT NULL,
    `quantity_in_stock` INT,
    `description`       TEXT,
    `brand_id`          INT            NOT NULL,
    `category_id`       INT            NOT NULL,
    `review_id`         INT,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_products_brands
        FOREIGN KEY (`brand_id`)
            REFERENCES `brands` (`id`),

    CONSTRAINT fk_products_categories
        FOREIGN KEY (`category_id`)
            REFERENCES `categories` (`id`),

    CONSTRAINT fk_products_reviews
        FOREIGN KEY (`review_id`)
            REFERENCES `reviews` (`id`)
);

CREATE TABLE `customers`
(
    `id`            INT AUTO_INCREMENT,
    `first_name`    VARCHAR(20)        NOT NULL,
    `last_name`     VARCHAR(20)        NOT NULL,
    `phone`         VARCHAR(30) UNIQUE NOT NULL,
    `address`       VARCHAR(60)        NOT NULL,
    `discount_card` BIT(1)             NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`id`)
);

CREATE TABLE `orders`
(
    `id`             INT AUTO_INCREMENT,
    `order_datetime` DATETIME NOT NULL,
    `customer_id`    INT      NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_orders_customers
        FOREIGN KEY (`customer_id`)
            REFERENCES `customers` (`id`)
);

CREATE TABLE `orders_products`
(
    `order_id`   INT,
    `product_id` INT,

    CONSTRAINT fk_orders_products_orders
        FOREIGN KEY (`order_id`)
            REFERENCES `orders` (`id`),

    CONSTRAINT fk_orders_products_products
        FOREIGN KEY (`product_id`)
            REFERENCES `products` (`id`)
);