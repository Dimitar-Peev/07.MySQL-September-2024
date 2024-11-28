USE `11_softuni_stores_system`;
--
/*
6.	Products with old pictures
A photographer wants to take pictures of products that have old pictures. You must select all of the products that have a description more than 100 characters long description, and a picture that is made before 2019 (exclusive) and the product price being more than 20. Select a short description column that consists of first 10 characters of the picture's description plus '…'. Order the results by product price in descending order.
Required Columns
•	name (product)
•	price
•	best_before
•	short_description
o	only first 10 characters of product description + '...'
•	url
*/

--
SELECT *
FROM `products` AS pr
         INNER JOIN `pictures` AS p
                    ON p.`id` = pr.`picture_id`
WHERE CHAR_LENGTH(`description`) > 100
  AND YEAR(p.`added_on`) < 2019
  AND pr.`price` > 20
ORDER BY pr.`price` DESC;

-- Solution
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