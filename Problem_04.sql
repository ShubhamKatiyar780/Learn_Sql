-- 	Employees Earning More Than Their Managers

USE employees;
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    managerId INT
);

-- Insert sample data
INSERT INTO Employees (id, name, salary, managerId) VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);


SELECT e.name
FROM Employees AS e
JOIN Employees AS m
ON e.managerId = m.id
WHERE e.salary > m.salary;
