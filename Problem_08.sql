-- Switch to the 'employees' database
USE employees;

-- Display the structure (schema) of the employee1 table
DESCRIBE employee1;

-- Add a salary column with default value = 25000 for all records
ALTER TABLE employee1 ADD COLUMN salary BIGINT NOT NULL DEFAULT 25000;

-- Delete the salary column if needed
-- ALTER TABLE employee1 DROP COLUMN salary;

-- Update salary values for specific employees using their empID
UPDATE employee1 SET salary = 37000 WHERE empID = 101;
UPDATE employee1 SET salary = 52000 WHERE empID = 102;
UPDATE employee1 SET salary = 25000 WHERE empID = 103;
UPDATE employee1 SET salary = 45000 WHERE empID = 104;
UPDATE employee1 SET salary = 35000 WHERE empID = 105;

-- Insert new employee records with salary values provided
INSERT INTO employee1 (fname, lname, desig, dept, salary)
	VALUES  ('Rick', 'Watt', 'Manager', 'Account', 65000),
			('John', 'Paul', 'Manager', 'IT', 75000);

-- Insert a record without specifying salary (default value 25000 will be used)
INSERT INTO employee1 (fname, lname, desig, dept)
	VALUES  ('Leena', 'Jhonson', 'Lead', 'Cashier');

-- Insert a record without specifying designation (default value 'Probation' will be used)
INSERT INTO employee1 (fname, lname, dept, salary)
	VALUES  ('Tony', 'Stark', 'Loan', 40000);

-- Retrieve all data from the employee1 table
SELECT * FROM employee1;

-- Find total employees and total salary grouped by department
SELECT
	dept AS Department,
    COUNT(empID) AS `Total Employees`,
    SUM(salary) AS `Total Salary`
FROM employee1
GROUP BY dept
ORDER BY SUM(salary) DESC;

-- Find total employees and total salary grouped by designation
SELECT
	desig AS Designation,
    COUNT(empID) AS `Total Employees`,
    SUM(salary) AS `Total Salary`
FROM employee1
GROUP BY desig
ORDER BY SUM(salary) DESC;

-- Retrieve employees whose salary is greater than 65000
SELECT
	empID, 
    CONCAT(fname, ' ', lname) AS `Full Name`,
    desig,
    dept,
    salary
FROM employee1
WHERE salary > 65000;
