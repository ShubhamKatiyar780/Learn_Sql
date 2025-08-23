USE ecommerce;
CREATE TABLE IF NOT EXISTS Customers (
	Customer_Name VARCHAR(50),
    Product VARCHAR(50)
);
INSERT INTO Customers (Customer_Name, Product)
	VALUES ('C1', 'P1'),
		   ('C1', 'P2'),
           ('C2', 'P2'),
           ('C2', 'P3'),
           ('C3', 'P2'),
           ('C3', 'P3'),
           ('C3', 'P4'),
           ('C4', 'P4');

CREATE TABLE IF NOT EXISTS Products (
    Product VARCHAR(50),
    Price INT
);
INSERT INTO Products (Product, Price)
	VALUES ('P1', 100),
		   ('P2', 200),
           ('P3', 300),
           ('P4', 400);

# get the list of Customres who have purchased more than 1 products which they have purchased is price above 100.
# Also order the customers by number of products they have purchased in descending order
           
# join both tables with price grater than 100
SELECT
	C.Customer_Name,
	C.Product, P.Price
FROM Customers AS C
INNER JOIN Products AS P
ON C.Product = P.Product
WHERE P.Price > 100;

SELECT 
	C.Customer_Name 
FROM Customers AS C
INNER JOIN Products AS P
ON C.Product = P.Product
WHERE P.Price > 100
GROUP BY C.Customer_Name
HAVING COUNT(C.Product) > 1
ORDER BY COUNT(C.Product) DESC;
