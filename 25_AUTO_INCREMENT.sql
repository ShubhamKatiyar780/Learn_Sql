-- AUTO_INCREMENT

USE employees;

DESCRIBE employee;

INSERT INTO employee (id, salary) VALUES (20, 45000); -- id = 20

ALTER TABLE employee MODIFY id INT AUTO_INCREMENT;

INSERT INTO employee (salary) VALUES (500); -- id = 21
INSERT INTO employee (salary) VALUES (7000); -- id = 22

ALTER TABLE employee AUTO_INCREMENT=100;
INSERT INTO employee (salary) VALUES (600); -- id = 100

SELECT * FROM employee;