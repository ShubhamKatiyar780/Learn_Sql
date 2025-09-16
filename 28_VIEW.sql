--  VIEW

USE joindb;

-- create a view
CREATE VIEW StudentsInformation AS
	SELECT s.StudentName, COUNT(c.CourseName) AS `Total Courses`
	FROM Students AS `s`
	JOIN StudentCourse AS `sc` ON sc.StudentID = s.StudentID
	JOIN Courses AS `c` ON sc.CourseID = c.CourseID
	GROUP BY s.StudentName;

-- Update a View
CREATE OR REPLACE VIEW StuInfo AS
	SELECT s.StudentName, c.CourseName, c.Fees
	FROM Students AS `s`
	JOIN StudentCourse AS `sc` ON sc.StudentID = s.StudentID
	JOIN Courses AS `c` ON sc.CourseID = c.CourseID;

-- drop a view
DROP VIEW StudentsInformation;

SELECT * FROM StudentsInformation;
SELECT * FROM StuInfo;


SHOW TABLES;