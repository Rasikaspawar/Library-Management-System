
-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create Tables

-- 1. Member Table
CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100),
    contact VARCHAR(15)
);

-- 2. Book Table
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    publisher VARCHAR(50),
    price DECIMAL(8,2)
);

-- 3. Staff Table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50),
    designation VARCHAR(50)
);

-- 4. Issue Table
CREATE TABLE Issue (
    issue_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

-- 5. Return Table
CREATE TABLE ReturnBook (
    return_id INT PRIMARY KEY,
    issue_id INT,
    actual_return_date DATE,
    FOREIGN KEY (issue_id) REFERENCES Issue(issue_id)
);

-- 6. Fine Table
CREATE TABLE Fine (
    fine_id INT PRIMARY KEY,
    return_id INT,
    fine_amount DECIMAL(8,2),
    FOREIGN KEY (return_id) REFERENCES ReturnBook(return_id)
);

-- Insert Data

INSERT INTO Member VALUES
(1, 'Raj kapoor', 'mumbai', '9845632123'),
(2, 'alia ', ' navi Mumbai', '7723121234'),
(3, 'aditya rothod', 'Sangli', '9023126789');

INSERT INTO Book VALUES
(101, 'yayati ', 'V.S.Kandekar', 'Mehta Publishing house pune', 295.00),
(102, 'Ram-Scion of lkshavku', ' Amish', 'Harper360', 273.00),
(103, 'CHAWA', 'SHIVAJI SAWANT', 'Mehta Publishing house pune', 670.00);

INSERT INTO Staff VALUES
(1, 'Priya Kulkarni', 'Librarian'),
(2, 'Rahul Joshi', 'Assistant');

INSERT INTO Issue VALUES
(1, 101, 1, '2025-03-01', '2025-03-31'),
(2, 102, 2, '2025-04-02', '2025-04-09');

INSERT INTO ReturnBook VALUES
(1, 1, '2025-04-10'),
(2, 2, '2025-04-09');

INSERT INTO Fine VALUES
(1, 1, 100.00),
(2, 2, 0.00);

                                                                  ##-- Select Queries--##

SELECT * FROM Member;
SELECT * FROM Book;
SELECT * FROM Staff;
SELECT * FROM Issue;
SELECT * FROM ReturnBook;
SELECT * FROM Fine;

                                                                  ##-- Update Queries--##

UPDATE Book SET price = 400 WHERE book_id = 101;
UPDATE Member SET address = 'Nagpur' WHERE member_id = 2;

                                                                    ##-- Delete Queries--##

DELETE FROM Staff WHERE staff_id = 2;
DELETE FROM Fine WHERE fine_id = 2;

                                                                        ##-- Join Queries--##

                                              ##-- Display Member Name, Book Title, Issue Date using Join--##
SELECT M.name AS Member_Name, B.title AS Book_Title, I.issue_date
FROM Member M
JOIN Issue I ON M.member_id = I.member_id
JOIN Book B ON I.book_id = B.book_id;

                                                                ##-- Aggregate Functions--##

                                                                ##-- Total Number of Books--##
SELECT COUNT(*) AS Total_Books FROM Book;

                                                                  ##-- Maximum Book Price--##
SELECT MAX(price) AS Maximum_Price FROM Book;

                                                                    ##-- Minimum Book Price--##
SELECT MIN(price) AS Minimum_Price FROM Book;

                                                              ##-- Average Book Price--##
SELECT AVG(price) AS Average_Price FROM Book;

                                                          ##-- Sum of All Book Prices--##
SELECT SUM(price) AS Total_Price FROM Book;

                                                            ##-- Fine Calculation Query--##

                                                      ##-- Calculate Fine Amount for Late Return--##
                                                      ##-- Rule: Fine is 10 Rs per day after Return Date--##

SELECT R.return_id, I.return_date, R.actual_return_date,
DATEDIFF(R.actual_return_date, I.return_date) AS Days_Late,
CASE 
    WHEN DATEDIFF(R.actual_return_date, I.return_date) > 0 
    THEN DATEDIFF(R.actual_return_date, I.return_date) * 10
    ELSE 0
END AS Fine_Amount
FROM Issue I
JOIN ReturnBook R ON I.issue_id = R.issue_id;
