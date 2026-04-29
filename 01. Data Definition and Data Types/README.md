# 📘 Database Introduction, Data Definition & Datatypes

## 📑 Table of Contents

* [1. Data Management](#1-data-management)
* [2. Database & RDBMS](#2-database--rdbms)
* [3. Database Engine](#3-database-engine)
* [4. Structured Query Language (SQL)](#4-structured-query-language-sql)
* [5. MySQL Overview](#5-mysql-overview)
* [6. Tables & Relationships](#6-tables--relationships)
* [7. Programmability](#7-programmability)
* [8. Data Types in MySQL](#8-data-types-in-mysql)
    * [8.1 Numeric Types](#81-numeric-types)
    * [8.2 String Types](#82-string-types)
    * [8.3 Date Types](#83-date-types)
* [9. Database Modeling](#9-database-modeling)
* [10. Basic SQL (DDL)](#10-basic-sql-ddl)
* [11. Table Customization](#11-table-customization)
* [12. Altering Tables](#12-altering-tables)
* [13. Deleting Data & Structures](#13-deleting-data--structures)
* [14. Summary](#14-summary)

---

## 1. Data Management

Databases are not just for storage — they solve problems like:

* Data redundancy
* Inconsistency
* Difficult updates
* Security issues
* Scalability

📌 A database = **organized collection of related data with rules**

---

## 2. Database & RDBMS

### Database

* Structured data storage
* Organized in tables

### RDBMS (Relational DBMS)

* Manages databases
* Uses **tables (relations)**
* Data is connected via keys

Examples:

* MySQL
* SQL Server
* Oracle
* DB2

---

## 3. Database Engine

### Client-Server Model

* Client sends queries
* Server processes and returns data

```
Client → Query → DB Engine → Data → Response
```

---

## 4. Structured Query Language (SQL)

SQL is used to communicate with databases.

### SQL Categories:

| Type | Description       | Commands                       |
| ---- | ----------------- | ------------------------------ |
| DDL  | Data Definition   | CREATE, ALTER, DROP            |
| DML  | Data Manipulation | SELECT, INSERT, UPDATE, DELETE |
| DCL  | Access Control    | GRANT, REVOKE                  |
| TCL  | Transactions      | COMMIT, ROLLBACK               |

---

## 5. MySQL Overview

* Open-source RDBMS
* Cross-platform (Windows, Linux, macOS)
* Widely used in web applications

### Architecture:

* Instance
* Databases (Schemas)
* Tables
* Data & Log files

---

## 6. Tables & Relationships

### Table Structure:

* Rows → records
* Columns → fields
* Cells → values

### Keys:

* **Primary Key (PK)** → unique identifier
* **Foreign Key (FK)** → reference to another table

### Why relationships?

* Avoid duplication
* Normalize data
* Improve consistency

---

## 7. Programmability

### Indexes

* Speed up queries
* Types:

    * Clustered (PK-based)
    * Non-clustered

### Views

```sql
CREATE VIEW v_employee_names AS
SELECT `first_name`, `last_name` FROM `employees`;
```

### Other:

* Procedures → predefined logic
* Functions → return values
* Triggers → auto actions on events

---

## 8. Data Types in MySQL

### 8.1 Numeric Types

```sql
INT, TINYINT, SMALLINT, BIGINT
DOUBLE(M, D)
DECIMAL(M, D)
```

* **SIGNED** → negative + positive
* **UNSIGNED** → only positive

---

### 8.2 String Types

```sql
CHAR(M)       -- fixed length
VARCHAR(M)    -- variable length
TEXT          -- large text
BLOB          -- binary data
```

### CHAR vs VARCHAR

| Type    | Behavior              |
| ------- | --------------------- |
| CHAR    | fixed size (faster)   |
| VARCHAR | dynamic (saves space) |

### Charset & Collation

* Charset → encoding (utf8)
* Collation → sorting rules

---

### 8.3 Date Types

```sql
DATE       -- YYYY-MM-DD
TIME       -- HH:MM:SS
DATETIME   -- full date + time
TIMESTAMP  -- auto tracking
YEAR
```

---

## 9. Database Modeling

Tools like MySQL Workbench allow:

* Creating schemas
* Designing tables
* Managing relationships
* Editing data visually

---

## 10. Basic SQL (DDL)

### Create Database

```sql
CREATE DATABASE `employees`;
```

### Create Table

```sql
CREATE TABLE `people` (
    `id` INT NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50)
  );
```

### Select Data

```sql
SELECT * FROM `employees`;
SELECT `first_name`, `last_name` FROM `employees` LIMIT 5;
```

---

## 11. Table Customization

```sql
`id` INT PRIMARY KEY AUTO_INCREMENT
`email` VARCHAR(50) UNIQUE
`balance` DECIMAL(10,2) DEFAULT 0
```

Features:

* Primary Key
* Auto Increment
* Unique constraint
* Default values

---

## 12. Altering Tables

### Add column

```sql
ALTER TABLE `employees`
    ADD COLUMN `salary` DECIMAL;
```

### Modify column

```sql
ALTER TABLE `people`
    MODIFY COLUMN `email` VARCHAR(100);
```

### Drop column

```sql
ALTER TABLE `people`
    DROP COLUMN `full_name`;
```

### Add constraints

```sql
ALTER TABLE `people`
    ADD CONSTRAINT pk_id PRIMARY KEY (`id`);

ALTER TABLE `people`
    ADD CONSTRAINT uq_email UNIQUE (`email`);
```

---

## 13. Deleting Data & Structures

### Delete data

```sql
TRUNCATE TABLE `employees`;
```

### Drop table

```sql
DROP TABLE `employees`;
```

### Drop database

```sql
DROP DATABASE `soft_uni`;
```

### Remove constraint

```sql
ALTER TABLE `people`
    DROP CONSTRAINT pk_id;
```

⚠️ Warning:

* `DROP` and `TRUNCATE` are **irreversible**

---

## 14. Summary

* Databases manage structured data efficiently
* SQL is the standard language for database operations
* MySQL is a widely used RDBMS
* Tables, keys, and relationships are core concepts
* Data types define how data is stored
* DDL allows creating and modifying structures

---

## 🚀 Usage

Use this cheat sheet for:

* Quick revision
* Understanding database fundamentals
* Preparing for SQL/MySQL tasks
