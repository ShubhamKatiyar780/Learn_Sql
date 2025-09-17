USE employees;


-- 1. no parameter
DELIMITER $$
	CREATE PROCEDURE emp_info()
		BEGIN
			SELECT *
			FROM employee1
			ORDER BY salary DESC
			LIMIT 10;
		END $$
DELIMITER ;


-- 2. input parameter
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

DELIMITER $$
	CREATE PROCEDURE get_emp_detalis_via_empID (IN N INT)
		BEGIN
			SELECT *
            FROM employee1
            WHERE empID = N;
		END $$
DELIMITER ;


-- 3. input/output parameter
DELIMITER $$
	CREATE PROCEDURE get_sumofsalary_via_dept (IN depart VARCHAR(50), OUT Total BIGINT)
		BEGIN
			SELECT SUM(salary) INTO Total
            FROM employee1
            WHERE dept = depart
            GROUP BY dept;
		END $$
DELIMITER ;

CALL get_sumofsalary_via_dept('Loan', @Toatl);
SELECT @Total;


-- business logic
DELIMITER $$
	CREATE PROCEDURE increase_Salary_via_dept (
		IN which_deparment VARCHAR(50),
        IN how_much_percent DECIMAL(5, 2),
		OUT TotalSalary BIGINT)
		BEGIN
			SET how_much_percent = how_much_percent / 100;
			UPDATE employee1
			SET salary = salary + (salary * how_much_percent)
            WHERE dept = which_deparment;
            
            SELECT SUM(salary) INTO TotalSalary FROM employee1 WHERE dept = which_deparment;
		END $$
DELIMITER ;
-- run this command before the updation
SET SQL_SAFE_UPDATES = 0;
-- run this command after the updation
SET SQL_SAFE_UPDATES = 1;


-- call procedure
CALL employees.emp_info();	-- execute emp_info() from employees database
CALL employees.getsalary(2);
CALL get_sumofsalary_via_dept('Loan', @Toatl);

-- drop procedure
DROP PROCEDURE get_emp_detalis_via_empID;


SELECT * FROM employee1;