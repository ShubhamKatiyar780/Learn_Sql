USE employees;


CREATE TABLE IF NOT EXISTS account_details(
	account_no INT,
	user_id INT,
    bank_name VARCHAR(100), 
    CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
DESC  account_details;

INSERT INTO account_details (account_no, user_id, bank_name) VALUES (203648, 1, 'SBI');

-- add column in users table
ALTER TABLE users ADD COLUMN account_count INT DEFAULT 0;


-- create trigger for insert bank details
DELIMITER $$
CREATE TRIGGER insert_bank_details
BEFORE INSERT
ON account_details
FOR EACH ROW
BEGIN
	UPDATE users SET account_count = account_count + 1 WHERE user_id = NEW.user_id;
END; $$
DELIMITER ;
-- check insert trigger
INSERT INTO account_details (account_no, user_id, bank_name) VALUES (21495268, 1, 'Axis');


-- create trigger for delete bank details
DELIMITER $$
CREATE TRIGGER delete_bank_details
BEFORE DELETE
ON account_details
FOR EACH ROW
BEGIN
	UPDATE users SET account_count = account_count - 1 WHERE user_id = OLD.user_id;
END; $$
DELIMITER ;

-- check delete trigger
SET SQL_SAFE_UPDATES = 0;
DELETE FROM account_details where account_no = 203648;
SET SQL_SAFE_UPDATES = 1;


-- DROP TRIGGER insert_bank_details;

-- TRUNCATE TABLE account_details;

-- SELECT * FROM account_details;

-- SELECT * FROM users;