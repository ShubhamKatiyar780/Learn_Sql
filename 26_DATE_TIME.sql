-- Retrieving Current Date & Time
SELECT NOW();	-- Current date and time
SELECT CURDATE();	-- Current date only
SELECT CURTIME();	-- Current Time only

USE employees;

DESCRIBE orders;

-- modify id column
ALTER TABLE orders MODIFY id INT AUTO_INCREMENT;

-- add 2 more columns
ALTER TABLE orders ADD COLUMN  orderDate DATE;
ALTER TABLE orders ADD COLUMN deliveryTime DATETIME;

INSERT INTO orders (customerId, orderDate, deliveryTime)
	VALUES (2, '2022-07-20', NOW());
INSERT INTO orders (customerId, orderDate, deliveryTime)
	VALUES (3, '2025-08-20', NOW());

-- Extracting year, month, day, hour
SELECT
YEAR(orderDate) AS orderYear,
MONTH(orderDate) AS orderMonth,
DAY(orderDate) AS orderDay,
DAYNAME(orderDate) AS orderDayName
FROM orders
WHERE orderDate IS NOT NULL;

-- Formatting Dates
SELECT DATE_FORMAT(NOW(), '%W %D-%M-%Y');	-- 'Wednesday 27th-August-2025'
SELECT DATE_FORMAT(NOW(), '%w %y/%m/%d');	-- '3 25/08/27'
SELECT DATE_FORMAT(NOW(), '%h:%i:%s');	-- '06:54:04'
SELECT DATE_FORMAT(NOW(), '%H:%I:%S');	-- '18:06:58'
SELECT DATE_FORMAT(NOW(), '%D %a at %T');	-- '27th Wed at 19:23:26'
SELECT DATE_FORMAT(NOW(), '%W %D-%b-%Y');	-- 'Wednesday 27th-Aug-2025'
SELECT DATE_FORMAT(NOW(), '%W %D-%c-%Y');	-- 'Wednesday 27th-8-2025'

-- Date Arithmetic (add, subtract and difference dates/times)
SELECT DATE_ADD('2025-08-27', INTERVAL 7 DAY);  -- 2025-09-03
SELECT DATE_SUB('2025-08-27', INTERVAL 1 MONTH); -- 2025-07-27
SELECT DATEDIFF('2025-12-31', '2025-08-27');  -- 126 days

-- Special Date Functions
SELECT LAST_DAY('2025-08-27');   -- 2025-08-31 (Last day of given month)
SELECT WEEK('2025-08-27');       -- 35 (Week number of year)
SELECT QUARTER('2025-08-27');    -- 3 (Quarter of year)
SELECT DAYOFYEAR('2025-08-27');	-- 239 (Day number in year)

-- only DATE compare with DATETIME using DATE_FORMAT()
SELECT * FROM orders WHERE DATE_FORMAT(deliveryTime, '%Y-%m-%d') = '2025-08-27';


SELECT * FROM orders;