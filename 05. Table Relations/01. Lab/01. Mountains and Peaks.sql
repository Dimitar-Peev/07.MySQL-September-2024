USE `camp`;
--
CREATE TABLE `mountains`
(
    `id`   INT AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `peaks`
(
    `id`          INT AUTO_INCREMENT,
    `name`        VARCHAR(50) NOT NULL,
    `mountain_id` INT         NOT NULL,
    PRIMARY KEY (`id`),

    CONSTRAINT fk_peaks_mountains
        FOREIGN KEY (`mountain_id`)
            REFERENCES `mountains` (`id`)
);
