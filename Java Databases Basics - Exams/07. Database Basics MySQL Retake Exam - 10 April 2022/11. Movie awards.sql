USE `07_softuni_imdb`;

DROP PROCEDURE IF EXISTS udp_award_movie;

DELIMITER ~
--
CREATE PROCEDURE udp_award_movie(movie_title VARCHAR(50))
BEGIN
    UPDATE `actors` AS a
        INNER JOIN `movies_actors` AS ma
                   ON a.`id` = ma.`actor_id`
        INNER JOIN `movies` AS m
                   ON m.`id` = ma.`movie_id`
    SET a.`awards` = a.`awards` + 1
    WHERE m.`title` = movie_title;
END
--
~
CALL udp_award_movie('Tea For Two');
