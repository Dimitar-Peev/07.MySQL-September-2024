USE `18_buhtig`;
--
DROP PROCEDURE IF EXISTS udp_findbyextension;

DELIMITER ~
--
CREATE PROCEDURE udp_findbyextension(extension VARCHAR(50))
BEGIN
    SELECT `id`,
           `name`               AS 'caption',
           CONCAT(`size`, 'KB') AS 'size'
    FROM `files`
    WHERE `name` LIKE CONCAT('%', extension)
    ORDER BY `id`;
END
--
~
CALL udp_findbyextension('html');

CALL udp_findbyextension('txt');

CALL udp_findbyextension('php');