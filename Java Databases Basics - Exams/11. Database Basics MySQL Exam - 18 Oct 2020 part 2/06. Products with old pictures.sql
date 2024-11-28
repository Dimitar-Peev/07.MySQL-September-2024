USE `11_softuni_stores_system`;
--
SELECT pr.`name`                                 AS 'product_name',
       pr.`price`,
       pr.`best_before`,
       CONCAT(LEFT(pr.`description`, 10), '...') AS 'short_description',
       p.`url`
FROM `products` AS pr
         INNER JOIN `pictures` AS p
                    ON p.`id` = pr.`picture_id`
WHERE CHAR_LENGTH(`description`) > 100
  AND YEAR(p.`added_on`) < 2019
  AND pr.`price` > 20
ORDER BY pr.`price` DESC;