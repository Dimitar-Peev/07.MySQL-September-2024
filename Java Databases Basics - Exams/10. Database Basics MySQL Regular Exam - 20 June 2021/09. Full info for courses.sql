USE `10_stc`;
--
/*
9.	Full information on courses
The headquarters want us to make a query that shows the complete information about all courses in the database. The information that they need is the address, if the course is made in the Day (between 6 and 20(inclusive both)) or in the Night (between 21 and 5(inclusive both)), the bill of the course, the full name of the client, the car maker, the model and the name of the category.
Order the results by course id.
Required Columns
•	name (address)
•	day_time
•	bill
•	full_name (client)
•	make
•	model
•	category_name (category)
*/

SELECT a.`name`,
       IF(HOUR(co.`start`) BETWEEN 6 AND 20, 'Day', 'Night') AS 'day_time',
       co.`bill`,
       cl.`full_name`,
       c.`make`,
       c.`model`,
       cat.`name`                                            AS 'category_name'
FROM `addresses` AS a
         INNER JOIN `courses` AS co
                    ON co.`from_address_id` = a.`id`
         INNER JOIN `clients` AS cl
                    ON cl.`id` = co.`client_id`
         INNER JOIN `cars` AS c
                    ON c.`id` = co.`car_id`
         INNER JOIN `categories` AS cat
                    ON cat.`id` = c.`category_id`
ORDER BY co.`id`;