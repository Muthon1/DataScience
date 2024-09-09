create table Products (
ProductID INT primary KEY,
ProductName VARCHAR (20),
ProductType VARCHAR (20),
Price DECIMAL (10, 2)
);

drop table Products cascade;

create table Customers(
CustomerID INT primary key,
CustomerName VARCHAR (20),
Email VARCHAR (50),
Phone VARCHAR (50)
);

drop table Customers cascade;

create table Orders (
OrderID INT primary key,
CustomerID INT,
OrderDate DATE,
foreign key (CustomerID) references Customers (CustomerID)
);

SELECT * FROM Orders;

create table OrderDetails (
OrderDetailID INT primary key,
OrderID INT,
ProductID INT,
Quantity INT,
foreign key (OrderID) references Orders (OrderID),
foreign key (ProductID) references Products (ProductID)
);

select * from orderDetails;

create table ProductTypes (
ProductTypeID INT primary key,
ProductTypeName VARCHAR (20)
);

insert into Products (ProductID, ProductName, ProductType, Price) values
(1, 'Widget A', 'Widget', 10.00),
(2, 'Widget B', 'Widget', 15.00),
(3, 'Gadget X', 'Gadget', 20.00),
(4, 'Gadget Y', 'Gadget', 25.00),
(5, 'Doohickey Z', 'Doohickey', 30.00)
;

insert into Customers (CustomerID, CustomerName, Email, Phone) values
(1, 'John Smith', 'john@example.com', '123-456-7890'),
(2, 'Jane Doe', 'jane.doe@example.com', '987-654-3210'),
(3, 'Alice Brown', 'alice.brown@example.com', '456-789-0123')
;

insert into Orders (OrderID, CustomerID, OrderDate) values
(101, 1, '2024-05-01'),
(102, 2, '2024-05-02'),
(103, 3, '2024-05-01')
;

insert into orderDetails (OrderDetailID, OrderID, ProductID, Quantity) values
(1, 101, 1, 2),
(2, 101, 3, 1),
(3, 102, 2, 3),
(4, 102, 4, 2),
(5, 103, 5, 1)
;

insert into ProductTypes (ProductTypeID, ProductTypeName) values
(1, 'Widget'),
(2, 'Gadget'),
(3, 'Doohickey')
;

SELECT * FROM Products;

SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM OrderDetails;

SELECT * FROM ProductTypes;

SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantity
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductName;
   

   
 WITH OrderDays AS (
    SELECT 
        CustomerID,
        COUNT(DISTINCT OrderDate) AS UniqueDays
    FROM 
        Orders
    GROUP BY 
        CustomerID
)
SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
JOIN 
    OrderDays od ON o.CustomerID = od.CustomerID
WHERE 
    od.UniqueDays = 7
GROUP BY 
    c.CustomerName;
   
   
   SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerName
ORDER BY 
    TotalOrders DESC
LIMIT 1;


SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantity
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductName
ORDER BY 
    TotalQuantity DESC;
   
SELECT DISTINCT
    c.CustomerName
FROM
    Orders o
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
JOIN
    Products p ON od.ProductID = p.ProductID
JOIN
    Customers c ON o.CustomerID = c.CustomerID
WHERE
    p.ProductType = 'Widget';
   
   
WITH WidgetAndGadgetOrders AS (
    SELECT DISTINCT
        o.CustomerID
    FROM
        Orders o
    JOIN
        OrderDetails od ON o.OrderID = od.OrderID
    JOIN
        Products p ON od.ProductID = p.ProductID
    WHERE
        p.ProductType IN ('Widget', 'Gadget')
)
SELECT
    c.CustomerName,
    SUM(CASE WHEN p.ProductType = 'Widget' THEN od.Quantity * p.Price ELSE 0 END) AS TotalWidgetCost,
    SUM(CASE WHEN p.ProductType = 'Gadget' THEN od.Quantity * p.Price ELSE 0 END) AS TotalGadgetCost
FROM
    Orders o
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
JOIN
    Products p ON od.ProductID = p.ProductID
JOIN
    Customers c ON o.CustomerID = c.CustomerID
JOIN
    WidgetAndGadgetOrders wag ON o.CustomerID = wag.CustomerID
GROUP BY
    c.CustomerName;
   
   
SELECT
    c.CustomerName,
    SUM(od.Quantity * p.Price) AS TotalGadgetCost
FROM
    Orders o
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
JOIN
    Products p ON od.ProductID = p.ProductID
JOIN
    Customers c ON o.CustomerID = c.CustomerID
WHERE
    p.ProductType = 'Gadget'
GROUP BY
    c.CustomerName;
   
   
SELECT
    c.CustomerName,
    SUM(od.Quantity * p.Price) AS TotalDoohickeyCost
FROM
    Orders o
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
JOIN
    Products p ON od.ProductID = p.ProductID
JOIN
    Customers c ON o.CustomerID = c.CustomerID
WHERE
    p.ProductType = 'Doohickey'
GROUP BY
    c.CustomerName;
   
   
WITH DailyOrders AS (
    SELECT 
        CustomerID,
        COUNT(DISTINCT OrderDate) AS DaysOrdered
    FROM 
        Orders
    GROUP BY 
        CustomerID
)
SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
JOIN 
    DailyOrders d ON o.CustomerID = d.CustomerID
WHERE 
    d.DaysOrdered = 7
GROUP BY 
    c.CustomerName;
   
   
SELECT
    c.CustomerName,
    SUM(CASE WHEN p.ProductType = 'Widget' OR p.ProductType = 'Gadget' THEN od.Quantity ELSE 0 END) AS TotalWidgetsAndGadgetsOrdered,
    SUM(od.Quantity * p.Price) AS TotalOrderCost
FROM
    Orders o
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
JOIN
    Products p ON od.ProductID = p.ProductID
JOIN
    Customers c ON o.CustomerID = c.CustomerID
WHERE
    p.ProductType IN ('Widget', 'Gadget')
GROUP BY
    c.CustomerName;
   
   
   
   
   
   





   
   






 