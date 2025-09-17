-- ROLLUP

SELECT * FROM StuInfo;

SELECT StudentName, SUM(Fees)
FROM StuInfo
GROUP BY StudentName;

SELECT StudentName, SUM(Fees)
FROM StuInfo
GROUP BY StudentName WITH ROLLUP;

SELECT IFNULL(StudentName, 'TOTAL'), SUM(Fees)
FROM StuInfo
GROUP BY StudentName WITH ROLLUP;

SELECT IFNULL(StudentName, 'TOTAL'), COUNT(Fees)
FROM StuInfo
GROUP BY StudentName WITH ROLLUP;

SELECT IFNULL(StudentName, 'TOTAL'), AVG(Fees)
FROM StuInfo
GROUP BY StudentName WITH ROLLUP;