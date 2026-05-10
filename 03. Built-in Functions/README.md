# 📘 Built-in Functions

## 📑 Table of Contents

* [1. Functions in MySQL](#1-functions-in-mysql)
* [2. String Functions](#2-string-functions)

    * [2.1 SUBSTRING](#21-substring)
    * [2.2 REPLACE](#22-replace)
    * [2.3 Length & Trimming](#23-length--trimming)
    * [2.4 LEFT / RIGHT](#24-left--right)
    * [2.5 Case & Other](#25-case--other)
    * [2.6 Advanced String Functions](#26-advanced-string-functions)
* [3. Math Functions](#3-math-functions)

    * [3.1 Arithmetic Operators](#31-arithmetic-operators)
    * [3.2 Numeric Functions](#32-numeric-functions)
* [4. Date Functions](#4-date-functions)
* [5. Wildcards](#5-wildcards)
* [6. Regular Expressions](#6-regular-expressions)
* [7. Summary](#7-summary)

---

## 1. Functions in MySQL

MySQL provides built-in functions for:

* String manipulation
* Mathematical calculations
* Date/time operations

---

## 2. [String Functions and Operators](https://dev.mysql.com/doc/refman/8.4/en/string-functions.html)

### 2.1 [SUBSTRING](https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_substring)

Extract part of a string:

```sql
SUBSTRING(str, position) 
SUBSTRING(str FROM pos)
SUBSTRING(str, position, length)
SUBSTRING(str FROM position FOR length)
SUBSTR() is a synonym for SUBSTRING().
```

Example:

```sql
SELECT SUBSTRING('Quadratically',5); -- 'ratically'
SELECT SUBSTRING('Sakila', -3); -- 'ila'
SELECT SUBSTRING('Quadratically',5,6); -- 'ratica'

SELECT SUBSTRING(`content`, 1, 200) AS summary
FROM `articles`;
```

---

### 2.2 [REPLACE](https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_replace)

Replace part of a string:

```sql
REPLACE(str, pattern, replacement)
```

Example:

```sql
SELECT REPLACE(`title`, 'blood', '*****')
FROM `album`;
```

---

### 2.3 Length & Trimming

```sql
CHAR_LENGTH(str)  -- Return number of characters in argument
LENGTH(str)       -- Return the length of a string in bytes

TRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr FROM] str)
TRIM(str)         -- remove leading and trailing spaces   
LTRIM(str)        -- remove leading spaces
RTRIM(str)        -- remove trailing spaces
```

Example:

```sql
SELECT TRIM('  bar   '); -- 'bar'
SELECT TRIM(LEADING 'x' FROM 'xxxbarxxx'); -- 'barxxx'
SELECT TRIM(BOTH 'x' FROM 'xxxbarxxx'); -- 'bar'
SELECT TRIM(TRAILING 'xyz' FROM 'barxxyz'); -- 'bar
```

---

### 2.4 LEFT / RIGHT

```sql
LEFT(str, count) -- Return the leftmost number of characters as specified
RIGHT(str, count) -- Return the specified rightmost number of characters
```

Example:

```sql
SELECT LEFT(`name`, 3) AS short_name
FROM `games`;
```

---

### 2.5 Case & Other

```sql
LOWER(str) -- Return the argument in lowercase
UPPER(str) -- Return the argument in uppercase
REVERSE(str) -- Reverse the characters in a string
REPEAT(str, count) -- Repeat a string the specified number of times
```

---

### 2.6 Advanced String Functions

```sql
LOCATE(substr, str) -- Return the position of the first occurrence of substring
LOCATE(substr, str, pos)
INSERT(str, pos, len, new_str) -- Insert substring at specified position up to specified number of characters
```

---

## 3. Numeric Functions and Operators

### 3.1 [Arithmetic Operators](https://dev.mysql.com/doc/refman/8.4/en/arithmetic-functions.html)

| Operator | Description      |
| -------- | ---------------- |
| +        | Addition         |
| -        | Subtraction      |
| *        | Multiplication   |
| /        | Division         |
| DIV      | Integer division |
| % / MOD  | Modulo           |

---

### 3.2 [Mathematical  Functions](https://dev.mysql.com/doc/refman/8.4/en/mathematical-functions.html)

```sql
PI() -- Return the value of pi
ABS(x) -- Return the absolute value
SQRT(x) -- Return the square root of the argument
POW(x, y) -- Return the argument raised to the specified power
POWER(x, y) is a synonym for POW().
ROUND(x) -- Round the argument 
ROUND(x, d) -- Rounds the argument X to D decimal places. 
FLOOR(x) -- Return the largest integer value not greater than the argument
CEILING(x) -- Return the smallest integer value not less than the argument
CEIL(x) is a synonym for CEILING(x).
SIGN(x) -- Return the sign of the argument
RAND() -- Return a random floating-point value between 0 and 1 (exclusive)
CONV(N, from_base, to_base) -- Convert numbers between different number bases
```

Example:

```sql
SELECT ROUND(3.14159, 2); -- 3.14
```

---

## 4. [Date and Time Functions](https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html)

Extract parts of dates:

```sql
YEAR(date) -- Return the year
MONTH(date) -- Return the month from the date passed
DAYOFMONTH(date) -- Return the day of the month (1-31)
DAY(date) is a synonym for DAYOFMONTH().
EXTRACT(part FROM date) -- Extract part of a date as an integer
```

Difference between dates:

```sql
TIMESTAMPDIFF(unit, date1, date2) -- Return the difference of two datetime expressions, using the units specified
```

Example:

```sql
SELECT TIMESTAMPDIFF(YEAR, `hire_date`, NOW()) AS experience
FROM `employees`;
```

[Format dates](https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-format):

```sql
DATE_FORMAT(date, format) -- Format date as specified
```

Current date/time:

```sql
SELECT NOW(); -- Return the current date and time
```

---

## 5. Wildcards

Used with `LIKE` for pattern matching:

| Symbol | Meaning                  |
| ------ | ------------------------ |
| %      | any number of characters |
| _      | exactly one character    |

Examples:

```sql
WHERE `name` LIKE 'a%'      -- starts with 'a'
WHERE `name` LIKE '_r%'     -- second letter 'r'
WHERE `name` LIKE 'a%o'     -- starts with 'a', ends with 'o'
```

---

## 6. Regular Expressions

Advanced pattern matching with `REGEXP`:

```sql
SELECT *
FROM `authors`
WHERE `first_name` REGEXP '^A.*'; -- ^A.* = starts with A and then any character
```

Examples:

* `^` → start of string
* `$` → end of string
* `[abc]` → any of a, b, c
* `[^abc]` → not a, b, c

---

## 7. Summary

* MySQL provides powerful built-in functions
* Main categories:

    * String functions
    * Math functions
    * Date functions
* Wildcards and REGEXP enable flexible searching
* Functions improve readability and reduce logic in application code

---

## 🚀 Usage

Use this cheat sheet for:

* Writing cleaner SQL queries
* Quick reference during development
* Interview preparation
