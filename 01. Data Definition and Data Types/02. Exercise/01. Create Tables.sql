USE `minions`;
--
CREATE TABLE `minions`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(255),
    `age`  INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `towns`
(
    `town_id` INT AUTO_INCREMENT,
    `name`    VARCHAR(255) NOT NULL,
    PRIMARY KEY (`town_id`)
);