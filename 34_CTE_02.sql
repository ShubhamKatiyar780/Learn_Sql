USE employees;

SELECT * FROM employee1;

/*
we want to find the highest-paid employee in each department.
*/

WITH maxSalary AS (
SELECT
	dept,
    MAX(salary) AS `Highest Salary`
FROM employee1
GROUP BY dept
)
SELECT
	e.empID,
    e.fname,
    e.lname,
    e.desig,
    e.dept,
    e.salary
FROM employee1 AS `e`
JOIN maxSalary  AS `m`
ON e.dept = m.dept
WHERE e.salary = m.`Highest Salary`;

