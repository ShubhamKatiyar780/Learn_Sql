USE employees;

-- add primary key
CREATE TABLE IF NOT EXISTS employee1(
	empID INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    desig VARCHAR(50) NOT NULL DEFAULT 'Probation',
    dept VARCHAR(50) NOT NULL
    );

--  Drop Primary Key
ALTER TABLE employee1
DROP PRIMARY KEY;


