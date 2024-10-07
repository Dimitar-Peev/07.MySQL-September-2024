USE `ep_go_rodie`;
--
INSERT INTO students(first_name, last_name, age, phone_number)
SELECT LOWER(REVERSE(first_name)),
       LOWER(REVERSE(last_name)),
       age + LEFT(phone_number, 1),
       CONCAT('1+', phone_number)
FROM students
WHERE age < 20;