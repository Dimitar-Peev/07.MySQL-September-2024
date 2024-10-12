USE `07_softuni_imdb`;

DROP FUNCTION IF EXISTS udf_actor_history_movies_count;

DELIMITER ~
--
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE movies_count INT;
    SET movies_count := (SELECT COUNT(g.`name`) `movies`
                         FROM `actors` a
                                  INNER JOIN `movies_actors` AS ma
                                             ON a.`id` = ma.`actor_id`
                                  INNER JOIN `genres_movies` AS gm
                                             USING (`movie_id`)
                                  INNER JOIN `genres` AS g
                                             ON g.`id` = gm.`genre_id`
                         WHERE CONCAT(a.`first_name`, ' ', a.`last_name`) = full_name
                           AND g.`name` = 'History');
    RETURN movies_count;
END
--
~
SELECT udf_actor_history_movies_count('Stephan Lundberg') AS 'history_movies';

SELECT udf_actor_history_movies_count('Jared Di Batista') AS 'history_movies';