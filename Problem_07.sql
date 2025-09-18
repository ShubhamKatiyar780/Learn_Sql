-- 	Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
USE employees;

CREATE TABLE Email (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);
drop table Persons;
INSERT INTO Email (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

SET SQL_SAFE_UPDATES = 0;

DELETE e1
FROM Email AS e1
JOIN Email AS e2
  ON e1.email = e2.email
AND e1.id > e2.id;

SELECT * FROM Email;

SET SQL_SAFE_UPDATES = 1;