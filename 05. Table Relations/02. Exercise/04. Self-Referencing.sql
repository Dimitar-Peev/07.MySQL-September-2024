USE `table_relations`;
--
CREATE TABLE `teachers`
(
    `teacher_id` INT AUTO_INCREMENT,
    `name`       VARCHAR(20) NOT NULL,
    `manager_id` INT DEFAULT NULL,
    PRIMARY KEY (`teacher_id`)
);

ALTER TABLE `teachers`
    AUTO_INCREMENT = 101;

INSERT INTO `teachers` (`name`)
VALUES ('John');

INSERT INTO `teachers` (`name`, `manager_id`)
VALUES ('Maya', 106),
       ('Silvia', 106),
       ('Ted', 105),
       ('Mark', 101),
       ('Greta', 101);

ALTER TABLE `teachers`
    ADD CONSTRAINT fk_teacher_manager
        FOREIGN KEY (`manager_id`)
            REFERENCES `teachers` (`teacher_id`);