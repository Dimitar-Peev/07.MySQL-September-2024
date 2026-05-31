# 📘 Table Relations

## 📑 Table of Contents

* [1. Database Design](#1-database-design)

    * [1.1 Steps in Design](#11-steps-in-design)
    * [1.2 Primary Keys](#12-primary-keys)
* [2. Table Relationships](#2-table-relationships)

    * [2.1 One-to-Many](#21-one-to-many)
    * [2.2 Many-to-Many](#22-many-to-many)
    * [2.3 One-to-One](#23-one-to-one)
* [3. Foreign Keys](#3-foreign-keys)
* [4. JOINs](#4-joins)
* [5. Cascade Operations](#5-cascade-operations)

    * [5.1 ON DELETE CASCADE](#51-on-delete-cascade)
    * [5.2 ON UPDATE CASCADE](#52-on-update-cascade)
* [6. E/R Diagrams](#6-er-diagrams)
* [7. Summary](#7-summary)

---

## 1. Database Design

### 1.1 Steps in Design

1. Identify entities (tables)
2. Define columns (attributes)
3. Define primary keys
4. Model relationships
5. Add constraints
6. Insert test data

---

### 1.2 Primary Keys

* Unique identifier for each record
* Best practice:

    * Use `INT AUTO_INCREMENT`
    * Avoid real-world data (e.g. SSN)
    * Place as first column

```sql id="zq7e4l"
`id` INT PRIMARY KEY AUTO_INCREMENT
```

---

## 2. Table Relationships

Relationships connect tables using:

* **Primary Key (PK)**
* **Foreign Key (FK)**

---

### 2.1 One-to-Many

One record → many related records

📌 Example: Mountains → Peaks

```sql id="r6gq2h"
CREATE TABLE `mountains`
(
    `id`   INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

CREATE TABLE `peaks`
(
    `id`          INT PRIMARY KEY AUTO_INCREMENT,
    `name`        VARCHAR(50),
    `mountain_id` INT,

    CONSTRAINT fk_peaks_mountains
        FOREIGN KEY (`mountain_id`)
            REFERENCES `mountains` (`id`)
);
```

---

### 2.2 Many-to-Many

Requires a **mapping (junction) table**

📌 Example: Employees ↔ Projects

```sql id="4twc3y"
CREATE TABLE `employees_projects`
(
    `employee_id` INT,
    `project_id`  INT,
  
    -- COMPOSITE PRIMARY KEY
    PRIMARY KEY (`employee_id`, `project_id`),

    -- FOREIGN KEY CONSTRAINTS
    FOREIGN KEY (`employee_id`)
        REFERENCES `employees` (`employee_id`),

    FOREIGN KEY (`project_id`)
        REFERENCES `projects` (`project_id`)
);
```

---

### 2.3 One-to-One

One record ↔ one record

📌 Example: Drivers ↔ Cars

```sql id="7a0w5c"
CREATE TABLE `cars`
(
    `car_id`    INT PRIMARY KEY,
    `driver_id` INT UNIQUE,

    FOREIGN KEY (`driver_id`)
        REFERENCES `drivers` (`driver_id`)
);
```

---

## 3. Foreign Keys

* Link tables together
* Reference primary key from another table

```sql id="0y7r1s"
FOREIGN KEY (column)
REFERENCES other_table(primary_key)
```

📌 Benefits:

* Data consistency
* Avoid duplication

---

## 4. JOINs

Used to retrieve data from multiple tables.

```sql id="u2d3q8"
SELECT *
FROM table_a
JOIN table_b
ON table_a.id = table_b.id;
```

---

### Example:

```sql id="g7lq8o"
SELECT v.`driver_id`,
       v.`vehicle_type`,
       CONCAT(c.`first_name`, ' ', c.`last_name`) AS 'driver_name'
FROM `vehicles` AS v
         INNER JOIN `campers` AS c
                    ON v.`driver_id` = c.`id`;
```

---

## 5. Cascade Operations

Automatically propagate changes between related tables.

---

### 5.1 ON DELETE CASCADE

Deletes child records when parent is deleted.

```sql id="m9t4xk"
FOREIGN KEY (`mountain_id`)
REFERENCES `mountains`(`id`)
ON DELETE CASCADE
```

📌 Use when:

* Child data depends entirely on parent

---

### 5.2 ON UPDATE CASCADE

Updates child records when parent key changes.

```sql id="o4r9qn"
FOREIGN KEY (`driver_id`)
REFERENCES `drivers`(`driver_id`)
ON UPDATE CASCADE
```

📌 Use when:

* Primary key is not auto-increment

---

## 6. E/R Diagrams

* Visual representation of database structure
* Shows:

    * Tables
    * Relationships
    * Keys

📌 Represents **schema (structure), not data**

---

## 7. Summary

* Database design starts with entities and relationships
* Key relationship types:

    * One-to-One
    * One-to-Many
    * Many-to-Many
* Foreign keys connect tables
* JOINs allow cross-table queries
* Cascade operations automate updates/deletes
* E/R diagrams visualize database structure

---

## 🚀 Usage

Use this cheat sheet for:

* Designing relational databases
* Understanding table relationships
* Writing JOIN queries
