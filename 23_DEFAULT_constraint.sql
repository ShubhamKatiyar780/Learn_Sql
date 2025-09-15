-- DEFAULT

USE employees;

DESCRIBE students;

-- add default value in Fees column
ALTER TABLE students
ALTER Fees SET DEFAULT 10000;

-- The default value will not be used when value is explicitly provided for a column
INSERT INTO students (StudentID, Name, Age, Marks, Gender, Fees)
    VALUES (4, 'Rohit', 24, 68, 'M', 7800.55);

-- The default value will be used for the Fees column since no value is specified
INSERT INTO students (StudentID, Name, Age, Marks, Gender)
    VALUES (5, 'Aman', 17, 81, 'M');

    

SELECT * FROM students;