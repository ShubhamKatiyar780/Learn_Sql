-- ALL, ANY, AND, OR and EXISTS

USE ecommercedb;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Orders WHERE customer_id = 'HUNGC';
SELECT * FROM Orders WHERE customer_id = 'HANAR';

-- ALL
SELECT customer_id, ship_country
FROM Orders
WHERE customer_id >= ALL
(SELECT CustomerID FROM Customers WHERE CustomerID LIKE 'H%' AND CustomerID LIKE '%N%');

-- ANY
SELECT ProductName 
FROM Products
WHERE SupplierID = ANY
(SELECT ProductID FROM OrderDetails WHERE Quantity = 10);

-- AND
SELECT CustomerID, ContactName FROM Customers WHERE CustomerID LIKE 'H%' AND CustomerID LIKE '%N%';

-- OR
SELECT CustomerID, ContactName FROM Customers WHERE CustomerID LIKE 'H%' OR CustomerID LIKE '%N%';
SELECT * FROM employee1 WHERE dept = 'Account' OR dept = 'Cashier' OR dept = 'Loan';

-- EXISTS
SELECT CompanyName, ContactName FROM Customers WHERE EXISTS (SELECT CustomerID WHERE CustomerID LIKE 'H%' OR CustomerID LIKE '%N%');
