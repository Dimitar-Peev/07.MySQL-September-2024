# 📘 Joins, Subqueries & Indices

## 📑 Table of Contents

* [1. JOINs](#1-joins)

    * [1.1 Cartesian Product](#11-cartesian-product)
    * [1.2 INNER JOIN](#12-inner-join)
    * [1.3 LEFT JOIN](#13-left-join)
    * [1.4 RIGHT JOIN](#14-right-join)
    * [1.5 FULL OUTER JOIN (Simulation)](#15-full-outer-join-simulation)
    * [1.6 CROSS JOIN](#16-cross-join)
* [2. Subqueries](#2-subqueries)
* [3. Indices](#3-indices)

    * [3.1 Clustered Index](#31-clustered-index)
    * [3.2 Non-Clustered Index](#32-non-clustered-index)
* [4. Summary](#4-summary)

---

## 1. JOINs

JOINs are used to retrieve data from multiple tables.

```sql id="1w3g5k"
SELECT columns
FROM table_a
JOIN table_b
ON condition;
```

---

### 1.1 Cartesian Product

Occurs when:

* No JOIN condition is provided
* Or condition is invalid

```sql id="y2z6x1"
SELECT *
FROM `employees`,
     `departments`;
```

⚠️ Every row from table A combines with every row from table B

---

### 1.2 INNER JOIN

Returns matching rows in both tables.

```sql id="6d3k2p"
SELECT s.`name`, c.`name`
FROM `students` AS s
       INNER JOIN `courses` AS c
                  ON s.`course_id` = c.`id`;
```

---

### 1.3 LEFT JOIN

Returns all rows from left table + matches from right.

```sql id="7k1p9s"
SELECT s.`name`, c.`name`
FROM `students` AS s
         LEFT JOIN `courses` AS c
                   ON s.`course_id` = c.`id`;
```

---

### 1.4 RIGHT JOIN

Returns all rows from right table + matches from left.

```sql id="8m4r2t"
SELECT s.`name`, c.`name`
FROM `students` AS s
       RIGHT JOIN `courses` AS c
                  ON s.`course_id` = c.`id`;
```

---

### 1.5 FULL OUTER JOIN (Simulation)

MySQL does NOT support FULL JOIN directly.

Use:

```sql id="p4x8q2"
SELECT s.`name`, c.`name`
FROM `students` AS s
       LEFT JOIN `courses` c
                 ON s.`course_id` = c.`id`

UNION -- (default): Combines results and removes duplicate rows (returns only unique records).
-- UNION ALL -- Combines the results but keeps all duplicates. Works much faster because MySQL doesn't waste time looking for duplicate rows.

SELECT s.`name`, c.`name`
FROM `students` AS s
       RIGHT JOIN `courses` c
                  ON s.`course_id` = c.`id`;
```

---

### 1.6 CROSS JOIN

Returns all possible combinations:

```sql id="3n9v2b"
SELECT *
FROM `courses` AS c
       CROSS JOIN `students` AS s;
-- CROSS JOIN is used when we want to indicate that we really want to achieve this
```

---

## 2. Subqueries

Query inside another query.

```sql id="g5x9m2"
SELECT *
FROM table
WHERE column = (SELECT value
                FROM another_table);
```

---

### Example: Employees Above Average Salary

```sql id="k9t4w7"
SELECT COUNT(`employee_id`)
FROM `employees`
WHERE `salary` > (SELECT AVG(`salary`)
                  FROM `employees`);
```

---

## 3. Indices

Used to improve query performance.

📌 Trade-off:

* Faster reads
* Slower inserts/updates

---

### 3.1 Clustered Index

* Defines physical order of data
* Only ONE per table
* Used for:

    * `WHERE`
    * `ORDER BY`
    * `GROUP BY`

---

### 3.2 Non-Clustered Index

* Stored separately
* Contains pointers to actual data

```sql id="v2k9a6"
CREATE INDEX ix_users_names
  ON `users` (`first_name`, `last_name`);
```

---

## 4. Summary

* JOINs combine data from multiple tables
* Types:

    * INNER, LEFT, RIGHT, CROSS
* FULL JOIN simulated with UNION
* Subqueries allow nested logic
* Indices improve performance but slow writes

---

## 🚀 Usage

Use this cheat sheet for:

* Writing complex queries
* Optimizing database performance
* Interview preparation
