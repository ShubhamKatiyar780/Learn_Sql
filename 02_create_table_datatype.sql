CREATE DATABASE IF NOT EXISTS datatype;
USE datatype;

# create a table
CREATE TABLE IF NOT EXISTS datatypedemo (
# numeric types
	ID INT PRIMARY KEY AUTO_INCREMENT,
    SmallNum TINYINT,
    BigNum BIGINT,
    Price DECIMAL(10,2),
    Rating FLOAT,
    
# string types
    Code CHAR(8),
    FullName VARCHAR(50),
    Description TEXT,
    
# date & time types
    DOB DATE,
    LoginTime TIME,
    CreatedAt DATETIME,
    UpdatedAt TIMESTAMP,
    JoinYear YEAR, 
    
# boolean type
    IsActive BOOLEAN,
    
# binary types
    ProfilePic BLOB,
    BinaryData VARBINARY(50)
);

# insert data
INSERT INTO datatypedemo 
(SmallNum, BigNum, Price, Rating, Code, FullName, Description, 
 DOB, LoginTime, CreatedAt, JoinYear, IsActive, ProfilePic, BinaryData)
VALUES
(10, 9999999999, 2500.75, 4.5, 'C1234', 'Rahul Sharma', 'This is a demo description',
 '2000-05-15', '12:30:00', NOW(), 2024, TRUE, LOAD_FILE("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/shubham.jpg"), 'binary123');

SELECT * FROM datatypedemo;

DESCRIBE datatypedemo;

#	After running this, open output.jpg in your folder → you’ll see your image

SELECT ProfilePic 
INTO DUMPFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/output.jpg'
FROM datatypedemo
WHERE Code = 'C1234';


