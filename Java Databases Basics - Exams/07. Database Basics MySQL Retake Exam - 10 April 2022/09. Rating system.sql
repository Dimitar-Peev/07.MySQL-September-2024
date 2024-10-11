USE `07_softuni_imdb`;
--
SELECT m.`title`,
       (CASE
            WHEN mai.`rating` <= 4 THEN 'poor'
            WHEN mai.`rating` > 4 AND mai.`rating` <= 7 THEN 'good'
            ELSE 'excellent'
       END)             AS 'rating',
       (CASE
            WHEN mai.`has_subtitles` IS TRUE THEN 'english'
            ELSE '-'
       END)             AS 'subtitles',
       mai.`budget`
FROM `movies` AS m
         INNER JOIN `movies_additional_info` AS mai
                    ON m.`movie_info_id` = mai.`id`
ORDER BY mai.`budget` DESC;