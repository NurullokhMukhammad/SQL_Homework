EASY LEVEL TASKS 

1)Define and explain the purpose of BULK INSERT in SQL Server

BULK INSERT is a Transact-SQL (T-SQL) command used in SQL Server to efficiently import large volumes of data from a data file (like a CSV, TXT, or other flat files) directly into a database table or view.
Purpose of BULK INSERT:
High-Speed Data Import: It allows fast and efficient loading of massive datasets compared to row-by-row inserts.
Data Migration: Used to migrate data from external sources (like legacy systems or exported reports) into SQL Server
ETL Processes: Frequently used in Extract, Transform, Load (ETL) processes to populate data warehouses.
Data Integration: Helpful when integrating third-party datasets delivered in file format into your database.

2)List four file formats that can be imported into SQL Server

1. CSV (Comma-Separated Values): one of the most common formats for tabular data.
2. TXT (Plain Text File): ext files with custom delimiters (e.g., tab-separated or pipe-delimited)
3. Excel Files (.xls, .xlsx): Can be imported using SQL Server Import and Export Wizard, or via OPENROWSET and linked servers
4. XML (Extensible Markup Language): Structured data format used for hierarchical data.

3) Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2))
 Here is the solution:
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

4) Insert three records into the Products table using INSERT INTO
Solution: 
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (1, 'MacBook Pro M1', 999.99),
       (2, 'iPhone 16', 799.50),
       (3, 'AirPods 3', 89.90);

5) Explain the difference between NULL and NOT NULL
Solution: 
NULL - Represents missing, unknown, or undefined value and used when data may not be available at the time of entry. If not specified, most columns allow NULL by default
NOT NULL - ensures a column must have a value (cannot be empty). Used when a value is required for every row. You must explicitly set NOT NULL to enforce required data

6) Add a UNIQUE constraint to the ProductName column in the Products table
Solution:
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

7)Write a comment in a SQL query explaining its purpose
-- ALTER TABLE Products: Modifies the existing Products table
-- ADD CONSTRAINT UQ_ProductName: Adds a named constraint (UQ_ProductName)
-- UNIQUE (ProductName): Ensures all values in ProductName are unique (no duplicates allowed)

8)Add CategoryID column to the Products table
Solution: 
ALTER TABLE Products
ADD CategoryID INT;

9)Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE
Solution: 
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

10) Explain the purpose of the IDENTITY column in SQL Server
The IDENTITY property in SQL Server is used to auto-generate unique numeric values for a column, typically for primary keys
Auto-Increment Primary Keys: automatically assigns a new, unique value for each inserted row.
  Ensures Uniqueness:each value is unique (unless explicitly overridden), which helps maintain row identity.
  Simplifies Data Entry: you don’t need to specify the ID value when inserting a new record.
  Efficient for Surrogate Keys: often used for keys that have no business meaning but uniquely identify rows.

  MEDIUM LEVEL TASKS 

11) Use BULK INSERT to import data from a text file into the Products table
solution: 

BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

12) Create a FOREIGN KEY in the Products table that references the Categories table.
solution: 
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


13)Explain the differences between PRIMARY KEY and UNIQUE KEY.
  
  PRIMARY KEY is the main unique identifier for rows, mandatory and not nullable.
  UNIQUE KEY enforces uniqueness but allows NULL values and multiple unique constraints per table.
  
14)Add a CHECK constraint to the Products table ensuring Price > 0.
solution: 
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive
CHECK (Price > 0);

15) Modify the Products table to add a column Stock (INT, NOT NULL).
  solution: 
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

16) Use the ISNULL function to replace NULL values in Price column with a 0
solution: 
SELECT ProductID,
       ProductName,
       ISNULL(Price, 0) AS Price,
       CategoryID,
       Stock
FROM Products;

17) Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.

  A FOREIGN KEY constraint is used to enforce referential integrity between two tables. It ensures that the values in a column (or a set of columns) in one table (called the child or referencing table) correspond to values in a column (usually the primary key) of another table (called the parent or referenced table).

  Maintain data consistency: Prevents invalid data that doesn’t match existing records in the parent table.
  Enforce relationships: Represents real-world relationships between entities, e.g., each order must be linked to a valid customer.
  Prevent orphan records: Avoids records in the child table that do not have corresponding records in the parent table.
  Enable cascading actions: Supports automatic updates or deletes in child rows when the parent row changes (with ON DELETE or ON UPDATE rules).







