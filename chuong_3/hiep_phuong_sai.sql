CREATE TABLE DataTable (
    ID INT PRIMARY KEY,
    Num1 FLOAT,
    Num2 FLOAT
);

INSERT INTO DataTable (ID, Num1, Num2) VALUES
(1, 3.5, 7.2),
(2, 5.1, 8.4),
(3, 7.8, 6.9),
(4, 9.0, 10.2),
(5, 11.3, 4.5),
(6, 13.7, 12.8);
select * from DataTable
WITH MeanValues AS (
    SELECT AVG(Num1) AS AvgNum1, AVG(Num2) AS AvgNum2
    FROM DataTable
)
SELECT 
    SUM((Num1 - m.AvgNum1) * (Num2 - m.AvgNum2)) / (COUNT(*) - 1) AS Covariance
FROM DataTable, MeanValues m;


