--- EASY LEVEL TASKS --- 

1) Write a query to find the minimum (MIN) price of a product in the Products table
Solution: 

select min(Price) as minimum_price
from Products;

2) Write a query to find the maximum (MAX) Salary from the Employees table
Solution:

select max(salary) as maximumSalary
from Employees;

3) Write a query to count the number of rows in the Customers table
Solution:
select count(*) as totalCustomers
from Customers;

4) Write a query to count the number of unique product categories from the Products table
Solution: 

select count(distinct category) as uniqueCategories
from Products;

5) Write a query to find the total sales amount for the product with id 7 in the Sales table
Solution: 

select sum(quantity * price) as totalSalesAmount
from sales
where productId = 7;


6) Write a query to calculate the average age of employees in the Employees table
Solution: 

select avg(age) as averageAge
from Employees;

7) Write a query to count the number of employees in each department
Solution:

select department, count(*) as employeeCount
from Employees
group by department;

8) Write a query to show the minimum and maximum Price of products grouped by Category. Use products table
Solution:

select category, 
       min(price) as minimumPrice, 
       max(price) as maximumPrice
from Products
group by category;

9) Write a query to calculate the total sales per Customer in the Sales table
Solution:

select customerId, sum(quantity * price) as totalSales
from Sales
group by customerId;

10) Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you don't have DeptName)
  Solution:

select deptId, count(*) as employeeCount from Employees
group by deptId
having count(*) > 5;


  --- MEDIUM LEVEL TASKS ---

  11)Write a query to calculate the total sales and average sales for each product category from the Sales table
  Solution: 

  select category,
       sum(quantity * price) as totalSales,
       avg(quantity * price) as averageSales
from Sales
group by category;

  12) Write a query to count the number of employees from the Department HR

Solution: 

select count(*) as hrEmployeeCount
from Employees
where department = 'HR';

  13) Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName)
Solution: 

select deptId,
       max(salary) as highestSalary,
       min(salary) as lowestSalary
from Employees
group by deptId;

14) Write a query to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName)
  Solution: 

  
select deptId,
       avg(salary) as averageSalary
from Employees
group by deptId;

  15) Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName)
Solution: 

select deptId,
       avg(salary) as averageSalary,
       count(*) as employeeCount
from Employees
group by deptId;

16) Write a query to filter product categories with an average price greater than 400
Solution: 

select category,
       avg(price) as averagePrice
from Products
group by category
having avg(price) > 400;

17) Write a query that calculates the total sales for each year in the Sales table
Solution: 

select year(saleDate) as saleYear,
       sum(quantity * price) as totalSales
from Sales
group by year(saleDate)
order by saleYear;

18) Write a query to show the list of customers who placed at least 3 orders
Solution: 

select customerId,
       count(*) as orderCount
from Sales
group by customerId
having count(*) >= 3;

19) Write a query to filter out Departments with average salary expenses greater than 60000.(DeptID is enough, if you don't have DeptName)
  Solution: 

  select deptId,
       avg(salary) as averageSalary
from Employees
group by deptId
having avg(salary) > 60000;

  --- HARD LEVEL TASKS --- 

  20) Write a query that shows the average price for each product category, and then filter categories with an average price greater than 150
  Solution: 

  select category,
       avg(price) as averagePrice
from products
group by category
having avg(price) > 150;


  21) Write a query to calculate the total sales for each Customer, then filter the results to include only Customers with total sales over 1500
  Solution: 

  select customerId,
       sum(quantity * price) as totalSales
from sales
group by customerId
having sum(quantity * price) > 1500;



  

  



  




  

  
 



