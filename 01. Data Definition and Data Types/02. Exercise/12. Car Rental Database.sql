CREATE DATABASE `car_rental`;
--
CREATE TABLE `categories`
(
    `id`           INT AUTO_INCREMENT,
    `category`     VARCHAR(255) NOT NULL,
    `daily_rate`   DOUBLE,
    `weekly_rate`  DOUBLE,
    `monthly_rate` DOUBLE,
    `weekend_rate` DOUBLE,
    PRIMARY KEY (`id`)
);

CREATE TABLE `cars`
(
    `id`            INT AUTO_INCREMENT,
    `plate_number`  VARCHAR(20),
    `make`          VARCHAR(20),
    `model`         VARCHAR(20),
    `car_year`      INT,
    `category_id`   INT,
    `doors`         INT,
    `picture`       BLOB,
    `car_condition` VARCHAR(30),
    `available`     BOOLEAN,
    PRIMARY KEY (`id`)
);

CREATE TABLE `employees`
(
    `id`         INT AUTO_INCREMENT,
    `first_name` VARCHAR(50),
    `last_name`  VARCHAR(50),
    `title`      VARCHAR(50),
    `notes`      TEXT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `customers`
(
    `id`                    INT AUTO_INCREMENT,
    `driver_license_number` INT UNIQUE,
    `full_name`             VARCHAR(255),
    `address`               VARCHAR(255),
    `city`                  VARCHAR(255),
    `zip_code`              INT,
    `notes`                 TEXT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `rental_orders`
(
    `id`                INT AUTO_INCREMENT,
    `employee_id`       INT,
    `customer_id`       INT,
    `car_id`            INT,
    `car_condition`     VARCHAR(50),
    `tank_level`        VARCHAR(20),
    `kilometrage_start` INT,
    `kilometrage_end`   INT,
    `total_kilometrage` INT,
    `start_date`        DATE,
    `end_date`          DATE,
    `total_days`        INT,
    `rate_applied`      DOUBLE,
    `tax_rate`          DOUBLE,
    `order_status`      VARCHAR(20),
    `notes`             TEXT,
    PRIMARY KEY (`id`)
);

INSERT INTO `categories` (`category`)
VALUES ('CategoryName1'),
       ('CategoryName2'),
       ('CategoryName3');

INSERT INTO `cars` (`plate_number`)
VALUES ('CT 1111 AP'),
       ('CT 2222 AP'),
       ('CT 3333 AP');

INSERT INTO `employees` (`first_name`, `last_name`)
VALUES ('Dimitar', 'Dimitrov'),
       ('Ivan', 'Ivanov'),
       ('Georgi', 'Georgiev');

INSERT INTO `customers` (`driver_license_number`, `full_name`)
VALUES (111111, 'TestName1'),
       (222222, 'TestName2'),
       (333333, 'TestName3');

INSERT INTO `rental_orders` (`employee_id`, `customer_id`)
VALUES (12, 234),
       (23, 345),
       (34, 123);