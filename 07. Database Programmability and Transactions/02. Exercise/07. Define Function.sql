USE `soft_uni`;
--
DROP FUNCTION IF EXISTS ufn_is_word_comprised;

DELIMITER ~
--
CREATE FUNCTION ufn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
    RETURNS INT
    -- 0 -> word не е съставена от set_of_letters
    -- 1 -> word е съставена от set_of_letters
    DETERMINISTIC
BEGIN
    RETURN word REGEXP (CONCAT('^[', set_of_letters, ']+$'));
END
--
~
SELECT ufn_is_word_comprised('oistmiahf', 'Sofia') AS result;
SELECT ufn_is_word_comprised('oistmiahf', 'halves') AS result;
SELECT ufn_is_word_comprised('bobr', 'Rob') AS result;
SELECT ufn_is_word_comprised('pppp', 'Guy') AS result;