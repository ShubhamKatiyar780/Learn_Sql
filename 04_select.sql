USE college;

--		SELECT all column
SELECT * FROM students;

--		SELECT specific column
SELECT Rollno, Name FROM students;

--		using WHERE clause (Filtering Rows)
SELECT Name FROM students WHERE Rollno = 101;

--		 Using Aliases (AS)
SELECT Rollno AS Roll_Number, Name AS Full_Name FROM students;  		-- 		change the column name

-- 		Using DISTINCT (Unique Values)
SELECT DISTINCT Marks FROM students;	-- do not shows duplicate values

-- 		Sorting Results (ORDER BY)
SELECT * FROM students ORDER BY Marks ASC;	-- sort marks in ascending order

-- 		Limiting Results (LIMIT / OFFSET)
SELECT * FROM students LIMIT 3;		-- shows only top 3 results
SELECT * FROM students LIMIT 3 OFFSET 1;	-- Skips the first 1 rows and returns the next 3 rows (rows 2 to 4)
-- 	Alternative Syntax
SELECT * FROM students LIMIT 1, 3;	-- Skips the first 1 rows and returns the next 3 rows

-- 		Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)
SELECT COUNT(*) AS Total_Students, AVG(Marks) AS Avg_Marks FROM students;

-- 		Grouping Results (GROUP BY)
SELECT Grade, COUNT(*) AS Total_Students FROM students GROUP BY Grade;

-- 		Filtering with LIKE (Pattern Matching)
SELECT * FROM students WHERE Name LIKE 'S%';	--  name start with 'S'
SELECT * FROM students WHERE Name LIKE '%n';	-- name end with 'n'
SELECT * FROM students WHERE Name LIKE '%y%';	-- 'y' in mid
SELECT * FROM students WHERE Name LIKE '_a%';	-- second letter should be 'a'
SELECT * FROM students WHERE Name LIKE '___';	-- name only have 3 letters

--		Filtering Groups (HAVING)
SELECT Grade, COUNT(*) AS Total_Students FROM students GROUP BY Grade HAVING Grade > 'B';

