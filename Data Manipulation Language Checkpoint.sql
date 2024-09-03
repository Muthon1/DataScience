create table Vehiclez (
LicencePlate VARCHAR(15) primary key,
Make text,
Model text,
year INT,
Color text,
VIN VARCHAR(17)
);

select * from Vehiclez;

create table Driver (
FirstName text,
LastName text,
LicenseNumber VARCHAR(20),
Phone VARCHAR(15),
Address VARCHAR(100),
City text,
State text,
ZipCode VARCHAR(10)
);

create table Trip (
VehicleID INT,
DriverID INT,
StartDate DATE,
EndDate DATE,
StartLocation text,
EndLocation text,
Distance VARCHAR
);

create table Maintenances (
VehicleID INT,
MaintenanceDate DATE,
Description text,
cost DECIMAL
);

insert into Vehiclez (LicencePlate, Make, Model, year, Color, VIN) values
('ABC123', 'Toyota', 'Corolla', 2020, 'White', '1HGCM82633A004352'),
('XYZ789', 'Ford', 'Fusion', 2018, 'Blue', '2HGCM82633A004353');

select * from Vehiclez;

select * from Driver;

INSERT INTO Driver (FirstName, LastName, LicenseNumber, Phone, Address, City, State, ZipCode) values
('Michael', 'Smith', 'D1234567', '1234567890', '123 Main St', 'Anytown', 'CA', '12345'),
('Sarah', 'Connor', 'D7654321', '0987654321', '456 Elm St', 'Otherville', 'NY', '54321');

select * from Driver;

INSERT INTO Trip (VehicleID, DriverID, StartDate, EndDate, StartLocation, EndLocation, Distance) values
(1, 1, '2024-07-01', '2024-07-02', 'Los Angeles', 'San Francisco', 380),
(2, 2, '2024-07-03', '2024-07-04', 'New York', 'Washington D.C.', 225);

INSERT INTO Maintenances (VehicleID, MaintenanceDate, Description, Cost) values
(1, '2024-06-15', 'Oil change', 50.00),
(2, '2024-06-20', 'Tire replacement', 300.00);

select * from Maintenances;

UPDATE Maintenances
SET Cost = 350.00
WHERE VehicleID = 2 AND MaintenanceDate = '2024-06-20';

select * from Maintenances;

delete from Vehiclez
WHERE LicencePlate = 'ABC123';

select * from Vehiclez;

INSERT INTO Trip (VehicleID, DriverID, StartDate, EndDate, StartLocation, EndLocation, Distance) values
(2, 1, '2024-07-05', '2024-07-06', 'Boston', 'Philadelphia', 300);

select * from Trip;



select * from Vehiclez;

update Vehiclez
set Color = 'Red'where LicencePlate = 'XYZ789'

select * from Vehiclez;

insert into Maintenances (VehicleID, MaintenanceDate, Description, Cost) values
(1, '2024-07-10', 'Brake inspection', 100.00);

update Driver 
set Phone = '2223334444'
where Licensenumber = 'D1234567';

select * from Driver;

delete from Trip
where VehicleID = 2 and StartDate = '2024-07-03' and EndDate = '2024-07-04';

select * from Trip;



