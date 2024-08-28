CREATE DATABASE `movies`;
--
CREATE TABLE `directors`
(
    `id`            INT AUTO_INCREMENT,
    `director_name` VARCHAR(255) NOT NULL,
    `notes`         TEXT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `genres`
(
    `id`         INT AUTO_INCREMENT,
    `genre_name` VARCHAR(255) NOT NULL,
    `notes`      TEXT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `categories`
(
    `id`            INT AUTO_INCREMENT,
    `category_name` VARCHAR(255) NOT NULL,
    `notes`         TEXT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `movies`
(
    `id`             INT AUTO_INCREMENT,
    `title`          VARCHAR(255) NOT NULL,
    `director_id`    INT,
    `copyright_year` YEAR,
    `length`         TIME,
    `genre_id`       INT,
    `category_id`    INT,
    `rating`         DOUBLE(10, 2),
    `notes`          TEXT,
    PRIMARY KEY (`id`)
);

INSERT INTO `directors`(`director_name`, `notes`)
VALUES ('DirectorName1', 'TestNotes1'),
       ('DirectorName2', 'TestNotes2'),
       ('DirectorName3', 'TestNotes3'),
       ('DirectorName4', 'TestNotes4'),
       ('DirectorName5', 'TestNotes5');

INSERT INTO `genres`(`genre_name`, `notes`)
VALUES ('GenreName1', 'TestNotes1'),
       ('GenreName2', 'TestNotes2'),
       ('GenreName3', 'TestNotes3'),
       ('GenreName4', 'TestNotes4'),
       ('GenreName5', 'TestNotes5');

INSERT INTO `categories`(`category_name`, `notes`)
VALUES ('CategoryName1', 'TestNotes1'),
       ('CategoryName2', 'TestNotes2'),
       ('CategoryName3', 'TestNotes3'),
       ('CategoryName4', 'TestNotes4'),
       ('CategoryName5', 'TestNotes5');

INSERT INTO `movies` (`title`)
VALUES ('TitleMovie1'),
       ('TitleMovie2'),
       ('TitleMovie3'),
       ('TitleMovie4'),
       ('TitleMovie5');