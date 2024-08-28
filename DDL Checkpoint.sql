create table Customer (
CustomerID INT primary key,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100) NOT NULL,
Phone VARCHAR(10) NOT NULL,
Address VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
State VARCHAR(50) NOT NULL ,
ZipCode VARCHAR(10) NOT NULL

);


select * from Customer;

create table Categories(
CategoryID INT Primary key,
CategoryName VARCHAR(50) not null,
Description INT not null
);

select * from Categories;

create table Products(
ProductID INT Primary key,
ProductName VARCHAR(50) not null,
Description INT not null,
Price DECIMAL (10, 2) not null,
StockQuantity INT not null,
CategoryID INT not null,
 FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
 );

select * from Products;

create table Orders(
OrderID INT Primary key,
CustomerID INT not null,
OrderDate DATE not null,
TotalAmount DECIMAL(10, 2) not null,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

select * from Orders;

create table OrderDetails(
OrderDetailID INT Primary key,
OrderID INT not null,
ProductID INT not null,
Quantity INT not null,
UnitPrice DECIMAL(10, 2) not null,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
foreign key (ProductID) references Products(ProductID)
);

select * from OrderDetails;






