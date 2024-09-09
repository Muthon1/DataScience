CREATE TABLE Wine (
    WineID INT PRIMARY KEY,
    Category VARCHAR(50),
    Year INT,
    degree FLOAT
);


CREATE TABLE Producer (
    ProducerID INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Region VARCHAR(50)
);

CREATE TABLE Production (
    WineID INT,
    ProducerID INT,
    Quantity INT,
    FOREIGN KEY (WineID) REFERENCES Wine(WineID),
    FOREIGN KEY (ProducerID) REFERENCES Producer(ProducerID)
);

INSERT INTO Wine (WineID, Category, year, degree) VALUES
(1, 'Red', 2019, 13.5),
(2, 'White', 2020, 12.0),
(3, 'Rose', 2018, 11.5),
(4, 'Red', 2021, 14.0),
(5, 'Sparkling', 2017, 10.5),
(6, 'White', 2019, 12.5),
(7, 'Red', 2022, 13.0),
(8, 'Rose', 2020, 11.0),
(9, 'Red', 2018, 12.0),
(10, 'Sparkling', 2019, 10.0),
(11, 'White', 2021, 11.5),
(12, 'Red', 2022, 15.0);

INSERT INTO Producer (ProducerID, FirstName, LastName, Region) VALUES
(1, 'John', 'Smith', 'Sousse'),
(2, 'Emma', 'Johnson', 'Tunis'),
(3, 'Michael', 'Williams', 'Sfax'),
(4, 'Emily', 'Brown', 'Sousse'),
(5, 'James', 'Jones', 'Sousse'),
(6, 'Sarah', 'Davis', 'Tunis'),
(7, 'David', 'Miller', 'Sfax'),
(8, 'Olivia', 'Wilson', 'Monastir'),
(9, 'Daniel', 'Moore', 'Sousse'),
(10, 'Sophia', 'Taylor', 'Tunis'),
(11, 'Matthew', 'Anderson', 'Sfax'),
(12, 'Amelia', 'Thomas', 'Sousse');



INSERT INTO Production (WineID, ProducerID, Quantity) VALUES
(1, 1, 100),
(2, 2, 150),
(3, 3, 200),
(4, 4, 250),
(5, 5, 300),
(6, 6, 350),
(7, 7, 400),
(8, 8, 450),
(9, 9, 500),
(10, 10, 550),
(11, 11, 600),
(12, 12, 650);

select * from Producer;

select * from Producer
order by LastName, FirstName;

select * from Producer
where Region = 'Sousse';

SELECT SUM(Quantity) AS total_quantity
FROM Production
WHERE WineID = 12;

SELECT W.Category, SUM(P.Quantity) AS total_quantity
FROM Production P
JOIN Wine W ON P.WineID = W.WineID
GROUP BY W.Category;

SELECT DISTINCT PR.FirstName, PR.LastName
FROM Producer PR
JOIN Production P ON PR.ProducerID = P.ProducerID
WHERE PR.Region = 'Sousse' AND P.Quantity > 300
ORDER BY PR.LastName, PR.FirstName;

SELECT WineID
FROM Wine
WHERE degree > 12
AND WineID IN (
    SELECT WineID
    FROM Production
    WHERE ProducerID = 24
);

SELECT PR.FirstName, PR.LastName
FROM Producer PR
JOIN Production P ON PR.ProducerID = P.ProducerID
GROUP BY PR.ProducerID
ORDER BY SUM(P.Quantity) DESC
LIMIT 1;

SELECT AVG(Degree) AS average_degree
FROM Wine;

SELECT *
FROM Wine
ORDER BY year ASC
LIMIT 1;

SELECT PR.FirstName, PR.LastName, SUM(P.Quantity) AS total_quantity
FROM Producer PR
JOIN Production P ON PR.ProducerID = P.ProducerID
GROUP BY PR.ProducerID;

SELECT W.WineID, W.Category, W.Year, W.Degree, PR.FirstName, PR.LastName
FROM Wine W
JOIN Production P ON W.WineID = P.WineID
JOIN Producer PR ON P.ProducerID = PR.ProducerID;
















