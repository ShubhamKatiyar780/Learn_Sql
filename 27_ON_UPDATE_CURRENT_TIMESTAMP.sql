-- use the database
USE employees;

CREATE TABLE IF NOT EXISTS blogs(
	Blog VARCHAR(500), 
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME ON UPDATE CURRENT_TIMESTAMP
    );
    
-- insert a record
INSERT INTO blogs (Blog)
VALUES ('This is my first blog.');

-- update record
UPDATE blogs
SET Blog = 'This is my first blog from US.';

-- update record
UPDATE blogs
SET Blog = 'This is my first blog from India.';

SELECT * FROM blogs;