# Library Management System - SQL Project

This project manages Library Data using SQL. It provides a simple and efficient way to handle all library operations like managing books, members, issuing and returning books, and fine calculation for late returns.
---

## Tools Used:
- MySQL (Command Line Client / MySQL Workbench)
---
## Modules Covered:
### 1. Book Management
- Add new books to the library
- Update existing book details like price
- Delete books (if required)
- View all available books

### 2. Member Management
- Add new members to the library
- Update member details like address
- Delete member records (if required)
- View member details

### 3. Staff Management
- Add staff records
- Update staff information
- Delete staff data

### 4. Issue & Return Books
- Issue books to members with issue date and return date
- Return books with actual return date
- Track issued books to specific members
- View issue history with JOIN queries

### 5. Fine Calculation
- Calculate fine for late return of books
- Fine is ₹10 per day after the due return date
- Automated fine calculation using SQL Conditional Statements

---

## Additional Features:
- Implementation of CRUD Operations (Create, Read, Update, Delete)
- Use of SQL Joins to display combined data from multiple tables
- Use of Aggregate Functions like:
  - `COUNT()` - Total number of books
  - `MAX()` - Maximum price of a book
  - `MIN()` - Minimum price of a book
  - `AVG()` - Average book price
  - `SUM()` - Sum of all book prices
- Usage of `CASE` Statement for Fine Calculation
- Proper Table Normalization for better Database Design
- Real-time Implementation of SQL Queries for Practice
---
## Database Details:
### Database Name:
`LibraryDB`
### Tables Created:
| Table Name  | Purpose                                  |
|-------------|-------------------------------------------|
| Member      | Stores member details                    |
| Book        | Stores book information                  |
| Staff       | Stores staff details                     |
| Issue       | Stores book issue information            |
| ReturnBook  | Stores book return information           |
| Fine        | Stores fine details for late returns     |
---
## Learning Outcomes:
- Real-time Database Design
- SQL Queries Implementation
- Relational Database Management
- Normalization Techniques
- Fine Calculation Logic using SQL
- Data Handling & Management through SQL Commands

---
## Conclusion:
This SQL-based Library Management System project provides a comprehensive understanding of handling real-time database operations with proper table design, SQL queries, and data manipulation techniques. 

---

## Author:
> Developed by *Rasika Pawar*

