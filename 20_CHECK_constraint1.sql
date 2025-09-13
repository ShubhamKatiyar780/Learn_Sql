-- CHECK constraint

USE employees;
-- Create table with multiple CHECK constraints
CREATE TABLE IF NOT EXISTS Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age BETWEEN 5 AND 25),          -- Age must be 5–25
    Marks INT CHECK (Marks BETWEEN 0 AND 100),     -- Marks must be 0–100
    Gender CHAR(1) CHECK (Gender IN ('M','F')),    -- Gender must be M or F
    Fees DECIMAL(10,2),
    CONSTRAINT chk_fees CHECK (Fees >= 5000)       -- Fees must be >= 5000
);

INSERT INTO Students (StudentID, Name, Age, Marks, Gender, Fees)
VALUES  (1, 'Shubham', 20, 85, 'M', 10000),
		(2, 'Anita', 18, 92, 'F', 7500),
		(3, 'Ravi', 10, 60, 'M', 5000);
        
INSERT INTO Students VALUES (4, 'Aman', 3, 70, 'M', 8000);	-- Error: CHECK constraint failed (Age BETWEEN 5 AND 25)

-- Add CHECK Constraint Later
ALTER TABLE Students
ADD CONSTRAINT chk_name
CHECK (LENGTH(Name) >= 3);	-- This will make sure student names must have at least 3 characters

-- Remove a CHECK Constraint
ALTER TABLE Students DROP CONSTRAINT chk_name;
