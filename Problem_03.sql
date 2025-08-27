-- 	Rank Scores

USE employees;

CREATE TABLE IF NOT EXISTS Scores (
	id INT PRIMARY KEY,
    score DECIMAL(10, 2)
    );

DROP TABLE Scores;

INSERT INTO Scores (id, score)
	VALUES  (1, 3.50),
			(2, 3.65),
            (3, 4.00),
            (4, 3.85),
            (5, 4.00),
            (6, 3.65);
            
-- SELECT * FROM Scores;
-- SELECT score FROM Scores;

-- 	DENSE_RANK() is a window function. It assigns a rank to rows based on the specified ordering
SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS 'Rank'
FROM Scores;

