

-- create a function
DELIMITER $$
	CREATE FUNCTION emp_name_max_salary() RETURNS VARCHAR(50)
    DETERMINISTIC NO SQL READS SQL DATA
		BEGIN
        DECLARE a_max INT;
        DECLARE a_name VARCHAR(50);
        SELECT MAX(salary) INTO a_max FROM employee1;
        SELECT fname INTO a_name FROM employee1 WHERE salary = a_max;
        RETURN a_name;
        END $$
DELIMITER ;

-- drop a function
DROP FUNCTION get_salary_via_ID;

DELIMITER $$
	CREATE FUNCTION get_salary_via_ID(emp_id INT) RETURNS DOUBLE
    DETERMINISTIC NO SQL READS SQL DATA
		BEGIN
        DECLARE emp_salary DOUBLE;
        SELECT salary INTO emp_salary FROM employee1 WHERE empID = emp_id;
        RETURN emp_salary;
        END $$
DELIMITER ;