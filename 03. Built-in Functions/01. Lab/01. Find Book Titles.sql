USE `book_library`;
--
SELECT `title`
FROM `books`
WHERE SUBSTRING(`title` FROM 1 FOR 3) = 'The';