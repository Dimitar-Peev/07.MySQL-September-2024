CREATE DATABASE `soft_uni`;

USE `soft_uni`;

CREATE TABLE `towns`
(
    `id`   INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255)       NOT NULL,

    CONSTRAINT pk_towns
        PRIMARY KEY (`id`)
);

CREATE TABLE `addresses`
(
    `id`           INT AUTO_INCREMENT NOT NULL,
    `address_text` VARCHAR(255)       NOT NULL,
    `town_id`      INT                NOT NULL,

    CONSTRAINT pk_addresses
        PRIMARY KEY (`id`),

    CONSTRAINT fk_addresses_town
        FOREIGN KEY (`town_id`)
            REFERENCES `towns` (`id`)
);

CREATE TABLE `departments`
(
    `id`   INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255)       NOT NULL,

    CONSTRAINT pk_departments
        PRIMARY KEY (`id`)
);

CREATE TABLE `employees`
(
    `id`            INT AUTO_INCREMENT NOT NULL,
    `first_name`    VARCHAR(255)       NOT NULL,
    `middle_name`   VARCHAR(255)       NOT NULL,
    `last_name`     VARCHAR(255)       NOT NULL,
    `job_title`     VARCHAR(255)       NOT NULL,
    `department_id` INT                NOT NULL,
    `hire_date`     DATE,
    `salary`        DECIMAL(10, 2),
    `address_id`    INT,

    CONSTRAINT pk_employees
        PRIMARY KEY (`id`),

    CONSTRAINT fk_employees_departments
        FOREIGN KEY (`department_id`)
            REFERENCES `departments` (`id`),

    CONSTRAINT fk_employees_addresses
        FOREIGN KEY (`address_id`)
            REFERENCES `addresses` (`id`)
);
--
INSERT INTO `towns` (`name`)
VALUES ('Sofia'),
       ('Plovdiv'),
       ('Varna'),
       ('Burgas');

INSERT INTO `departments` (`name`)
VALUES ('Engineering'),
       ('Sales'),
       ('Marketing'),
       ('Software Development'),
       ('Quality Assurance');

INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES ('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
       ('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
       ('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
       ('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
       ('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);