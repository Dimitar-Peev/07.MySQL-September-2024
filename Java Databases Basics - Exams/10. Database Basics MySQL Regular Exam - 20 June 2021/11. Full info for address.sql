USE `10_stc`;

DROP PROCEDURE IF EXISTS udp_courses_by_address;

DELIMITER ~
--
CREATE PROCEDURE udp_courses_by_address(p_address_name VARCHAR(100))
BEGIN
    SELECT a.`name`,
           cl.`full_name` AS 'full_names',
           (CASE
                WHEN c.`bill` <= 20 THEN 'Low'
                WHEN c.`bill` <= 30 THEN 'Medium'
                ELSE 'High'
           END)          AS 'level_of_bill',
           ca.`make`,
           ca.`condition`,
           cat.`name`    AS 'cat_name'
    FROM `addresses` AS a
             INNER JOIN `courses` AS c
                        ON a.`id` = c.`from_address_id`
             INNER JOIN `clients` AS cl
                        ON cl.`id` = c.`client_id`
             INNER JOIN cars AS ca
                        ON ca.`id` = c.`car_id`
             INNER JOIN `categories` AS cat
                        ON cat.`id` = ca.`category_id`
    WHERE a.`name` = p_address_name
    ORDER BY ca.`make`, cl.`full_name`;
END
--
~
CALL udp_courses_by_address('700 Monterey Avenue');

CALL udp_courses_by_address('66 Thompson Drive');
