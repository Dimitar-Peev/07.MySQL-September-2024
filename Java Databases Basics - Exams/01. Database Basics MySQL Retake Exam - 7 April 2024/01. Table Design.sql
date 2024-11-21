DROP DATABASE IF EXISTS `01_go_roadie`;
CREATE DATABASE `01_go_roadie`;
USE `01_go_roadie`;
--
CREATE TABLE `cities`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(40) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `cars`
(
    `id`    INT AUTO_INCREMENT,
    `brand` VARCHAR(20)        NOT NULL,
    `model` VARCHAR(20) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `instructors`
(
    `id`                 INT AUTO_INCREMENT,
    `first_name`         VARCHAR(40)        NOT NULL,
    `last_name`          VARCHAR(40) UNIQUE NOT NULL,
    `has_a_license_from` DATE               NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `driving_schools`
(
    `id`                   INT AUTO_INCREMENT,
    `name`                 VARCHAR(40) UNIQUE NOT NULL,
    `night_time_driving`   BOOLEAN            NOT NULL,
    `average_lesson_price` DECIMAL(10, 2),
    `car_id`               INT                NOT NULL,
    `city_id`              INT                NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_driving_schools_cars
        FOREIGN KEY (`car_id`)
            REFERENCES `cars` (`id`),

    CONSTRAINT fk_driving_schools_cities
        FOREIGN KEY (`city_id`)
            REFERENCES `cities` (`id`)
);

CREATE TABLE `students`
(
    `id`           INT AUTO_INCREMENT,
    `first_name`   VARCHAR(40)        NOT NULL,
    `last_name`    VARCHAR(40) UNIQUE NOT NULL,
    `age`          INT,
    `phone_number` VARCHAR(20) UNIQUE,
    PRIMARY KEY (`id`)
);

CREATE TABLE `instructors_driving_schools`
(
    `instructor_id`     INT,
    `driving_school_id` INT NOT NULL,

    CONSTRAINT fk_instructors_driving_schools_instructors
        FOREIGN KEY (`instructor_id`)
            REFERENCES `instructors` (`id`),

    CONSTRAINT fk_instructors_driving_schools_driving_schools
        FOREIGN KEY (`driving_school_id`)
            REFERENCES `driving_schools` (`id`)
);

CREATE TABLE `instructors_students`
(
    `instructor_id` INT NOT NULL,
    `student_id`    INT NOT NULL,

    CONSTRAINT fk_instructors_students_instructors
        FOREIGN KEY (`instructor_id`)
            REFERENCES `instructors` (`id`),

    CONSTRAINT fk_instructors_students_students
        FOREIGN KEY (`student_id`)
            REFERENCES `students` (`id`)
);