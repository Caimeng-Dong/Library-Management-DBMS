# Library Management System – DBMS Project

This project is a relational database system designed to manage the operations of a library, including item loans, reservations, fines, and member suspensions. It was developed as part of a Database Systems project using Oracle Live SQL.

---

## Features

- Manage loans for physical books, ebooks, and digital devices
- Support both student and staff members (with different loan limits)
- Reservation system with automatic offer/cancellation logic
- Fine and suspension system based on overdue loan days
- Loan history tracking for analytics
- Fully normalized schema (1NF → 3NF)
- Advanced queries for reporting and decision-making

---

## Database Design

- ERD diagram and entity assumptions are provided
- Data is normalized through 1NF, 2NF, and 3NF
- Separate entities for Member, Student, Staff, Items, Loans, Reservations, Devices, Fines, and Locations

See:  
[`docs/Normalization_Notes.md`](./docs/Normalization_Notes.md)  

---

## Project Structure

Library-Management-DBMS/
├── README.md
├── ERD.png
├── docs/
│ └── Normalization_Notes.md
├── sql_scripts/
│ ├── create_tables.sql
│ ├── insert_dummy_data.sql
│ ├── create_views.sql
│ ├── queries_simple.sql
│ ├── queries_intermediate.sql
│ └── queries_advanced.sql


---

## Technologies Used

- SQL (DDL, DML, Views, Joins, Aggregation, Triggers)
- Oracle Live SQL
- Relational Database Design
- Normalization Techniques (1NF, 2NF, 3NF)

---

## Sample SQL Queries

Includes:
- View creation
- Filtering loans, overdue items, reservations
- Calculating suspended members dynamically
- Aggregating popular items based on loan/reservation counts

See files in `sql_scripts/` folder.

---

## My Role

I participated in the full-cycle development of the database including:
- Requirements analysis and assumptions
- ERD modeling and schema design
- Normalization
- Writing DDL & DML scripts
- Writing advanced analytical SQL queries
- Testing on Oracle Live SQL




