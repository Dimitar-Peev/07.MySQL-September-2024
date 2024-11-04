USE `03_real_estate_db`;
--
DROP PROCEDURE IF EXISTS udp_special_offer;

DELIMITER ~
--
CREATE PROCEDURE udp_special_offer(p_first_name VARCHAR(50))
BEGIN
    UPDATE `property_offers` AS po
        INNER JOIN `agents` AS a
        ON a.`id` = po.`agent_id`
    SET po.`price` = po.`price` * 0.9
    WHERE a.`first_name` = p_first_name;
END
--
~
CALL udp_special_offer('Hans');

SELECT a.`first_name`, po.`price`
FROM `property_offers` AS po
         INNER JOIN `agents` a
                    ON a.`id` = po.`agent_id`
WHERE `first_name` = 'Hans';