BASIC LEVEL TASKS 

1) CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);

2) INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Alice Johnson', 55000.00);

INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
    (3, 'Charlie Davis', 47000.75),
    (4, 'Diana Moore', 53000.25);
3) Update the Salary of an employee to 7000 where EmpID = 1.
 
Here is the solution:
UPDATE Employees
SET Salary = 7000.00
WHERE EmpID = 1;

4) Delete a record from the Employees table where EmpID = 2.
Here is the solution:
DELETE FROM Employees
WHERE EmpID = 2;

5) Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
Here is the solution:

DELETE is used to remove specific rows from a table based on a condition. You can use a WHERE clause to target certain records. The table structure remains, and this operation can often be rolled back if used within a transaction.
TRUNCATE removes all rows from a table quickly without logging individual row deletions. It resets any auto-increment counters and cannot use a WHERE clause. Unlike DELETE, it usually cannot be rolled back.
DROP completely removes a table from the database, including its structure and data. Once executed, the table no longer exists, and this action cannot be undone.

6) Modify the Name column in the Employees table to VARCHAR(100)
Here is the solution:

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

7) Add a new column Department (VARCHAR(50)) to the Employees table
Here is the solution:
ALTER TABLE Employees
ADD Department VARCHAR(50);

8) Change the data type of the Salary column to FLOAT
Here is the solution:
ALTER TABLE Employees
	ALTER COLUMN Salary FLOAT;

9)Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50))
Here is the solution:
	CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

10) Remove all records from the Employees table without deleting its structure
Here is the solution:
DELETE FROM Employees;

INTERMEDIATE LEVEL TASKS

11) Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
Here is the solution:
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'Human Resources' UNION ALL
SELECT 2, 'Finance' UNION ALL
SELECT 3, 'IT Support' UNION ALL
SELECT 4, 'Marketing' UNION ALL
SELECT 5, 'Sales';

12) Update the Department of all employees where Salary > 5000 to 'Management'.
Here is the solution:
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

13) Write a query that removes all employees but keeps the table structure intact.
Here is the solution: 

DELETE FROM Employees;


14) Drop the Department column from the Employees table.
Here is the solution:
ALTER TABLE Employees
DROP COLUMN Department;

15) Rename the Employees table to StaffMembers using SQL commands.
Here is the solution:
EXEC sp_rename 'Employees', 'StaffMembers';

16) Write a query to completely remove the Departments table from the database.
Here is the solution:
DROP TABLE Departments;

ADVANCED LEVEL TASKS

17) Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
Here is the solution: 
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
18)Add a CHECK constraint to ensure Price is always greater than 0.
Here is the solution:
ALTER TABLE Products
ADD CONSTRAINT chk_price_positive CHECK (Price > 0);

19) Modify the table to add a StockQuantity column with a DEFAULT value of 50.
Here is the solution:
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

20) Rename Category to ProductCategory
Here is the Solution:
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

21) Insert 5 records into the Products table using standard INSERT INTO queries.
Here is the Solution:
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES
(1, 'Wireless Mouse', 'Electronics', 25.99, 100);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES
(2, 'Bluetooth Speaker', 'Electronics', 45.50, 75);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES
(3, 'Coffee Mug', 'Kitchenware', 8.99, 200);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES
(4, 'Notebook', 'Stationery', 2.50, 500);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity) VALUES
(5, 'Desk Lamp', 'Furniture', 30.00, 60);

22)Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
Here is the Solution:
SELECT *
INTO Products_Backup
FROM Products;

23) Rename the Products table to Inventory.
Here is the solution:
EXEC sp_rename 'Products', 'Inventory';

24) Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
Here is the solution :
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

25) Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
Here is the solution :

ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);

