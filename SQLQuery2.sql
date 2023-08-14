CREATE DATABASE ExerciseDbJoin;
USE ExerciseDbJoin;

-----------------------------SECTION-1----------------------------------------
CREATE TABLE CompanyInfo (
Cld INT PRIMARY KEY,
CName VARCHAR(50)
);


INSERT INTO CompanyInfo (Cld, CName)
VALUES
(1, 'Oneplus'),
(2, 'aaple'),
(3, 'HP'),
(4, 'samsung'),
(5, 'acer'),
(6, 'OPPO');


CREATE TABLE ProductInfo (
PId INT PRIMARY KEY,
PName VARCHAR(50),
PPrice DECIMAL(10, 2),
PMDate DATE,
CId INT,
FOREIGN KEY (CId) REFERENCES CompanyInfo(Cld)
);


INSERT INTO ProductInfo (PId, PName, PPrice, PMDate, CId)
VALUES
(101, 'ipod', 95000.90, '2023-09-22', 1),
(102, 'Laptop', 85000.90, '2023-08-12', 2),
(103, 'Mobile', 55200.90, '2023-07-12', 2),
(104, 'Laptop', 13500.90, '2023-01-12', 3),
(105, 'alexa', 15000.90, '2023-12-22', 3),
(106, 'Laptop', 45000.90, '2023-12-12', 5),
(107, 'Mobile', 65000.90, '2023-11-22', 5),
(108, 'Earpod', 15000.90, '2023-02-19', 3),
(109, 'Laptop', 89000.90, '2023-01-28', 6),
(110, 'Mobile', 50000.70, '2023-05-08', 1);

SELECT CName, PId, PName, PPrice, PMDate
FROM CompanyInfo
JOIN ProductInfo ON CompanyInfo.Cld = ProductInfo.CId
ORDER BY CName;



SELECT PName, CName
FROM ProductInfo
JOIN CompanyInfo ON ProductInfo.CId = CompanyInfo.Cld
ORDER BY PName;




SELECT CName, PName
FROM CompanyInfo
CROSS JOIN ProductInfo
ORDER BY CName, PName;

--------------------------------------------------SECTION-2-----------------------------------------------


CREATE TABLE Products (
PId INT PRIMARY KEY,
PQ INT,
PPrice DECIMAL(11, 4),
Discount DECIMAL(15, 9)
);


INSERT INTO Products (PId, PQ, PPrice, Discount)
VALUES
(1, 9, 990.00, 30.00),
(2, 4, 490.00, 35.00),
(3, 8, 270.00, 2.00);




SELECT PId,PQ,PPrice,Discount, 
PPrice * PQ AS TotalPrice,
PPrice * PQ - (PPrice * PQ * Discount / 100) AS PriceAfterDiscount
FROM Products;
