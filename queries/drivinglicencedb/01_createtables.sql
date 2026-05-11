-- -- PERSON TABLE

CREATE TABLE Person (
    driver_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200)
);

INSERT INTO Person (driver_id, name, address) VALUES
('D101', 'Steve Jobs', 'California'),
('D102', 'Elon Musk', 'Texas'),
('D103', 'Bill Gates', 'Washington'),
('D104', 'Sundar Pichai', 'California'),
('D105', 'Mark Zuckerberg', 'New York'),
('D106', 'Larry Page', 'California');



-- CAR TABLE
CREATE TABLE Car (
    license VARCHAR(20) PRIMARY KEY,
    model VARCHAR(50) NOT NULL,
    year INT
);

INSERT INTO Car (license, model, year) VALUES
('CAR101', 'Toyota Camry', 2020),
('CAR102', 'Honda Civic', 2019),
('CAR103', 'BMW X5', 2021),
('CAR104', 'Tesla Model S', 2023),
('CAR105', 'Audi A4', 2018),
('CAR106', 'Hyundai Creta', 2022);



-- ACCIDENT TABLE

CREATE TABLE Accident (
    report_number INT PRIMARY KEY,
    accident_date DATE NOT NULL,
    location VARCHAR(100)
);

INSERT INTO Accident (report_number, accident_date, location) VALUES
(1001, '2024-01-15', 'New York'),
(1002, '2024-03-10', 'California'),
(1003, '2023-11-05', 'Texas'),
(1004, '2022-07-19', 'Chicago'),
(1005, '2021-09-25', 'Florida');


-- OWNS RELATIONSHIP TABLE
CREATE TABLE Owns (
    driver_id VARCHAR(20),
    license VARCHAR(20),

    PRIMARY KEY (driver_id, license),

    FOREIGN KEY (driver_id)
        REFERENCES Person(driver_id)
        ON DELETE CASCADE,

    FOREIGN KEY (license)
        REFERENCES Car(license)
        ON DELETE CASCADE
);

INSERT INTO Owns (driver_id, license) VALUES
('D101', 'CAR101'),
('D101', 'CAR103'),
('D102', 'CAR104'),
('D103', 'CAR102'),
('D104', 'CAR105'),
('D105', 'CAR106');




-- PARTICIPATED RELATIONSHIP TABLE
CREATE TABLE Participated (
    driver_id VARCHAR(20),
    license VARCHAR(20),
    report_number INT,
    damage_amount DECIMAL(10,2),

    PRIMARY KEY (driver_id, license, report_number),

    FOREIGN KEY (driver_id)
        REFERENCES Person(driver_id)
        ON DELETE CASCADE,

    FOREIGN KEY (license)
        REFERENCES Car(license)
        ON DELETE CASCADE,

    FOREIGN KEY (report_number)
        REFERENCES Accident(report_number)
        ON DELETE CASCADE
);


INSERT INTO Participated (driver_id, license, report_number, damage_amount) VALUES
('D101', 'CAR101', 1001, 50000.00),
('D101', 'CAR103', 1002, 120000.00),
('D102', 'CAR104', 1002, 80000.00),
('D103', 'CAR102', 1003, 25000.00),
('D104', 'CAR105', 1004, 150000.00),
('D105', 'CAR106', 1005, 40000.00);