-- EASY LEVEL TASKS -- 

1) Using Products, Suppliers table List all combinations of product names and supplier names.
Solution: 

SELECT 
    p.ProductName,
    s.SupplierName
FROM Products p
CROSS JOIN Suppliers s
ORDER BY p.ProductName, s.SupplierName;

2) Using Departments, Employees table Get all combinations of departments and employees.

Solution: 
SELECT 
    d.DepartmentName,
    e.Name AS EmployeeName
FROM Departments d
CROSS JOIN 
    Employees e
ORDER BY d.DepartmentName, e.Name;

3) Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
Solution: 

 SELECT 
    s.SupplierName,
    p.ProductName
FROM Products p
INNER JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY s.SupplierName, p.ProductName;

4) Using Orders, Customers table List customer names and their orders ID.

Solution: 

SELECT 
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    o.OrderID
FROM Customers c
INNER JOIN 
    Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.LastName, c.FirstName, o.OrderID;

5) Using Courses, Students table Get all combinations of students and courses.

  Solution: 

SELECT 
    s.StudentID,
    s.Name AS StudentName,
    c.CourseID, 
    c.CourseName
FROM Students s
CROSS JOIN 
    Courses c
ORDER BY s.StudentID, c.CourseID;

6) Using Products, Orders table Get product names and orders where product IDs match.

  Solution: 
SELECT 
    p.ProductName,
    o.OrderID,
    o.CustomerID,
    o.OrderDate,
    o.Quantity,
    o.TotalAmount
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID
ORDER BY p.ProductName, o.OrderDate DESC;

7) Using Departments, Employees table List employees whose DepartmentID matches the department.

  Solution: 

SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    d.DepartmentName,
    e.Salary,
    e.HireDate
FROM Employees e
INNER JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
ORDER BY d.DepartmentName, e.Name;

8) Using Students, Enrollments table List student names and their enrolled course IDs.
Solution:


SELECT 
    s.StudentID,
    s.Name AS StudentName,
    e.CourseID
FROM Students s
INNER JOIN 
    Enrollments e ON s.StudentID = e.StudentID
ORDER BY s.Name, e.CourseID;

9) Using Payments, Orders table List all orders that have matching payments.
Solution: 

  SELECT 
    o.OrderID,
    o.CustomerID,
    o.OrderDate,
    o.TotalAmount AS OrderAmount,
    p.PaymentID,
    p.PaymentDate,
    p.Amount AS PaymentAmount,
    p.PaymentMethod
FROM Orders o
INNER JOIN 
    Payments p ON o.OrderID = p.OrderID
ORDER BY o.OrderDate DESC;

10) Using Orders, Products table Show orders where product price is more than 100.
Solution: 

SELECT 
    o.OrderID,
    o.CustomerID,
    p.ProductName,
    p.Price AS ProductPrice,
    o.Quantity,
    o.TotalAmount,
    o.OrderDate
FROM Orders o
JOIN 
    Products p ON o.ProductID = p.ProductID
WHERE p.Price > 100
ORDER BY p.Price DESC, o.OrderDate DESC;

-- MEDIUM LEVEL TASKS -- 

11) Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.
  Solution:

SELECT 
    e.Name AS EmployeeName,
    e.DepartmentID AS EmployeeDeptID,
    d.DepartmentName AS EmployeeDeptName,
    d2.DepartmentID AS OtherDeptID,
    d2.DepartmentName AS OtherDeptName
FROM Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
CROSS JOIN 
    Departments d2
WHERE e.DepartmentID <> d2.DepartmentID
ORDER BY e.Name, d2.DepartmentName;

12) Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
Solution: 
SELECT 
    o.OrderID,
    o.CustomerID,
    p.ProductID,
    p.ProductName,
    p.StockQuantity AS AvailableStock,
    o.Quantity AS OrderedQuantity,
    o.TotalAmount,
    o.OrderDate
FROM Orders o
JOIN 
    Products p ON o.ProductID = p.ProductID
WHERE o.Quantity > p.StockQuantity
ORDER BY (o.Quantity - p.StockQuantity) DESC;

13) Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.

  Solution: 
SELECT 
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    s.ProductID,
    s.SaleAmount,
    s.SaleDate
FROM 
    Customers c
JOIN 
    Sales s ON c.CustomerID = s.CustomerID
WHERE s.SaleAmount >= 500
ORDER BY s.SaleAmount DESC, c.LastName;

14) Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
Solution: 

SELECT 
    s.StudentID,
    s.Name AS StudentName,
    c.CourseName,
    c.Instructor
FROM Students s
JOIN 
    Enrollments e ON s.StudentID = e.StudentID
JOIN 
    Courses c ON e.CourseID = c.CourseID
ORDER BY 
    s.Name, c.CourseName;

15) Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.

  Solution: 

	SELECT 
    p.ProductName,
    s.SupplierName,
    p.Price,
    p.StockQuantity
FROM Products p
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
WHERE 
    s.SupplierName LIKE '%Tech%'
ORDER BY 
    p.ProductName;

16) Using Orders, Payments table Show orders where payment amount is less than total amount.

  Solution: 

	SELECT 
    o.OrderID,
    o.CustomerID,
    o.TotalAmount AS OrderTotal,
    p.PaymentID,
    p.Amount AS PaymentAmount,
    (o.TotalAmount - p.Amount) AS AmountDue,
    o.OrderDate,
    p.PaymentDate
FROM  Orders o
JOIN 
    Payments p ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount
ORDER BY AmountDue DESC;

17) Using Employees and Departments tables, get the Department Name for each employee.

  Solution: 


SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    d.DepartmentName,
    e.Salary,
    e.HireDate
FROM Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
ORDER BY d.DepartmentName, e.Name;

18) Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.


  Solution: 


SELECT 
    p.ProductID,
    p.ProductName,
    p.Price,
    p.StockQuantity,
    c.CategoryName AS Category
FROM Products p
JOIN 
    Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture')
ORDER BY c.CategoryName, p.ProductName;

19) Using Sales, Customers table Show all sales from customers who are from 'USA'.

Solution: 

 SELECT 
    s.SaleID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.Country,
    s.ProductID,
    s.SaleAmount,
    s.SaleDate
FROM Sales s
JOIN 
    Customers c ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA'
ORDER BY s.SaleDate DESC, s.SaleAmount DESC;

20) Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.

Solution: 

SELECT 
    o.OrderID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.Country,
    o.TotalAmount,
    o.OrderDate,
    o.Quantity
FROM Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    c.Country = 'Germany'
    AND o.TotalAmount > 100
ORDER BY o.TotalAmount DESC, o.OrderDate;







