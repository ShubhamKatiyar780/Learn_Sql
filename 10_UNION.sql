USE college;
-- Table 1: Faculty
CREATE TABLE faculty (
    roll_no INT,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- Table 2: Alumni
CREATE TABLE alumni (
    roll_no INT,
    fullname VARCHAR(50)
);

-- Insert into students
INSERT INTO faculty (roll_no, name, city) VALUES
(1, 'Ravi Kumar', 'Kanpur'),
(2, 'Priya Sharma', 'Delhi'),
(3, 'Amit Verma', 'Lucknow'),
(4, 'Sneha Singh', 'Mumbai');

-- Insert into alumni
INSERT INTO alumni (roll_no, fullname) VALUES
(3, 'Amit Verma'),
(5, 'Neha Gupta'),
(6, 'Rahul Mehra');
            
-- UNION
SELECT f.roll_no, f.name FROM faculty AS f
UNION
SELECT  a.roll_no, a.fullname FROM alumni AS a;		-- Duplicates Removed

SELECT f.roll_no, f.name, f.city FROM faculty AS f
UNION
SELECT  a.roll_no, a.fullname, NULL FROM alumni AS a;	-- Adding NULL for extra column

-- UNION ALL (keep duplicates)
SELECT f.roll_no, f.name FROM faculty AS f
UNION ALL
SELECT  a.roll_no, a.fullname FROM alumni AS a;	-- Keep Duplicates