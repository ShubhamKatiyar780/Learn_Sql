CREATE DATABASE IF NOT EXISTS Employees;
USE Employees;

CREATE TABLE Employee (
	id int PRIMARY KEY,
    salary BIGINT
    );
    
INSERT INTO Employee (id, salary)
	VALUES (1, 100),
			(2, 200),
            (3, 1500),
            (16, 2800),
            (6, 800);

--	create procedure
DELIMITER $$            
CREATE PROCEDURE getNthHighestSalary (IN N INT)
	BEGIN
		SET N = N-1;
		SELECT salary AS getNthHighestSalary
        FROM Employee1
        ORDER BY salary DESC
        LIMIT N, 1;
	END $$
DELIMITER ;

-- 		delete the procedure
DROP PROCEDURE getNthHighestSalary;
DROP PROCEDURE IF EXISTS getNthHighestSalary;

-- 	Execute/call the procedure
CALL employees.getNthHighestSalary(2);