-- work with srring 

USE employees;

CREATE TABLE IF NOT EXISTS employee1(
	empID INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    desig VARCHAR(50) NOT NULL DEFAULT 'Probation',
    dept VARCHAR(50) NOT NULL
    );

-- set auto_increment with 100
ALTER TABLE employee1 AUTO_INCREMENT = 101;

-- see the structure of a table (its schema)
DESCRIBE employee1;

INSERT INTO employee1 (fname, lname, desig, dept)
	VALUES  ('Raju', 'Rastogi', 'Manager', 'Loan'),
			('Sham', 'Mohan', 'Accountant', 'Cashier'),
            ('Baburao', 'Apte', 'Associate', 'Loan'),
            ('Paul', 'Philip', 'Accountant', 'Account'),
            ('Alex', 'Watt', 'Associate', 'Deposite');
            
-- retrieve data from the employee1 table
SELECT * FROM employee1;


-- some common string functions
-- 1. LENGTH()
SELECT fname, lname FROM employee1 WHERE LENGTH(fname) = 4;

-- 2. uPPER/UCASE() or LOWER/LCASE
SELECT UCASE(fname), LCASE(lname) FROM employee1;

-- 3. SUBSTRING(string, start, length)
SELECT SUBSTR(fname, 3, 4) FROM employee1 WHERE empID = 101;	-- ju

-- 4. LEFT(string, number)
SELECT LEFT(fname, 3) FROM employee1;	-- Raj, Sha, Bab, Pau, Ale

-- 5. RIGHT(string, number)
SELECT RIGHT(fname, 3) FROM employee1;	-- aju, ham, rao, aul, lex

-- 6. CONCAT(string1, string2, …)
SELECT empID, CONCAT(fname, ' ', lname), desig, dept AS 'FullName' FROM employee1;

-- 7. REPLACE(string, find, replace_with)
SELECT REPLACE(fname, 'ju', 'mu') FROM employee1 WHERE empID = 101;		-- Ramu

-- 8. TRIM(string) / LTRIM(string) / RTRIM(string)
SELECT TRIM('   SQL   ');   -- Output: SQL
SELECT LTRIM('   SQL');     -- Output: SQL
SELECT RTRIM('  SQL   ');     -- Output: __SQL

-- 9. INSTR(string, substring)
SELECT INSTR(fname, 'ju') FROM employee1 WHERE empID = 101;		-- 3 (1-R, 2-a, 3-j, 4-u)

-- 10. REVERSE(string)
SELECT REVERSE(fname) FROM employee1 WHERE empID = 101;		-- ujaR

-- 11. LPAD(string, length, pad_string)
SELECT LPAD(empID, 5, 'L') FROM employee1 WHERE empID = 101;		-- LL101

-- 12. RPAD(string, length, pad_string)
SELECT RPAD(empID, 5, 'R') FROM employee1 WHERE empID = 101;		-- 102RR



-- task_01 101: Raju: Manager: Loan
SELECT CONCAT_WS(': ', empID, fname, desig, dept) AS 'Employee Details'
FROM employee1
WHERE empID = 101;

-- task_02 101: Raju Rastogi: Manager: Loan
SELECT CONCAT_WS(': ', empID, CONCAT(fname, ' ', lname), desig, dept) AS 'Employee Details'
FROM employee1
WHERE empID = 101;

-- task_03 101: Raju: MANAGER: Loan
SELECT CONCAT_WS(': ', empID, fname, UCASE(desig), dept) AS 'Employee Details'
FROM employee1
WHERE empID = 101;

-- task_04 L101 Raju, C102 Sham
SELECT CONCAT(LEFT(dept, 1), empID) AS DeptEmpID, fname
FROM employee1
WHERE empID = 101 OR empID = 102;
-- another solution
SELECT CONCAT(LEFT(dept, 1), empID) AS DeptEmpID, fname
FROM employee1
WHERE empID IN (101, 102);
