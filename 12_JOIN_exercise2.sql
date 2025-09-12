-- Select the database to use
USE JoinDB;

CREATE TABLE IF NOT EXISTS Students (
	StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(50) NOT NULL
);

INSERT INTO Students (StudentName)
	VALUES  ('William Shakespeare'), ('J.K. Rowling'),
			('Munshi Premchand'), ('Jaishankar Prasad');

CREATE TABLE IF NOT EXISTS Courses (
	CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50) NOT NULL UNIQUE,
    Fees DOUBLE NOT NULL
);

INSERT INTO Courses (CourseID, CourseName, Fees)
	VALUES  (101, 'Linux', 5000);
    
INSERT INTO Courses (CourseName, Fees)
	VALUES  ('Python', 8000), ('PHP', 4000),
			('Java', 8000), ('C++', 10000);

CREATE TABLE IF NOT EXISTS StudentCourse (
	StudentID INT NOT NULL,
    CONSTRAINT fk_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CourseID INT NOT NULL,
    CONSTRAINT fk_CourseID FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO StudentCourse (StudentID, CourseID)
	VALUES  (1, 101), (1, 102), (2, 105), (1, 105), 
			(3, 103), (2, 102), (4, 104);
select * from studentcourse;

-- which student purchase which one courses
SELECT s.StudentName, c.CourseName
FROM Students AS `s`
JOIN StudentCourse AS `sc` ON sc.StudentID = s.StudentID
JOIN Courses AS `c` ON sc.CourseID = c.CourseID;

-- how many students enroll with each courses
SELECT c.CourseName, COUNT(s.StudentName) AS `Total Students`
FROM Students AS `s`
JOIN StudentCourse AS `sc` ON sc.StudentID = s.StudentID
JOIN Courses AS `c` ON sc.CourseID = c.CourseID
GROUP BY c.CourseName;

-- how many courses taken by the each students
SELECT s.StudentName, COUNT(c.CourseName) AS `Total Courses`
FROM Students AS `s`
JOIN StudentCourse AS `sc` ON sc.StudentID = s.StudentID
JOIN Courses AS `c` ON sc.CourseID = c.CourseID
GROUP BY s.StudentName;

-- total fees paying by the each students
SELECT s.StudentName, SUM(c.Fees) AS `Total Fees`
FROM Students AS `s`
JOIN StudentCourse AS `sc` ON sc.StudentID = s.StudentID
JOIN Courses AS `c` ON sc.CourseID = c.CourseID
GROUP BY s.StudentName;