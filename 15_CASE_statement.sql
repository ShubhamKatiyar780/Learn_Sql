-- Switch to the 'employees' database so all queries run on it
USE employees;

-- Update the record:
-- Set the salary to 50000 for the employee whose empID is 104
UPDATE employee1 
SET salary = 50000 
WHERE empID = 104;

-- Select employee details along with salary category
SELECT
    empID AS `Employee ID`,                                                -- Employee ID
    CONCAT(fname, ' ', lname) AS `Full Name`,             -- Combine first name and last name into a single column
    CASE
        WHEN salary > 50000 THEN 'Higher Salary'          -- If salary is greater than 50000
        WHEN salary < 50000 THEN 'Lower Salary'           -- If salary is less than 50000
        ELSE 'Exactly 50000'                              -- If salary is exactly 50000
    END AS `Salary Category`                              -- Alias for the salary classification
FROM employee1;

-- Convert salary into dollars (assuming 1 USD = 80 units of local currency)
SELECT
    empID AS `Employee ID`,
    CONCAT(fname, ' ', lname) AS `Full Name`,
    salary AS `Salary`,
    CASE
    WHEN salary != 0 THEN  (salary / 80)
    ELSE 'salary is Zero'
    END AS `Salary in Dollars`
FROM employee1; 