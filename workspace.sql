-- SELECT <columns> FROM <table> INNER JOIN <table2> ON <equality criteria>
SELECT * FROM make INNER JOIN model ON make.MakeID = model.MakeID

-- SELECT <columns> FROM <table> LEFT OUTER JOIN <table2> ON <equality criteria>
SELECT * FROM make LEFT OUTER JOIN model ON make.MakeID = model.MakeID

-- Challenge #1
-- Task #1
SELECT ModelName, VIN, StickerPrice FROM Car INNER JOIN Model ON Car.ModelID = Model.ModelID
-- Task #2
SELECT MakeName, ModelName, VIN, StickerPrice 
FROM Car 
INNER JOIN Model ON Car.ModelID = Model.ModelID 
INNER JOIN Make ON Model.MakeID = Make.MakeID 
-- Task #3
SELECT FirstName, LastName, SaleAmount FROM Sale INNER JOIN SalesRep ON Sale.SalesRepID = SalesRep.SalesRepID
-- Task #4
SELECT ModelName, VIN
FROM Model 
LEFT OUTER JOIN Car ON Model.ModelID = Car.ModelID 
-- Task #5
SELECT SaleDate, SaleAmount, FirstName, LastName FROM Sale LEFT OUTER JOIN SalesRep ON Sale.SalesRepID = SalesRep.SalesRepID
-- Challenge completed

-- <Statement 1> UNION <Statement 2>
SELECT MakeName FROM Make UNION SELECT MakeName FROM ForeighMake

-- <Statement 1> INTERSECT <Statement 2>
SELECT MakeName FROM Make INTERSECT SELECT MakeName FROM ForeighMake

-- <Statement 1> EXCEPT <Statement 2>
SELECT MakeName FROM Make EXCEPT SELECT MakeName FROM ForeighMake

-- Challenge #2
-- Task #1
SELECT Name  FROM Fruit  UNION SELECT Name  FROM Vegetable 
-- Task #2
SELECT Name FROM Fruit WHERE Name BETWEEN 'A' AND 'L' UNION SELECT Name FROM Vegetable WHERE Name BETWEEN 'A' AND 'L'
-- Task #3
SELECT Name FROM Fruit UNION ALL SELECT Name FROM Vegetable ORDER BY Name
-- Task #4
SELECT Name FROM Fruit INTERSECT SELECT Name FROM Vegetable ORDER BY Name
-- Task #5
SELECT Name FROM Fruit EXCEPT SELECT Name FROM Vegetable ORDER BY Name
-- Task #6
SELECT Name FROM Vegetable EXCEPT SELECT Name FROM Fruit ORDER BY Name
-- Challenge completed

-- SELECT <columns> FROM <table 1> WHERE <column1> IN (SELECT <column 1> FROM <table 2> WHERE <search_criteria>)
SELECT * FROM Sale WHERE CarID IN (SELECT CarID FROM Car WHERE ModelYear = 2015)

-- SELECT <columns> FROM <table 1> WHERE <column1> <INNER|OUTER> JOIN
--  (SELECT <column 1> FROM <table 2> WHERE <search_criteria>) AS <temporary name> ON <equality criteria>
SELECT * FROM Sale AS s 
    INNER JOIN (SELECT CarID FROM Car WHERE ModelYear = 2015) AS t
    ON s.CarID = t.CarID

-- Challenge #3
-- Task #1
SELECT ModelName FROM Model WHERE ModelID IN (SELECT ModelID FROM Car WHERE StickerPrice > 30000)
-- Task #2
SELECT * FROM Sale WHERE CarID IN (SELECT CarID FROM Car WHERE StickerPrice > 30000)
-- Task #3
SELECT * FROM Sale WHERE CustomerID IN (SELECT CustomerID FROM Customer WHERE Gender = 'F')
-- Task #4
SELECT * FROM Sale AS s
    INNER JOIN (SELECT CustomerID FROM Customer WHERE Gender = 'F') AS t
		ON s.CustomerID = t.CustomerID
-- Challenge completed
