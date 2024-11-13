DROP DATABASE IF EXISTS `05_universities_db`;
CREATE DATABASE `05_universities_db`;
USE `05_universities_db`;

CREATE TABLE `countries`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(40) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `cities`
(
    `id`         INT AUTO_INCREMENT,
    `name`       VARCHAR(40) UNIQUE NOT NULL,
    `population` INT,
    `country_id` INT                NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_cities_countries
        FOREIGN KEY `cities` (`country_id`)
            REFERENCES `countries` (`id`)
);

CREATE TABLE `universities`
(
    `id`              INT AUTO_INCREMENT,
    `name`            VARCHAR(60) UNIQUE NOT NULL,
    `address`         VARCHAR(80) UNIQUE NOT NULL,
    `tuition_fee`     DECIMAL(19, 2)     NOT NULL,
    `number_of_staff` INT,
    `city_id`         INT,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_universities_cities
        FOREIGN KEY `universities` (`city_id`)
            REFERENCES `cities` (`id`)
);

CREATE TABLE `students`
(
    `id`           INT AUTO_INCREMENT,
    `first_name`   VARCHAR(40)         NOT NULL,
    `last_name`    VARCHAR(40)         NOT NULL,
    `age`          INT,
    `phone`        VARCHAR(20) UNIQUE  NOT NULL,
    `email`        VARCHAR(255) UNIQUE NOT NULL,
    `is_graduated` BOOLEAN             NOT NULL,
    `city_id`      INT,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_students_cities
        FOREIGN KEY `students` (`city_id`)
            REFERENCES `cities` (`id`)
);

CREATE TABLE `courses`
(
    `id`             INT AUTO_INCREMENT,
    `name`           VARCHAR(40) UNIQUE NOT NULL,
    `duration_hours` DECIMAL(19, 2),
    `start_date`     DATE,
    `teacher_name`   VARCHAR(60) UNIQUE NOT NULL,
    `description`    TEXT,
    `university_id`  INT,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_courses_universities
        FOREIGN KEY `courses` (`university_id`)
            REFERENCES `universities` (`id`)
);


CREATE TABLE `students_courses`
(
    `grade`      DECIMAL(19, 2) NOT NULL,
    `student_id` INT            NOT NULL,
    `course_id`  INT            NOT NULL,

    CONSTRAINT fk_students_courses_students
        FOREIGN KEY `students_courses` (`student_id`)
            REFERENCES `students` (`id`),

    CONSTRAINT fk_students_courses_courses
        FOREIGN KEY `students_courses` (`course_id`)
            REFERENCES `courses` (`id`)
);