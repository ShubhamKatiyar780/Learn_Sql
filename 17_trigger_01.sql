USE employees;


CREATE TABLE IF NOT EXISTS users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50), 
    per_hour_salary DOUBLE DEFAULT 0,
    working_hour INT DEFAULT 0,
    total_salary DOUBLE DEFAULT 0
    );


INSERT INTO users (Name, per_hour_salary, working_hour) VALUES('Shubham', 6000, 8);

-- create trigger before insert
DELIMITER $$
CREATE TRIGGER insert_total_salary
BEFORE INSERT
ON users
FOR EACH ROW
BEGIN
	SET NEW.total_salary = NEW.per_hour_salary * NEW.working_hour;
END; $$
DELIMITER ;


INSERT INTO users (Name, per_hour_salary, working_hour) VALUES('Bob', 4000, 7);
INSERT INTO users (Name, per_hour_salary, working_hour) VALUES('Rohit', 8000, 6);
INSERT INTO users (Name, per_hour_salary, working_hour) VALUES('Alex', 4000, 9);


-- create trigger for update
DELIMITER $$
CREATE TRIGGER update_total_salary
BEFORE UPDATE
ON users
FOR EACH ROW
BEGIN
	SET NEW.total_salary = NEW.per_hour_salary * NEW.working_hour;
END; $$
DELIMITER ;

-- update working hours
UPDATE users SET working_hour = 11 WHERE user_id = 1;


-- create trigger for delete
DELIMITER $$
CREATE TRIGGER delete_records
BEFORE DELETE
ON users
FOR EACH ROW
BEGIN
	INSERT INTO deleted_users_log (user_id, Name, per_hour_salary, working_hour, total_salary) -- (deleted_users_log) table already existing in database
    VALUES (OLD.user_id, OLD.Name, OLD.per_hour_salary, OLD.working_hour, OLD.total_salary);
END; $$
DELIMITER ;

CREATE TABLE IF NOT EXISTS deleted_users_log(
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    Name VARCHAR(50),
    per_hour_salary INT,
    working_hour INT,
    total_salary INT,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- delete user
DELETE FROM users WHERE user_id = 4;

-- chack deleted employee's details
SELECT * FROM deleted_users_log;


-- delete trigger
DROP TRIGGER delete_records;


SELECT * FROM users;
