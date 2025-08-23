USE college;

CREATE TABLE IF NOT EXISTS students (
	Rollno INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT NOT NULL,
    Grade VARCHAR(1),
    City VARCHAR(20) DEFAULT 'Delhi'		-- City default value is 'Delhi'
);
-- 		insert data
INSERT INTO students (Rollno, Name, Marks, Grade, City)
VALUES  (101, 'Shubham Katiyar', 95, 'A', 'Mumbai'),
		(102, 'Jay', 85, 'B', 'Pune'),
        (103, 'Manjeet Singh', 70, 'D', 'Hyderabad');
        
INSERT INTO students (rollno, name, marks, grade)
VALUES  (110, 'Chauhan', 70, 'C');

SELECT * FROM students;