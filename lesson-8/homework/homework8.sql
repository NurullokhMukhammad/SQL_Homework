-- EASY LEVEL TASKS -- 

1) Using Products table, find the total number of products available in each category.

Solution: 

SELECT Category,
    COUNT(*) AS NumberOfProducts FROM Products
GROUP BY Category
ORDER BY NumberOfProducts DESC;

2) Using Products table, get the average price of products in the 'Electronics' category.
Solution: 
  SELECT COUNT(*) AS NumberOfElectronicsProducts,
 ROUND(AVG(Price), 2) AS AveragePrice FROM Products
WHERE Category = 'Electronics';



3) Using Customers table, list all customers from cities that start with 'L'.
Solution: 

SELECT 
    CustomerID,
    FirstName,
    LastName,
    City,
    Country
FROM Customers
WHERE City LIKE 'L%'
ORDER BY City, LastName;

4) Using Products table, get all product names that end with 'er'.
Solution:
  
SELECT 
    ProductID,
    ProductName,
    Price,
    Category
FROM Products
WHERE ProductName LIKE '%er'
ORDER BY ProductName;



5) Using Customers table, list all customers from countries ending in 'A'.
  Solution: 

SELECT 
    CustomerID,
    FirstName,
    LastName,
    Country,
    City
FROM 
    Customers
WHERE 
    Country LIKE '%a'
ORDER BY 
    Country, LastName;

6) Using Products table, show the highest price among all products.

  Solution: 
  	SELECT 
    ProductID,
    ProductName,
    Price,
    Category
FROM 
    Products
WHERE 
    Price = (SELECT MAX(Price) FROM Products);



7) Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
Solution: 

  
	SELECT 
    ProductID,
    ProductName,
    StockQuantity,
    CASE 
        WHEN StockQuantity < 30 THEN 'Low Stock'
        ELSE 'Sufficient'
    END AS StockStatus
FROM 
    Products
ORDER BY 
    StockQuantity;



8) Using Customers table, find the total number of customers in each country.
  Solution: 

  	SELECT 
    Country,
    COUNT(*) AS NumberOfCustomers
FROM 
    Customers
GROUP BY 
    Country
ORDER BY 
    NumberOfCustomers DESC, Country;


9) Using Orders table, find the minimum and maximum quantity ordered.

Solution: 

SELECT 
    MIN(Quantity) AS MinimumQuantityOrdered,
    MAX(Quantity) AS MaximumQuantityOrdered
FROM 
    Orders;

-- MEDIUM LEVEL TASKS -- 

10) Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
Solution: 


	SELECT DISTINCT o.CustomerID
FROM Orders o
LEFT JOIN Invoices i ON o.CustomerID = i.CustomerID 
    AND i.InvoiceDate BETWEEN '2023-01-01' AND '2023-01-31'
WHERE 
    o.OrderDate BETWEEN '2023-01-01' AND '2023-01-31'
    AND i.CustomerID IS NULL;

11) Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
Solution: 


	SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted
ORDER BY ProductName;

12) Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
Solution: 
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted
ORDER BY ProductName;

13) Using Orders table, find the average order amount by year.
Solution: 

SELECT 
    YEAR(OrderDate) AS OrderYear,
    ROUND(AVG(TotalAmount), 2) AS AverageOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

14) Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.

Solution: 

SELECT 
    ProductName,
    Price,
    CASE 
        WHEN Price < 100 THEN 'Low'
        WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
        WHEN Price > 500 THEN 'High'
    END AS PriceGroup
FROM Products
ORDER BY Price DESC;

15) Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table
Solution: 


SELECT 
    district_id,
    district_name,
    MAX(CASE WHEN year = '2012' THEN population ELSE NULL END) AS [2012],
    MAX(CASE WHEN year = '2013' THEN population ELSE NULL END) AS [2013]
FROM City_Population
GROUP BY district_id, district_name
ORDER BY district_id;

-- Create the new table
CREATE TABLE Population_Each_Year (
    district_id INT,
    district_name VARCHAR(30),
    [2012] DECIMAL(10,2),
    [2013] DECIMAL(10,2)
);

-- Insert the pivoted data
INSERT INTO Population_Each_Year
SELECT 
    district_id,
    district_name,
    MAX(CASE WHEN year = '2012' THEN population ELSE NULL END) AS [2012],
    MAX(CASE WHEN year = '2013' THEN population ELSE NULL END) AS [2013]
FROM City_Population
GROUP BY district_id, district_name
ORDER BY district_id;

16) Using Sales table, find total sales per product Id.
Solution: 


SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID
ORDER BY TotalSales DESC;

17) Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
Solution: 
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%'
ORDER BY ProductName;










