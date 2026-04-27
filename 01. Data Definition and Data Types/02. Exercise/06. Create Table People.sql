USE `exercise`;
--
CREATE TABLE `people`
(
    `id`        INT AUTO_INCREMENT,
    `name`      VARCHAR(200)    NOT NULL,
    `picture`   BLOB,
    `height`    DECIMAL(5, 2),
    `weight`    DECIMAL(5, 2),
    `gender`    ENUM ('m', 'f') NOT NULL,
    `birthdate` DATE            NOT NULL,
    `biography` TEXT,
    PRIMARY KEY (`id`)
);

INSERT INTO `people` (`name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`)
VALUES
    ('John Doe', NULL, 1.75, 71.5, 'm', '1990-01-15', 'A short biography of John Doe.'),
    ('Jane Smith', NULL, 1.62, 65.2, 'f', '1985-07-25', 'A short biography of Jane Smith.'),
    ('Bob Johnson', NULL, 1.80, 95.0, 'm', '1982-03-10', 'A short biography of Bob Johnson.'),
    ('Alice Brown', NULL, 1.68, 70.8, 'f', '1995-11-03', 'A short biography of Alice Brown.'),
    ('Charlie Wilson', NULL, 1.88, 77.3, 'm', '1988-09-18', 'A short biography of Charlie Wilson.');