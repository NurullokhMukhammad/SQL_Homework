---EASY LEVEL TASKS ---

1)Write a query to select the top 5 employees from the Employees table
solution: 
select top 5 *from Employees

2)Use SELECT DISTINCT to select unique Category values from the Products table
Solution:
select distinct Category from Products

3) Write a query that filters the Products table to show products with Price > 100
Solution: 
select *from Products
where Price > 100

4)Write a query to select all Customers whose FirstName start with 'A' using the LIKE operator
Solution: 
select *from Customers 
where FirstName like 'A%'

5)Order the results of a Products table by Price in ascending order
Solution:
select *from Products order by Price asc;

6)Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and Department = 'HR'
Solution: 
select *from Employees 
where Salary >= 60000 and Department ='HR';

7)Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table
Solution:
select
    ID,
    FirstName,
    Department,
    Salary,
    PhoneNumber,
    ISNULL(Email, 'noemail@example.com') as Email
from Employees;

8)Write a query that shows all products with Price BETWEEN 50 AND 100
Solution:

select *from Products
where Price>=40 and Price <=100;

9)Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table
Solution: 
select distinct Category, productName from Products;

10) After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.
  Solution:

select distinct Category, productName from Products order by productName desc;

--- MEDIUM LEVEL TASKS ---

11) Write a query to select the top 10 products from the Products table, ordered by Price DESC
Solution:
select top 10 * from Products order by Price desc;

12) Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table
Solution: 
SELECT 
    ID,
    COALESCE(FirstName, LastName) AS Name,
    Department,
    Salary,
    PhoneNumber,
    Email
FROM Employees;

13)Write a query that selects distinct Category and Price from the Products table
Solution:
Write a query that selects distinct Category and Price from the Products table

14) Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'
Solution: 
select *from Employees 
where (Age between 30 and 40) or Department = 'Marketing';

15) Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC
Solution: 
select *from Employees
order by Salary desc offset 10 rows fetch next 10 rows only

16) Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order
Solution: 
select *from Products 
where Price <=1000 and Stock >50 order by Stock desc;

17) Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
  Solution: 
Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.

  18) Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'
Solution:
select *from Employees
where Department in ('HR','IT', 'Finance');

19) Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.Use customers table
Solution:
SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;


--- HARD LEVEL TASKS ---

20) Write a query that selects the top 5 products with the highest sales, using TOP(5) and ordered by SalesAmount DESC
Solution:
select top(5) *from Products order by SalesAmount Desc

21) Combine FirstName and LastName into one column named FullName in the Employees table. (only in select statement)
Solution:
SELECT 
  FirstName + ' ' + LastName AS FullName
FROM Employees;


22) Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.
  Solution: 
SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50;


23) Write a query that selects products whose Price is less than 10% of the average price in the Products table. (Do some research on how to find average price of all products)
Solution: 
SELECT *
FROM Products
WHERE Price < (SELECT AVG(Price) * 0.10 FROM Products);


24)Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
  Solution: 

SELECT *
FROM Employees
WHERE Age < 30
  AND Department IN ('HR', 'IT');


25) Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
  Solution:
SELECT *
FROM Customers
WHERE Email LIKE '%@gmail.com';


26)Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.
Solution:
SELECT *
FROM Employees
WHERE Salary > ALL (
    SELECT Salary
    FROM Employees
    WHERE Department = 'Sales'
);





