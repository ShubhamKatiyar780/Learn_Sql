-- ALTER

-- Switch to the 'employees' database
USE employees;

DESC employee1;

select * from employee1;

-- 1. Add a New Column
ALTER TABLE employee1
ADD COLUMN Rating INT NOT NULL DEFAULT 1;


-- 2. Add Multiple Columns
ALTER TABLE employee1
ADD COLUMN (joiningDate DATETIME, Status BOOLEAN NOT NULL DEFAULT 1);


-- 3. Modify Column Data Type / Size
ALTER TABLE employee1
MODIFY joiningDate DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE employee1
MODIFY salary DECIMAL(15, 2) NOT NULL DEFAULT 25000;

-- 4. Rename a Column
ALTER TABLE employee1
CHANGE Status activeStatus BOOLEAN NOT NULL DEFAULT 1;	-- activeStatus

ALTER TABLE employee1
CHANGE COLUMN activeStatus Status BOOLEAN NOT NULL DEFAULT 1;	-- Status


-- 5. Rename the Table
ALTER TABLE employee1
RENAME TO employee11;

ALTER TABLE employee11
RENAME TO employee1;


-- 6. Add a Constraint
ALTER TABLE employee1
ADD CONSTRAINT chk_rating
CHECK (Rating BETWEEN 1 AND 10);


-- 7. Add Multiple Constraint
ALTER TABLE employee1
ADD CONSTRAINT chk_rating
CHECK (Rating BETWEEN 1 AND 10),
ADD CONSTRAINT chk_status CHECK (Status IN(0, 1));


-- 8. Drop Multiple Constraint
ALTER TABLE employee1
DROP CONSTRAINT chk_status,
DROP CONSTRAINT chk_rating;


-- 9. Drop a Column
ALTER TABLE employee1
DROP COLUMN Rating;


-- 10. Drop Multiple Column
ALTER TABLE employee1
DROP COLUMN joiningDate,
DROP COLUMN Status;


-- 11. Drop Primary Key
ALTER TABLE employee1
DROP PRIMARY KEY;	-- You cannot drop a primary key if it’s the only key on an AUTO_INCREMENT column


-- 12. Add Primary Key
ALTER TABLE employee1
ADD PRIMARY KEY (empID);	-- primary key already exist


-- 13. Add Foreign Key
ALTER TABLE employee1
ADD COLUMN BossID INT NOT NULL DEFAULT 101;

ALTER TABLE employee1
ADD CONSTRAINT fk_bossID
FOREIGN KEY (BossID)
REFERENCES employee1(empID)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- 14. Drop Foreign Key
ALTER TABLE employee1
DROP FOREIGN KEY fk_bossID;


-- 15. Add Default Value
ALTER TABLE employee1
ALTER COLUMN BossID SET DEFAULT 107;
/*	ALTER TABLE employee1
	ALTER BossID SET DEFAULT 107;	*/


-- 16. Drop Default Value
ALTER TABLE employee1
ALTER COLUMN BossID DROP DEFAULT;
 /*	ALTER TABLE employee1
	ALTER BossID DROP DEFAULT; */


-- 17. Add Unique Constraint
ALTER TABLE employee1
ADD CONSTRAINT unique_fname UNIQUE (fname);


-- 18. Drop Unique Constraint
ALTER TABLE employee1
DROP INDEX unique_fname;


-- 19. Add Index (for faster search)
ALTER TABLE employee1
ADD INDEX idx_fname (fname);


-- 20. Drop Index
ALTER TABLE employee1
DROP INDEX idx_fname;
