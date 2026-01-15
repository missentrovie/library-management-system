# 📚 Library Management System (PostgreSQL)

A relational **Library Management System** built with PostgreSQL, focusing on
data integrity, automation via triggers, and reporting through views.

This project demonstrates practical database design for real-world scenarios
such as stock tracking, loan management, and analytical queries.

---

## Features
- Real-time book stock management (`available_copies`)
- Automatic stock updates using PostgreSQL triggers
- Member and loan management
- Multi-author book support (many-to-many)
- Reporting views:
     - Active loans
     - Overdue loans
     - Most popular books
- Indexes for query performance
- Data integrity via constraints and checks
- Foreign key constraints include ON DELETE rules to prevent orphan records
  and ensure referential integrity.
- Foreign key constraints include ON DELETE rules to prevent orphan records
  and ensure referential integrity.
- Partial unique index prevents multiple active loans of the same book
  by the same member.
- Partial indexes are used to optimize active loan queries.
- Reporting views for active loans, overdue items,
  popular books, and member loan history


## Database Structure
### Core Tables
- `books`, `authors`, `categories`
- `members`, `loans`
- `book_authors` (many-to-many relationship)
### Automation
- Triggers handle:
      Decreasing stock on loan creation
      Increasing stock on book return
### Reporting
- SQL views provide ready-to-use reports without complex queries.



## Setup
Run the SQL scripts in the following order:
```bash
psql -U <user> -d <database> -f sql/01_schema.sql
psql -U <user> -d <database> -f sql/02_triggers.sql
psql -U <user> -d <database> -f sql/03_views.sql
psql -U <user> -d <database> -f sql/04_sample_data.sql
```

Example Queries
SELECT * FROM active_loans;
SELECT * FROM overdue_loans;
SELECT title, available_copies FROM books WHERE available_copies > 0;

🛠️ Possible Improvements
Fine calculation system for overdue loans
Role-based access control
Audit logging
REST API integration
Transaction-level concurrency handling



This project helped reinforce:
Database normalization
Trigger-based automation
Index optimization
Business-oriented SQL reporting
Data consistency and integrity
