USE `camp`;
--
CREATE TABLE `mountains`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `peaks`
(
    `id`          INT AUTO_INCREMENT,
    `name`        VARCHAR(255) NOT NULL,
    `mountain_id` INT,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_peak_mountain
        FOREIGN KEY (`mountain_id`)
            REFERENCES `mountains` (id)
            ON DELETE CASCADE
);