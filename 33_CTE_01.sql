USE employees;

SELECT * FROM employee1;

WITH avgSalary AS (
SELECT
	dept,
    AVG(salary) AS `Average Salary`
FROM employee1
GROUP BY dept
)
SELECT
	e.empID,
    e.fname,
    e.lname,
    e.dept,
    e.salary,
    a.`Average Salary`
FROM employee1 AS `e`
JOIN avgSalary  AS `a`
ON e.dept = a.dept
WHERE e.salary >= a.`Average Salary`;


SELECT dept FROM avgSalary;