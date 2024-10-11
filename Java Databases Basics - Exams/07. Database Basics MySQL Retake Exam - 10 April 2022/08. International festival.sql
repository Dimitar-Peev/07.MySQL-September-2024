USE `07_softuni_imdb`;
--
SELECT c.`name`,
       COUNT(m.`id`) AS 'movies_count'
FROM `movies` AS m
         INNER JOIN `countries` AS c
                    ON c.`id` = m.`country_id`
GROUP BY c.`name`
HAVING movies_count >= 7
ORDER BY c.`name` DESC;