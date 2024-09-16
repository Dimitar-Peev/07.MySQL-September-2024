CREATE DATABASE `table_relations`;
--
USE `table_relations`;
--
CREATE TABLE `people`
(
    `person_id`   INT AUTO_INCREMENT UNIQUE NOT NULL,
    `first_name`  VARCHAR(50)               NOT NULL,
    `salary`      DECIMAL(10, 2)            NOT NULL DEFAULT 0,
    `passport_id` INT UNIQUE                NOT NULL
);

CREATE TABLE `passports`
(
    `passport_id`     INT AUTO_INCREMENT,
    `passport_number` VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY (`passport_id`)
);

ALTER TABLE `passports`
    AUTO_INCREMENT = 101;

ALTER TABLE `people`
    ADD CONSTRAINT pk_people
        PRIMARY KEY (`person_id`);

ALTER TABLE `people`
    ADD CONSTRAINT fk_people_passports
        FOREIGN KEY (`passport_id`)
            REFERENCES `passports` (`passport_id`);

INSERT INTO `passports` (`passport_number`)
VALUES ('N34FG21B'),
       ('K65LO4R7'),
       ('ZE657QP2');

INSERT INTO `people` (`first_name`, `salary`, `passport_id`)
VALUES ('Roberto', 43300.00, 102),
       ('Tom', 56100.00, 103),
       ('Yana', 60200.00, 101);