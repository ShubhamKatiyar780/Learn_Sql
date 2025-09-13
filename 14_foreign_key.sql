-- Select the database to use
USE JoinDB;

-- Create the Authors table if it doesn't exist
CREATE TABLE IF NOT EXISTS Authers (
	AutherID INT PRIMARY KEY AUTO_INCREMENT,  -- Primary key with auto-increment
    Name VARCHAR(50) NOT NULL
);
    
-- Insert sample data into Authors table
INSERT INTO Authers (Name)
	VALUES  ('William Shakespeare'), ('J.K. Rowling'),
			('Munshi Premchand'), ('Jaishankar Prasad');
    
-- Create the Books table if it doesn't exist
CREATE TABLE IF NOT EXISTS Books (
	BookID INT PRIMARY KEY AUTO_INCREMENT,          -- Primary key with auto-increment
    Title VARCHAR(50) NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 0 AND 5),
    AutherID INT,                                  -- Foreign key referencing Authors table
    CONSTRAINT fk_autherID FOREIGN KEY (AutherID) REFERENCES Authers(AutherID)
);
    
-- Insert sample data into Books table
INSERT INTO Books (Title, Rating, AutherID)
	VALUES ('Godaan', 4, 3), ('Romeo and Juliet', 3, 1),
            ('Harry Potter and the Sorcerer’s Stone', 5, 2),
            ('King Lear', 2, 1);
            
            
--  Drop Foreign Key
ALTER TABLE books
DROP FOREIGN KEY fk_autherID;