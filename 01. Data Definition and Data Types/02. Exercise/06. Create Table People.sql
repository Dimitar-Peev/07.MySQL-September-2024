USE `exercise`;
--
CREATE TABLE `people`
(
    `id`        INT AUTO_INCREMENT,
    `name`      VARCHAR(200)    NOT NULL,
    `picture`   BLOB,
    `height`    DOUBLE(10, 2),
    `weight`    DECIMAL,
    `gender`    ENUM ('m', 'f') NOT NULL,
    `birthdate` DATE            NOT NULL,
    `biography` TEXT,
    PRIMARY KEY (`id`)
);

INSERT INTO `people` (`name`, `gender`, birthdate)
VALUES ('Dimitar', 'm', '1956-10-01'),
       ('Milena', 'f', '2002-01-15'),
       ('Nikolay', 'm', '1968-07-07'),
       ('Petar', 'm', '1998-05-29'),
       ('Anton', 'm', '2008-11-11');