USE employees;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(50),
    balance DECIMAL(10,2)
);

INSERT INTO accounts (account_id, account_name, balance)
VALUES
(101, 'Shubham', 5000.00),
(102, 'Vishal', 3000.00);

SELECT * FROM accounts;

START TRANSACTION;
UPDATE accounts SET balance = balance - 1000 WHERE account_id = 101;
SAVEPOINT step1;

UPDATE accounts SET balance = balance + 1000 WHERE account_id = 102;
SAVEPOINT step2;


-- Ab tumhe laga last ka deduction galat tha
ROLLBACK TO step2;

COMMIT;