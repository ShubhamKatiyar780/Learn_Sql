-- use the database
USE employees;

-- see the structure of a table (its schema)
DESCRIBE employee1;

-- 1. find the different type of department in database
SELECT DISTINCT dept FROM employee1;

-- 2. display records with hight-low salary
SELECT * FROM employee1 ORDER BY salary DESC;

-- 3. How to see only top 3 records from a table
SELECT * FROM employee1 LIMIT 3;

-- 4. show records where first name start with letter 'A'
SELECT * FROM employee1 WHERE fname LIKE 'A%';

-- 5. show records where length of the last name is 4 characters
SELECT * FROM employee1 WHERE lname LIKE '____';
SELECT * FROM employee1 WHERE LENGTH(lname) = 4;	-- More flexible

-- 6. find lowest salary paying
SELECT * FROM employee1 WHERE salary = (SELECT MIN(salary) FROM employee1);

-- 7. find highest salary paying
SELECT * FROM employee1 WHERE salary = (SELECT MAX(salary) FROM employee1);

-- 8. find minimum salary in each department
SELECT dept, min(salary) AS 'Minimum Salary' FROM employee1 GROUP BY dept;

-- 9. find the total salary paying in loan department
SELECT dept, SUM(salary) AS 'Sum of Salary' FROM employee1 WHERE dept = 'Loan' GROUP BY dept;

-- 10. find average salary in each department
SELECT dept, AVG(salary) AS 'Average Salary' FROM employee1 GROUP BY dept;

-- 11. find total no. of employees in database
SELECT COUNT(*) AS 'Total Employees' FROM employee1;

-- 12. find total no. of employees in each department
SELECT dept, COUNT(empID) AS 'Total Employees' FROM employee1 GROUP BY dept