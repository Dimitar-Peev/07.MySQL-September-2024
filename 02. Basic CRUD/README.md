# 📘 Basic CRUD

## 📑 Table of Contents

* [1. Query Basics](#1-query-basics)
* [2. Retrieving Data (SELECT)](#2-retrieving-data-select)

    * [2.1 SELECT Basics](#21-select-basics)
    * [2.2 Aliases](#22-aliases)
    * [2.3 Concatenation](#23-concatenation)
    * [2.4 Filtering (WHERE)](#24-filtering-where)
    * [2.5 Advanced Conditions](#25-advanced-conditions)
    * [2.6 NULL Handling](#26-null-handling)
    * [2.7 Sorting (ORDER BY)](#27-sorting-order-by)
    * [2.8 Views](#28-views)
* [3. Writing Data (INSERT)](#3-writing-data-insert)
* [4. Modifying Data (UPDATE)](#4-modifying-data-update)
* [5. Deleting Data (DELETE)](#5-deleting-data-delete)
* [6. Summary](#6-summary)

---

## 1. Query Basics

SQL allows you to perform **CRUD operations**:

* **Create** → `INSERT`
* **Read** → `SELECT`
* **Update** → `UPDATE`
* **Delete** → `DELETE`

### Example:

```sql
SELECT `first_name`, `last_name` FROM `employees`;

INSERT INTO `projects`(`name`, `start_date`)
VALUES ('SQL Course', '2006-01-01');

UPDATE `projects`
SET `end_date` = '2006-08-31'
WHERE `start_date` = '2006-01-01';

DELETE FROM `projects`
WHERE `start_date` = '2006-01-01';
```

---

## 2. Retrieving Data (SELECT)

### 2.1 SELECT Basics

Retrieve data from tables:

```sql
SELECT * FROM `employees`;

SELECT `id`, `first_name`, `last_name`
FROM `employees`
ORDER BY `id`;
```

---

### 2.2 Aliases

Rename columns or tables:

```sql
SELECT 
  e.`id` AS 'No.',
  e.`first_name` AS 'First Name',
  e.`last_name` AS 'Last Name'
FROM `employees` AS e;
```

---

### 2.3 Concatenation

Combine columns into one:

```sql
SELECT CONCAT(`first_name`, ' ', `last_name`) AS 'full_name'
FROM `employees`;
```

Using separator:

```sql
SELECT CONCAT_WS(' ', `first_name`, `last_name`, `job_title`)
FROM `employees`;
```

---

### 2.4 Filtering (WHERE)

Filter rows:

```sql
SELECT * FROM `employees`
WHERE `salary` > 1000;
```

Remove duplicates:

```sql
SELECT DISTINCT `department_id` FROM `employees`;
```

---

### 2.5 Advanced Conditions

```sql
-- BETWEEN
SELECT * FROM `employees`
WHERE `salary` BETWEEN 20000 AND 22000;

-- IN
SELECT * FROM `employees`
WHERE `manager_id` IN (1, 2, 3);

-- AND / OR / NOT
SELECT * FROM `employees`
WHERE `department_id` = 4 AND `salary` >= 1000;
```

---

### 2.6 NULL Handling

```sql
SELECT * FROM `employees`
WHERE `manager_id` IS NULL;

SELECT * FROM `employees`
WHERE `manager_id` IS NOT NULL;
```

⚠️ Important:

```sql
WHERE `manager_id` = NULL  -- ❌ Always false
```

---

### 2.7 Sorting (ORDER BY)

```sql
SELECT `last_name`, `hire_date`
FROM `employees`
ORDER BY `hire_date` ASC;

SELECT `last_name`, `hire_date`
FROM `employees`
ORDER BY `hire_date` DESC;
```

---

### 2.8 Views

Virtual tables based on queries:

```sql
CREATE VIEW v_employee_data AS
SELECT CONCAT(`first_name`, ' ', `last_name`) AS 'full_name', `salary`
FROM `employees`;

SELECT * FROM v_employee_data;
```

Example – Top paid employee:

```sql
CREATE VIEW v_top_paid_employee AS
SELECT *
FROM `employees`
ORDER BY `salary` DESC
LIMIT 1;
```

---

## 3. Writing Data (INSERT)

Insert data into tables:

```sql
INSERT INTO `towns` VALUES (33, 'Paris');
```

Specify columns:

```sql
INSERT INTO `projects`(`name`, `start_date`)
VALUES ('New Project', NOW());
```

Bulk insert:

```sql
INSERT INTO `employees_projects` VALUES
(1, 1),
(1, 2),
(1, 3);
```

Insert from another table:

```sql
INSERT INTO `projects`(`name`, `start_date`)
SELECT CONCAT(`name`, ' Restructuring'), NOW()
FROM `departments`;
```

Create table from query:

```sql
CREATE TABLE customer_contacts AS
SELECT `customer_id`, `first_name`, `email`
FROM `customers`;
```

---

## 4. Modifying Data (UPDATE)

```sql
UPDATE `employees`
SET `last_name` = 'Brown'
WHERE `employee_id` = 1;
```

Multiple updates:

```sql
UPDATE `employees`
SET `salary` = `salary` * 1.10,
    `job_title` = CONCAT('Senior ', `job_title`)
WHERE `department_id` = 3;
```

Example:

```sql
UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';
```

⚠️ Always use `WHERE` to avoid updating all rows!

---

## 5. Deleting Data (DELETE)

```sql
DELETE FROM `employees`
WHERE `employee_id` = 1;
```

Multiple conditions:

```sql
DELETE FROM `employees`
WHERE `department_id` = 1 OR `department_id` = 2;
```

Delete all rows:

```sql
TRUNCATE TABLE `employees`;
```

⚠️ `TRUNCATE` is faster but cannot be rolled back in many cases.

---

## 6. Summary

* SQL provides powerful tools to manipulate data.
* Core operations:

    * `SELECT` → retrieve data
    * `INSERT` → add data
    * `UPDATE` → modify data
    * `DELETE` → remove data
* Filtering, sorting, and joining make queries flexible.
* Views simplify complex queries and improve security.

---

## 🚀 Usage

This cheat sheet is designed for:

* Quick revision
* Interview prep
* Daily SQL usage reference
