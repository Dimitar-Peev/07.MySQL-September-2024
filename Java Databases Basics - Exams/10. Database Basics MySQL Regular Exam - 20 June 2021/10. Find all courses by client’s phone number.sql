USE `10_stc`;

DROP FUNCTION IF EXISTS udf_courses_by_client;

DELIMITER ~
--
CREATE FUNCTION udf_courses_by_client(f_phone_num VARCHAR(20))
    RETURNS INTEGER
    DETERMINISTIC
BEGIN
    RETURN (SELECT COUNT(c.`client_id`)
            FROM `courses` AS c
                     INNER JOIN `clients` AS cl
                                ON cl.`id` = c.`client_id`
            WHERE cl.`phone_number` = f_phone_num);
END
--
~
SELECT udf_courses_by_client('(803) 6386812') as `count`;

SELECT udf_courses_by_client('(831) 1391236') as `count`;

SELECT udf_courses_by_client('(704) 2502909') as `count`;
