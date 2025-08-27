-- BETWEEN, IN(SOME), LIKE and NOT LIKE

USE employees;

-- BETWEEN
SELECT Name FROM Students WHERE Marks BETWEEN 50 AND 90;	-- Same as: Marks >= 50 AND Marks <= 90

-- IN
SELECT Name FROM Students WHERE Marks IN (60, 75, 85); -- names of students whose marks are either 60, 75, or 85
SELECT Name FROM Students WHERE Marks NOT IN (60, 75, 85); -- names of students whose marks are nither 60, 75, nor 85

-- LIKE
SELECT Name FROM Students WHERE Name LIKE 'S%';	-- Names starting with 'S'
SELECT Name FROM Students WHERE Name LIKE '%i';	-- Names ending with 'i'
SELECT Name FROM Students WHERE Name LIKE '%a%';	-- Names having 'a' inside
SELECT Name FROM Students WHERE Name LIKE '_n%';	-- Names with second letter 'n'

-- NOTE LIKE
SELECT Name FROM Students WHERE Name NOT LIKE 'S%';	-- Names Not starting with 'S'
SELECT Name FROM Students WHERE Name NOT LIKE '%i';	-- Names Not ending with 'i'
