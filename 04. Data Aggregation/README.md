# 📘 Data Aggregation

## 📑 Table of Contents

* [1. Grouping (GROUP BY)](#1-grouping-with-group-by)
* [2. Aggregate Functions](#2-aggregate-functions)

    * [2.1 COUNT](#21-count)
    * [2.2 SUM](#22-sum)
    * [2.3 MAX](#23-max)
    * [2.4 MIN](#24-min)
    * [2.5 AVG](#25-avg)
* [3. HAVING Clause](#3-having-clause)
* [4. WHERE vs HAVING](#4-where-vs-having)
* [5. Summary](#5-summary)

---

## 1. Grouping with GROUP BY
- Works only with SELECT

Grouping allows you to split data into groups based on a column.

```sql id="yzq0g4"
SELECT column, aggregate_function(column)
FROM table
GROUP BY column;
```

### Example:

```sql id="yx79r9"
SELECT `job_title`, COUNT(`employee_id`)
FROM `employees`
GROUP BY `job_title`;
```

---

### Example: Total Salary per Department

```sql id="k5kp23"
SELECT `department_id`,
       SUM(`salary`) AS 'total_salary'
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id`;
```

---

## 2. [Aggregate Functions](https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html)

Used to perform calculations over groups of rows.

📌 Important:

* Ignore `NULL` values (in most cases)

---

### 2.1 [COUNT](https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html#function_count)

Counts non-NULL values:

```sql id="h59oz2"
SELECT `department_id`,
       COUNT(`salary`) AS 'salary_count'
FROM `employees`
GROUP BY `department_id`;
```

---

### 2.2 [SUM](https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html#function_sum)

Adds values:

```sql id="9m8k9t"
SELECT `department_id`,
       SUM(`salary`) AS 'total_salary'
FROM `employees`
GROUP BY `department_id`;
```

---

### 2.3 [MAX](https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html#function_max)

Finds highest value:

```sql id="67s9lx"
SELECT `department_id`,
       MAX(`salary`) AS 'max_salary'
FROM `employees`
GROUP BY `department_id`;
```

---

### 2.4 [MIN](https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html#function_min)

Finds lowest value:

```sql id="r6t0np"
SELECT `department_id`,
       MIN(`salary`) AS 'min_salary'
FROM `employees`
GROUP BY `department_id`;
```

---

### 2.5 [AVG](https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html#function_avg)

Calculates average:

```sql id="9t0u3o"
SELECT `department_id`,
       AVG(`salary`) AS 'avg_salary'
FROM `employees`
GROUP BY `department_id`;
```

---

## 3. HAVING Clause

Filters grouped results (after aggregation).

```sql id="79i4dw"
SELECT column, aggregate_function(column)
FROM table
GROUP BY column
HAVING condition;
```

### Example:

```sql id="srw8qk"
SELECT `department_id`,
       SUM(`salary`) AS 'total_salary'
FROM `employees`
GROUP BY `department_id`
HAVING total_salary < 25000;
```

---

## 4. WHERE vs HAVING

| Clause | When Applied    | Use Case       |
| ------ | --------------- | -------------- |
| WHERE  | Before grouping | Filters rows   |
| HAVING | After grouping  | Filters groups |

### Example:

```sql id="q8r4qp"
-- WHERE filters rows first
SELECT `department_id`, SUM(`salary`)
FROM `employees`
WHERE `salary` > 1000
GROUP BY `department_id`;

-- HAVING filters groups after aggregation
SELECT `department_id`, SUM(`salary`)
FROM `employees`
GROUP BY `department_id`
HAVING SUM(`salary`) > 20000;
```

---

## 5. Summary

* `GROUP BY` groups rows by column values
* Aggregate functions perform calculations per group:

    * `COUNT`, `SUM`, `MAX`, `MIN`, `AVG`
* `HAVING` filters grouped results
* `WHERE` filters rows before grouping

---

## 🚀 Usage

Use this cheat sheet for:

* Data analysis in SQL
* Writing reports and summaries
* Interview preparation
