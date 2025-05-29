// (EASY part)

1)Data refers to raw facts, figures, or symbols that represent information but have not yet been processed or organized. Examples include numbers, text, images, and dates.

2) Data Storage and Management: 
 SQL Server efficiently stores and manages structured data using relational tables. It supports various data types, indexing, and constraints to ensure data integrity and quick access.

  Security Features:
SQL Server provides robust security features such as authentication (Windows and SQL Server authentication), authorization (role-based access control), encryption, and auditing to protect sensitive data

  Transaction Management:
It supports transactions with ACID properties (Atomicity, Consistency, Isolation, Durability), ensuring reliable data processing even in case of system failures.

 High Availability and Disaster Recovery:
Features like Always On Availability Groups, Database Mirroring, and Log Shipping help ensure continuous access to data and quick recovery in case of failures.

 Business Intelligence (BI) Tools:
SQL Server includes BI components such as SQL Server Integration Services (SSIS), Analysis Services (SSAS), and Reporting Services (SSRS) for data integration, analysis, and reporting.

3) SQL Server supports the following two main authentication modes:
  Windows Authentication:
This mode uses the Windows operating system credentials of the user to authenticate access to SQL Server. It's considered more secure because it uses Kerberos security protocol and integrates with Windows user accounts and Active Directory.

  SQL Server Authentication:
This mode requires a separate username and password defined within SQL Server. It is useful when users are not part of the Windows domain or when accessing SQL Server from non-Windows systems.

// (MEDIUM PART)

4) CREATE DATABASE SchoolDB;

5) CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

6) SQL Server is the engine that stores and processes data.
   SSMS is the interface for managing and working with SQL Server
   SQL is a programming language used to communicate with databases. It is used to write queries that create tables, insert data, update records, retrieve data, and more.

// (HARD PART)

7) DQL (Data Query Language) - used to retrieve data from the database
  Command: SELECT
   Example : SELECT * FROM Students;

   DML (Data Manipulation Language) - used to manipulate data in existing tables
   Commands: INSERT, UPDATE, DELETE
   Example: 
-- Insert a new student
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'John Doe', 20);

-- Update student's age
UPDATE Students SET Age = 21 WHERE StudentID = 1;

-- Delete a student
DELETE FROM Students WHERE StudentID = 1;

DDL (Data Definition Language) - used to define and modify the structure of database objects like tables
Commands: CREATE, ALTER, DROP
Example: 

-- Create a new table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

-- Add a new column
ALTER TABLE Students ADD Email VARCHAR(100);

-- Drop a table
DROP TABLE Courses;

DCL (Data Control Language) - used to control access to data in the database
Commands: GRANT, REVOKE
Example: 
-- Grant SELECT permission
GRANT SELECT ON Students TO User1;

-- Revoke permission
REVOKE SELECT ON Students FROM User1;


TCL (Transaction Control Language) - used to manage transactions (a sequence of SQL operations)
Commands: COMMIT, ROLLBACK, SAVEPOINT
Example: 

BEGIN TRANSACTION;

UPDATE Students SET Age = 22 WHERE StudentID = 1;

-- Save changes
COMMIT;

-- Or, undo changes
-- ROLLBACK;
8) INSERT INTO Students (StudentID, Name, Age) VALUES 
(1, 'Alice Johnson', 20),
(2, 'Brian Smith', 22),
(3, 'Catherine Lee', 19);

9) 


