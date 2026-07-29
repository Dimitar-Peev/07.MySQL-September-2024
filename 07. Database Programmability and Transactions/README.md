# 📘 Database Programmability & Transactions 

## 📑 Table of Contents

* [1. User-Defined Functions](#1-user-defined-functions)
* [2. Stored Procedures](#2-stored-procedures)

    * [2.1 Creating Procedures](#21-creating-procedures)
    * [2.2 Parameters & Output](#22-parameters--output)
* [3. Transactions](#3-transactions)

    * [3.1 Commit & Rollback](#31-commit--rollback)
    * [3.2 ACID Properties](#32-acid-properties)
* [4. Triggers](#4-triggers)

* [5. Summary](#5-summary)

---

## 1. User-Defined Functions

Functions encapsulate reusable logic.

📌 Benefits:

* Reusable code
* Faster execution
* Cleaner queries

### Example:

```sql id="f7a2k1"
CREATE FUNCTION ufn_count_employees_by_town(`town_name` VARCHAR(20))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE `e_count` INT;

    SET `e_count` := (SELECT COUNT(e.`employee_id`)
                      FROM `employees` e
                               JOIN `addresses` a
                                    ON a.`address_id` = e.`address_id`
                               JOIN `towns` t
                                    ON t.`town_id` = a.`town_id`
                      WHERE t.`name` = `town_name`);

    RETURN `e_count`;
END;
```

Usage:

```sql id="p8m4x9"
SELECT ufn_count_employees_by_town('Sofia');
```

---

## 2. Stored Procedures

Stored procedures are predefined SQL logic stored in the database.

📌 Advantages:

* Reduce network traffic
* Improve security
* Reusable business logic

---

### 2.1 [Creating Procedures](https://dev.mysql.com/doc/refman/8.4/en/create-procedure.html)

```sql id="t3n7b2"
DELIMITER $$

CREATE PROCEDURE usp_select_employees_by_seniority()
BEGIN
    SELECT *
    FROM `employees`
    WHERE ROUND(DATEDIFF(NOW(), `hire_date`) / 365.25) < 15;
END $$

DELIMITER ;
```

Execute:

```sql id="y2r8k5"
CALL usp_select_employees_by_seniority();
```

---

### 2.2 Parameters & Output

```sql id="w6q9z1"
CREATE PROCEDURE usp_add_numbers(`first_number` INT, `second_number` INT, OUT `result` INT)
BEGIN
  SET `result` = `first_number` + `second_number`;
END;
```

Usage:

```sql id="c4v1n8"
SET @result = 0;
CALL usp_add_numbers(5, 6, @result);
SELECT @result;
```

---

### Example: Update Salaries

```sql id="x9t5d3"
CREATE PROCEDURE usp_raise_salaries(`department_name` VARCHAR(50))
BEGIN
  UPDATE `employees` AS e
    JOIN `departments` d
    ON e.`department_id` = d.`department_id`
  SET `salary` = `salary` * 1.05
  WHERE d.`name` = `department_name`;
END;
```

---

## 3. Transactions

A transaction = group of operations executed as a single unit.

📌 Rule:

* All succeed → COMMIT
* One fails → ROLLBACK

---

### 3.1 Commit & Rollback

```sql id="v1k8p6"
START TRANSACTION;

UPDATE `accounts`
SET `balance` = `balance` - 100
WHERE `id` = 1;

UPDATE `accounts`
SET `balance` = `balance` + 100
WHERE `id` = 2;

COMMIT;
-- or
ROLLBACK;
```

---

### Example with Validation:

```sql id="n7m2s4"
START TRANSACTION;

IF
(SELECT COUNT(*)
 FROM `employees`
 WHERE `employee_id` = 1)
= 1 THEN
UPDATE `employees`
SET `salary` = `salary` * 1.05
WHERE `employee_id` = 1;
ELSE
ROLLBACK;
END IF;
```

---

### 3.2 ACID Properties

| Property    | Meaning               |
| ----------- | --------------------- |
| Atomicity   | All or nothing        |
| Consistency | Valid state           |
| Isolation   | Independent execution |
| Durability  | Changes persist       |

---

## 4. Triggers

Triggers are automatic actions executed on events.

📌 Events:

* INSERT
* UPDATE
* DELETE

📌 Trigger timing:

* BEFORE
* AFTER

---

### Example:

```sql id="b5k2r7"
CREATE TRIGGER tr_deleted_employees
    AFTER DELETE
    ON `employees`
    FOR EACH ROW
BEGIN
    INSERT INTO `deleted_employees` (`first_name`, `last_name`, `middle_name`,
                                     `job_title`, `department_id`, `salary`)
    VALUES (OLD.`first_name`, OLD.`last_name`, OLD.`middle_name`,
            OLD.`job_title`, OLD.`department_id`, OLD.`salary`);
END;
```

📌 Special keywords:

* `OLD` → data before change
* `NEW` → data after change

---

## 5. Summary

* Functions encapsulate reusable logic
* Stored procedures centralize database operations
* Transactions ensure data consistency (ACID)
* Triggers automate reactions to data changes

---

## 🚀 Usage

Use this cheat sheet for:

* Writing advanced SQL logic
* Ensuring data consistency
* Backend/database development
