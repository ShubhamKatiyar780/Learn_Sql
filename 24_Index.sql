-- INDEX

-- Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update).
-- So, only create indexes on columns that will be frequently searched against.

/*------------Syntax------------
-- Create a simple index
CREATE INDEX i_name ON table_name (column1, column2,.....);

-- Create a unique index (does not allow duplicate values)
CREATE UNIQUE INDEX i_name ON table_name (column);

-- show indexes
SHOW INDEX FROM table_name;
SHOW INDEXES FROM table_name;

-- Drop (delete) an index
DROP INDEX i_name ON table_name;
ALTER TABLE table_name DROP INDEX index_name;

*/

USE ecommercedb;

-- create an INDEX
CREATE INDEX idx_OrderID ON orderdetails (OrderID);

SELECT OrderID FROM orderdetails WHERE OrderID = 10734;

-- drop(delete) an INDEX
DROP INDEX idx_OrderID ON orderdetails;
ALTER TABLE orderdetails DROP INDEX idx_OrderID;

-- show indexes
SHOW INDEX FROM orderdetails;
SHOW INDEXES FROM orderdetails;

describe orderdetails;

ALTER TABLE orderdetails
DROP INDEX idx_OrderID;
