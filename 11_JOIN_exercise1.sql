-- Select the database to use
USE JoinDB;

-- Create the Authors table if it doesn't exist
CREATE TABLE IF NOT EXISTS Authers (
	AutherID INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key with auto-increment
    Name VARCHAR(50) NOT NULL                 -- Author's name cannot be NULL
);
    
-- Insert sample data into Authors table
INSERT INTO Authers (Name)
	VALUES  ('William Shakespeare'), ('J.K. Rowling'),
			('Munshi Premchand'), ('Jaishankar Prasad');
    
-- Create the Books table if it doesn't exist
CREATE TABLE IF NOT EXISTS Books (
	BookID INT PRIMARY KEY AUTO_INCREMENT,          -- Primary key with auto-increment
    Title VARCHAR(50) NOT NULL,                     -- Book title cannot be NULL
    Rating INT NOT NULL CHECK (Rating BETWEEN 0 AND 5),  -- Rating must be between 1 and 5
    AutherID INT,                                  -- Foreign key referencing Authors table
    CONSTRAINT fk_autherID FOREIGN KEY (AutherID) REFERENCES Authers(AutherID)
);
    
-- Insert sample data into Books table
INSERT INTO Books (Title, Rating, AutherID)
	VALUES ('Godaan', 4, 3), ('Romeo and Juliet', 3, 1),
            ('Harry Potter and the Sorcerer’s Stone', 5, 2),
            ('King Lear', 2, 1);

-- Inner join: Get author names along with their books and ratings
SELECT a.Name, b.Title, b.Rating
FROM  authers AS `a`
JOIN books AS `b`
ON a.AutherID = b.AutherID;

-- Left join: Get all authors, including those who don't have books
SELECT a.Name, b.Title, b.Rating
FROM  authers AS `a`
LEFT JOIN books AS `b`
ON a.AutherID = b.AutherID;

-- Left join with IFNULL: Replace NULL book titles with 'Not Found' and NULL ratings with 0
SELECT a.Name, IFNULL(b.Title, 'Not Found') AS `Title`, IFNULL(b.Rating, 0) AS `Rating`
FROM  authers AS `a`
LEFT JOIN books AS `b`
ON a.AutherID = b.AutherID;

-- Inner join with CASE statement: Classify books as Good, Average, or Low based on rating
SELECT a.Name, b.Title, b.Rating,
	CASE
		WHEN IFNULL(b.Rating, 0) >= 3 THEN 'Good'      -- if Rating is greater than or equal to 3 then remark is Good
        ELSE 'Average'                                 -- Any other rating is Low
	END AS `Remark` 
FROM  authers AS `a`
JOIN books AS `b`
ON a.AutherID = b.AutherID;

-- Display all records from Authors table (will fail if table was dropped)
select * from Authers;

-- Display all records from Books table (will fail if table was dropped)
select * from Books;

-- Drop the Authors table (this will delete all data)
drop table Authers;

-- Drop the Books table (this will delete all data)
drop table Books;
