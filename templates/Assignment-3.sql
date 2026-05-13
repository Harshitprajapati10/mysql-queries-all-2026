create database assignment3;
use assignment3;
CREATE TABLE Hotel (
    Hotel_No VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Room (
    Room_No INT,
    Hotel_No VARCHAR(10),
    Type CHAR(1),
    Price DECIMAL(10,2),
    PRIMARY KEY (Room_No, Hotel_No),
    FOREIGN KEY (Hotel_No) REFERENCES Hotel(Hotel_No)
);

CREATE TABLE Guest (
    Guest_No VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Booking (
    Hotel_No VARCHAR(10),
    Room_No INT,
    Guest_No VARCHAR(10),
    Date_From DATE,
    Date_To DATE,
    PRIMARY KEY (Hotel_No, Room_No, Guest_No, Date_From),
    FOREIGN KEY (Hotel_No) REFERENCES Hotel(Hotel_No),
    FOREIGN KEY (Guest_No) REFERENCES Guest(Guest_No)
);
INSERT INTO Hotel VALUES 
('H111', 'Empire Hotel', 'New York'),
('H235', 'Park Place', 'New York'),
('H432', 'Brownstone Hotel', 'Toronto'),
('H498', 'James Plaza', 'Toronto'),
('H193', 'Devon Hotel', 'Boston'),
('H437', 'Clairmont Hotel', 'Boston');

INSERT INTO Room VALUES 
(313, 'H111', 'S', 145.00), 
(412, 'H111', 'N', 145.00), 
(1267, 'H235', 'N', 175.00),
(1289, 'H235', 'N', 195.00),
(876, 'H432', 'S', 124.00), 
(898, 'H432', 'S', 124.00), 
(345, 'H498', 'S', 160.00),
(467, 'H498', 'N', 180.00), 
(1001, 'H193', 'S', 150.00),
(1201, 'H193', 'N', 175.00), 
(257, 'H437', 'N', 140.00), 
(223, 'H437', 'N', 155.00);

INSERT INTO Guest VALUES 
('G256', 'Adam Wayne', 'Pittsburgh'),
('G367', 'Tara Cummings', 'Baltimore'),
('G879', 'Vanessa Parry', 'Pittsburgh'),
('G230', 'Tom Hancock', 'Philadelphia'),
('G467', 'Robert Swift', 'Atlanta'),
('G190', 'Edward Cane', 'Baltimore');

INSERT INTO Booking VALUES 
('H111', 412, 'G256', '1999-08-10', '1999-08-15'),
('H111', 412, 'G367', '1999-08-18', '1999-08-21'),
('H235', 1267, 'G879', '1999-09-05', '1999-09-12'),
('H498', 467, 'G230', '1999-09-15', '1999-09-18'),
('H498', 345, 'G256', '1999-11-30', '1999-12-02'),
('H498', 345, 'G467', '1999-11-03', '1999-11-05'),
('H193', 1001, 'G190', '1999-11-15', '1999-11-19'),
('H193', 1001, 'G367', '1999-09-12', '1999-09-14'),
('H193', 1201, 'G367', '1999-10-01', '1999-10-06'),
('H437', 223, 'G190', '1999-10-04', '1999-10-06'),
('H437', 223, 'G879', '1999-09-14', '1999-09-17');

SELECT * FROM Hotel;

SELECT * FROM Hotel
WHERE City = 'New York';

SELECT Name, City FROM Guest
ORDER BY City;

SELECT * FROM Room
WHERE Type = 'N'
ORDER BY Price ASC;

SELECT COUNT(*) AS Total_Hotels FROM Hotel;

SELECT DISTINCT City FROM Guest;

SELECT AVG(Price) AS Avg_Price FROM Room;

SELECT H.Name, R.Room_No, R.Type
FROM Hotel H
JOIN Room R ON H.Hotel_No = R.Hotel_No;

SELECT H.Name, B.Date_From, B.Date_To, B.Room_No
FROM Hotel H
JOIN Booking B ON H.Hotel_No = B.Hotel_No
WHERE H.City = 'New York';

SELECT COUNT(*) AS Sept_Bookings
FROM Booking
WHERE MONTH(Date_From) = 9;

SELECT G.Name, G.City
FROM Guest G
JOIN Booking B ON G.Guest_No = B.Guest_No
JOIN Hotel H ON B.Hotel_No = H.Hotel_No
WHERE H.City = 'New York'
AND MONTH(B.Date_From) = 8;

SELECT H.Name, R.Room_No
FROM Hotel H
JOIN Room R ON H.Hotel_No = R.Hotel_No
WHERE (R.Hotel_No, R.Room_No) NOT IN (
    SELECT Hotel_No, Room_No FROM Booking
);

SELECT H.Name, H.City
FROM Hotel H
JOIN Room R ON H.Hotel_No = R.Hotel_No
WHERE R.Price = (SELECT MAX(Price) FROM Room);

SELECT H.Name, R.Room_No, H.City, R.Price
FROM Hotel H
JOIN Room R ON H.Hotel_No = R.Hotel_No
WHERE R.Price < (
    SELECT MIN(R2.Price)
    FROM Room R2
    JOIN Hotel H2 ON R2.Hotel_No = H2.Hotel_No
    WHERE H2.City = 'Boston'
);

SELECT H.City, AVG(R.Price) AS Avg_Price
FROM Hotel H
JOIN Room R ON H.Hotel_No = R.Hotel_No
GROUP BY H.City;
