CREATE DATABASE IF NOT EXISTS JoinDB;

USE JoinDB;

CREATE TABLE IF NOT EXISTS customers1 (
	custID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE);
    
ALTER TABLE customers1
ADD CONSTRAINT chk_email CHECK (email LIKE '%@%.com' OR email LIKE '%@%.%');

INSERT INTO customers1 (name, email)
	VALUES ('Raju', 'raju@gmail.com'),
			('Sham', 'sham@yahoo.com'),
            ('Baburao', 'baburao@gmail.ac.in'),
            ('Paul', 'paul@yahoo.co.in'),
            ('Alex', 'alex@gmail.edu');

CREATE TABLE IF NOT EXISTS orders1 (
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    orderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    shippedDate DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    custID INT NOT NULL,
    CONSTRAINT chk_shipDate CHECK (shippedDate >= DATE_FORMAT(orderDate, '%Y-%m-%d')));
    
ALTER TABLE orders1
ADD CONSTRAINT fk_custID FOREIGN KEY (custID) REFERENCES customers1 (custID);

ALTER TABLE orders1
ADD CONSTRAINT chk_price CHECK (price > 0);

/*	ALTER TABLE orders1
	DROP CONSTRAINT chk_shipDate;	*/

INSERT INTO orders1 (shippedDate, price, custID)
	VALUES ('2025-09-02', 345.45, 1),
			('2025-08-31', 199.50, 1),
            ('2025-08-31', 550.68, 3),
            ('2025-08-29', 999.50, 1),
            ('2025-09-12', 100, 4),
            ('2025-09-02', 700, 3),
            ('2025-09-08', 502, 5),
            ('2025-09-12', 1084.88, 5);
            
INSERT INTO customers1 (name, email)
	VALUES ('Raju', 'rajusingh@gmail.com');

INSERT INTO orders1 (shippedDate, price, custID)
	VALUES ('2025-09-04', 645.45, 6);

-- cross join
SELECT COUNT(*) FROM customers1, orders1;	-- 40 (5 * 8)
SELECT
	c.custID, c.name, c.email, o.orderID,
    o.orderDate, o.shippedDate, o.price, o.custID
FROM customers1 AS `c`
CROSS JOIN orders1 AS `o`;


-- inner join
-- Only customers who have at least one order are returned.
SELECT
	c.custID, c.name, c.email, o.orderID,
    o.orderDate, o.shippedDate, o.price, o.custID
FROM customers1 AS `c`
CROSS JOIN orders1 AS `o`
ON c.custID = o.custID;	-- cross join with `ON` condition treat like as inner join

SELECT
	c.custID, c.name, c.email, o.orderID,
    o.orderDate, o.shippedDate, o.price, o.custID
FROM customers1 AS `c`
INNER JOIN orders1 AS `o`
ON c.custID = o.custID;

SELECT c.name, SUM(o.price) AS `Total Price`
FROM customers1 AS `c`
INNER JOIN orders1 AS `o`
ON c.custID = o.custID
GROUP BY c.custID;	-- GROUP BY primary key (custID) → safest, accurate aggregation per customer


-- left join
SELECT
	c.custID, c.name, c.email, o.orderID,
    o.orderDate, o.shippedDate, o.price, o.custID
FROM customers1 AS `c`
LEFT JOIN orders1 AS `o`
ON c.custID = o.custID;

SELECT c.name, IFNULL(SUM(o.price), 0) AS `Total Price`
FROM customers1 AS `c`
LEFT JOIN orders1 AS `o`
ON c.custID = o.custID
GROUP BY c.custID;

-- right join
SELECT
	c.custID, c.name, c.email, o.orderID,
    o.orderDate, o.shippedDate, o.price, o.custID
FROM customers1 AS `c`
RIGHT JOIN orders1 AS `o`
ON c.custID = o.custID;


-- self join
SELECT a.name, a.email
FROM customers1 AS `a`
JOIN customers1 AS `b`
ON a.custID = b.custID;


-- union (do not show duplicate records)
SELECT
	c.custID, c.name, c.email, o.orderID,
    o.orderDate, o.shippedDate, o.price, o.custID
FROM customers1 AS `c`
LEFT JOIN orders1 AS `o`
ON c.custID = o.custID
UNION
SELECT
	c.custID, c.name, c.email, o.orderID,
    o.orderDate, o.shippedDate, o.price, o.custID
FROM customers1 AS `c`
RIGHT JOIN orders1 AS `o`
ON c.custID = o.custID;

-- union all (show duplicate records)
SELECT
	c.custID, c.name, c.email, o.orderID,
    o.orderDate, o.shippedDate, o.price, o.custID
FROM customers1 AS `c`
LEFT JOIN orders1 AS `o`
ON c.custID = o.custID
UNION ALL
SELECT
	c.custID, c.name, c.email, o.orderID,
    o.orderDate, o.shippedDate, o.price, o.custID
FROM customers1 AS `c`
RIGHT JOIN orders1 AS `o`
ON c.custID = o.custID;



drop table orders1;
DESC customers1;
DESC orders1;
SELECT * FROM customers1;
SELECT * FROM orders1;
