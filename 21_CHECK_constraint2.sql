-- CHECK constraint

-- Switch to the 'employees' database
USE employees;

CREATE TABLE IF NOT EXISTS Contact (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(50)NOT NULL,
    MobileNumber VARCHAR(15) UNIQUE CHECK (LENGTH(MobileNumber) >= 10)
    );
    
-- Display the structure (schema) of the employee1 table
DESCRIBE Contact;

INSERT INTO Contact (Name, MobileNumber)
	VALUES  ('Shubham', '+91900316378'),
			('Rishabh', '+927894231056'),
            ('Ramu', '+918576062410'),
            ('Arvind', '+93123456789025'),
            ('Sumit', '-9112331637008'),
            ('Akshay', '+91905470256378');
            
INSERT INTO Contact (Name, MobileNumber)
	VALUES  ('Katiyar', '+9191588855031635378');	-- Error Code: 1406. Data too long for column 'MobileNumber' at row 1

INSERT INTO Contact (Name)
	VALUES  ('Katiyar Shubham');
    
SELECT * FROM contact;