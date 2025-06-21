- - EASY LEVEL TASKS - - 

1) Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
SOLUTION:

select 
    E.Name as EmployeeName,
    E.Salary,
    D.DepartmentName
from Employees E
join Departments D on E.DepartmentID = D.DepartmentID
where E.Salary > 50000;

2) Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
🔁 Expected Columns: FirstName, LastName, OrderDate
solution: 

select 
    C.FirstName,
    C.LastName,
    O.OrderDate
from Customers C
join Orders O on C.CustomerID = O.CustomerID
where year(O.OrderDate) = 2023;

3) Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
🔁 Expected Columns: EmployeeName, DepartmentName
solution: 

SELECT 
    E.Name AS EmployeeName,
    D.DepartmentName
FROM 
    Employees E
LEFT JOIN 
    Departments D ON E.DepartmentID = D.DepartmentID;


4) Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.
🔁 Expected Columns: SupplierName, ProductName
Solution: 

SELECT 
    S.SupplierName,
    P.ProductName
FROM Suppliers S
LEFT JOIN Products P ON S.SupplierID = P.SupplierID;

5) Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.
🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
Solution: 

SELECT 
    O.OrderID,
    O.OrderDate,
    P.PaymentDate,
    P.Amount
FROM Orders O
FULL OUTER JOIN Payments P ON O.OrderID = P.OrderID;

6) Using the Employees table, write a query to show each employee's name along with the name of their manager.
🔁 Expected Columns: EmployeeName, ManagerName
Solution:

SELECT 
    E.Name AS EmployeeName,
    M.Name AS ManagerName
FROM Employees E
LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID;

7) Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
🔁 Expected Columns: StudentName, CourseName

Solution: 

SELECT 
    S.Name AS StudentName,
    C.CourseName
from Enrollments E
JOIN Students S ON E.StudentID = S.StudentID
JOIN Courses C ON E.CourseID = C.CourseID
where C.CourseName = 'Math 101';

8) Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
🔁 Expected Columns: FirstName, LastName, Quantity

Solution: 


SELECT 
    C.FirstName,
    C.LastName,
    O.Quantity
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE O.Quantity > 3;

9) Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
🔁 Expected Columns: EmployeeName, DepartmentName
Solution: 

SELECT 
    E.Name AS EmployeeName,
    D.DepartmentName
from Employees E
join Departments D ON E.DepartmentID = D.DepartmentID
where D.DepartmentName = 'Human Resources';

-- medium level tasks -- 

10) Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
🔁 Expected Columns: DepartmentName, EmployeeCount
solution:

SELECT 
    D.DepartmentName,
    COUNT(E.EmployeeID) AS EmployeeCount
FROM Departments D
JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(E.EmployeeID) > 5;

11) Using the Products and Sales tables, write a query to find products that have never been sold.
🔁 Expected Columns: ProductID, ProductName
solution: 

SELECT 
    P.ProductID,
    P.ProductName
FROM Products P
LEFT JOIN Sales S ON P.ProductID = S.ProductID
WHERE S.ProductID IS NULL;

12) Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
🔁 Expected Columns: FirstName, LastName, TotalOrders



solution: 

SELECT 
    C.FirstName,
    C.LastName,
    COUNT(O.OrderID) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName, C.LastName;

13) Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
🔁 Expected Columns: EmployeeName, DepartmentName
solution: 

SELECT 
    E.Name AS EmployeeName,
    D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

14) Using the Employees table, write a query to find pairs of employees who report to the same manager.
🔁 Expected Columns: Employee1, Employee2, ManagerID
solution: 


SELECT 
    E1.Name AS Employee1,
    E2.Name AS Employee2,
    E1.ManagerID
FROM Employees E1
JOIN Employees E2 ON E1.ManagerID = E2.ManagerID 
 AND E1.EmployeeID < E2.EmployeeID
WHERE E1.ManagerID IS NOT NULL;

15) Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
🔁 Expected Columns: OrderID, OrderDate, FirstName, LastName

solution: 

SELECT 
    O.OrderID,
    O.OrderDate,
    C.FirstName,
    C.LastName
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE YEAR(O.OrderDate) = 2022;

16) Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
🔁 Expected Columns: EmployeeName, Salary, DepartmentName
solution: 


SELECT 
    E.Name AS EmployeeName,
    E.Salary,
    D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Sales'AND E.Salary > 60000;

17) Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
solution: 

SELECT 
    O.OrderID,
    O.OrderDate,
    P.PaymentDate,
    P.Amount
FROM Orders O
INNER JOIN Payments P ON O.OrderID = P.OrderID;

18) Using the Products and Orders tables, write a query to find products that were never ordered.
🔁 Expected Columns: ProductID, ProductName
solution: 

SELECT 
    P.ProductID,
    P.ProductName
FROM Products P
LEFT JOIN Orders O ON P.ProductID = O.ProductID
WHERE O.ProductID IS NULL;

-- hard level tasks -- 

19) Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.
🔁 Expected Columns: EmployeeName, Salary

solution: 
SELECT 
    E.Name AS EmployeeName,
    E.Salary
FROM Employees E
JOIN (
    SELECT 
        DepartmentID,
        AVG(Salary) AS AvgSalary
    FROM Employees
  GROUP BY DepartmentID
) DAvg ON E.DepartmentID = DAvg.DepartmentID
WHERE E.Salary > DAvg.AvgSalary;

20) Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
🔁 Expected Columns: OrderID, OrderDate
solution: 
SELECT 
    O.OrderID,
    O.OrderDate
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE 
    O.OrderDate < '2020-01-01'
    AND P.PaymentID IS NULL;

21) Using the Products and Categories tables, write a query to return products that do not have a matching category.
🔁 Expected Columns: ProductID, ProductName
solution: 

	SELECT 
    P.ProductID,
    P.ProductName
FROM Products P
LEFT JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryID IS NULL;

22) Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
🔁 Expected Columns: Employee1, Employee2, ManagerID, Salary

solution: 


SELECT 
    E1.EmployeeName AS Employee1,
    E2.EmployeeName AS Employee2,
    E1.ManagerID,
    E1.Salary
FROM Employees E1
JOIN 
    Employees E2 
    ON E1.ManagerID = E2.ManagerID 
    AND E1.EmployeeID < E2.EmployeeID
WHERE 
    E1.Salary > 60000 AND E2.Salary > 60000;

23) Using the Employees and Departments tables, write a query to return employees who work in departments which name starts with the letter 'M'.
🔁 Expected Columns: EmployeeName, DepartmentName
solution: 


	SELECT 
    E.EmployeeName,
    D.DepartmentName
FROM Employees E
JOIN 
    Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName LIKE 'M%';

24) Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
🔁 Expected Columns: SaleID, ProductName, SaleAmount


solution:

SELECT 
    S.SaleID,
    P.ProductName,
    S.SaleAmount
FROM Sales S
JOIN 
    Products P ON S.ProductID = P.ProductID
WHERE S.SaleAmount > 500;

25) Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.
🔁 Expected Columns: StudentID, StudentName

solution:
SELECT 
    S.StudentID, 
    S.StudentName
FROM Students S
WHERE 
    S.StudentID NOT IN (
        SELECT 
            E.StudentID
        FROM SELECT 
    P.ProductID,
    P.ProductName,
    C.CategoryName
FROM 
    Products P
INNER JOIN 
    Categories C ON P.CategoryID = C.CategoryID
WHERE 
    C.CategoryName IN ('Electronics', 'Furniture');
            Enrollments E
        JOIN 
            Courses C ON E.CourseID = C.CourseID
        WHERE 
            C.CourseName = 'Math 101'
    );

26) Using the Orders and Payments tables, write a query to return orders that are missing payment details.
🔁 Expected Columns: OrderID, OrderDate, PaymentID
solution: 
	SELECT 
    O.OrderID, 
    O.OrderDate, 
    P.PaymentID
FROM Orders O
LEFT JOIN 
    Payments P ON O.OrderID = P.OrderID
WHERE P.PaymentID IS NULL;

27) Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
🔁 Expected Columns: ProductID, ProductName, CategoryName
solution: 





