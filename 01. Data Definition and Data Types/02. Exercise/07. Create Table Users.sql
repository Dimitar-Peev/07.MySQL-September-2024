USE `exercise`;
--
CREATE TABLE `users`
(
    `id`              INT AUTO_INCREMENT,
    `username`        VARCHAR(30) NOT NULL,
    `password`        VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` TIME,
    `is_deleted`      BOOLEAN,
    PRIMARY KEY (`id`)
);

INSERT INTO `users` (`username`, `password`)
VALUES ('Petar', 'password1'),
       ('Georgi', 'password2'),
       ('Ivan', 'password3'),
       ('Dimitar', 'password4'),
       ('Stefan', 'password5');
