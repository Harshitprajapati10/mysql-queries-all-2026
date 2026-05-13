CREATE DATABASE IF NOT EXISTS dbms_assignment4;

USE dbms_assignment4;


DROP TABLE IF EXISTS Certified;
DROP TABLE IF EXISTS Flights;
DROP TABLE IF EXISTS Aircraft;
DROP TABLE IF EXISTS Employees;


CREATE TABLE Flights (
    flno INT PRIMARY KEY,
    frm VARCHAR(50),
    too VARCHAR(50),
    distance INT,
    departs TIME,
    arrives TIME,
    price INT
);

CREATE TABLE Aircraft (
    aid INT PRIMARY KEY,
    aname VARCHAR(50),
    cruisingrange INT
);

CREATE TABLE Employees (
    eid INT PRIMARY KEY,
    ename VARCHAR(50),
    salary INT
);

CREATE TABLE Certified (
    eid INT,
    aid INT,
    FOREIGN KEY (eid) REFERENCES Employees(eid),
    FOREIGN KEY (aid) REFERENCES Aircraft(aid)
);


INSERT INTO Flights VALUES
(1,'Bangalore','Mangalore',360,'10:45:00','12:00:00',10000),
(2,'Bangalore','Delhi',5000,'12:15:00','04:30:00',25000),
(3,'Bangalore','Mumbai',3500,'02:15:00','05:25:00',30000),
(4,'Delhi','Mumbai',4500,'10:15:00','12:05:00',35000),
(5,'Delhi','Frankfurt',18000,'07:15:00','05:30:00',90000),
(6,'Bangalore','Frankfurt',19500,'10:00:00','07:45:00',95000),
(7,'Bangalore','Frankfurt',17000,'12:00:00','06:30:00',99000);


INSERT INTO Aircraft VALUES
(123,'Airbus',1000),
(302,'Boeing',5000),
(306,'Jet01',5000),
(378,'Airbus380',8000),
(456,'Aircraft',500),
(789,'Aircraft02',800),
(951,'Aircraft03',1000);


INSERT INTO Employees VALUES
(1,'Ashwini',30000),
(2,'Karan',85000),
(3,'Vivek',50000),
(4,'Prashant',45000),
(5,'Brijesh',90000),
(6,'Shraddha',75000),
(7,'Ritika',100000);


INSERT INTO Certified VALUES
(1,123),
(2,123),
(1,302),
(5,302),
(7,302),
(1,306),
(2,306),
(1,378),
(2,378),
(4,378),
(3,456),
(6,456),
(1,789),
(5,789),
(6,789),
(1,951),
(3,951);


SELECT a.aname
FROM Aircraft a
WHERE NOT EXISTS (
    SELECT *
    FROM Certified c
    JOIN Employees e ON c.eid = e.eid
    WHERE c.aid = a.aid
    AND e.salary <= 80000
);



SELECT c.eid, MAX(a.cruisingrange) AS max_range
FROM Certified c
JOIN Aircraft a ON c.aid = a.aid
GROUP BY c.eid
HAVING COUNT(c.aid) > 3;



SELECT e.ename
FROM Employees e
WHERE e.salary < (
    SELECT MIN(price)
    FROM Flights
    WHERE frm = 'Bangalore'
    AND too = 'Mumbai'
);



SELECT a.aname, AVG(e.salary) AS avg_salary
FROM Aircraft a
JOIN Certified c ON a.aid = c.aid
JOIN Employees e ON c.eid = e.eid
WHERE a.cruisingrange > 1000
GROUP BY a.aname;


SELECT DISTINCT e.ename
FROM Employees e
JOIN Certified c ON e.eid = c.eid
JOIN Aircraft a ON c.aid = a.aid
WHERE a.aname LIKE 'Boeing%';



SELECT a.aid
FROM Aircraft a
WHERE a.cruisingrange >= (
    SELECT distance
    FROM Flights
    WHERE frm = 'Bangalore'
    AND too = 'Delhi'
);



SELECT f.flno
FROM Flights f
WHERE NOT EXISTS (
    SELECT e.eid
    FROM Employees e
    WHERE e.salary > 100000
    AND NOT EXISTS (
        SELECT *
        FROM Certified c
        JOIN Aircraft a ON c.aid = a.aid
        WHERE c.eid = e.eid
        AND a.cruisingrange >= f.distance
    )
);



SELECT e.ename
FROM Employees e
WHERE e.eid IN (
    SELECT c.eid
    FROM Certified c
    JOIN Aircraft a ON c.aid = a.aid
    WHERE a.cruisingrange > 3000
)
AND e.eid NOT IN (
    SELECT c.eid
    FROM Certified c
    JOIN Aircraft a ON c.aid = a.aid
    WHERE a.aname LIKE 'Boeing%'
);



SELECT departs
FROM Flights
WHERE frm = 'Bangalore'
AND too = 'Frankfurt'
AND departs < '18:00:00';


SELECT
(
    SELECT AVG(salary)
    FROM Employees
    WHERE eid IN (
        SELECT eid
        FROM Certified
    )
)
-
(
    SELECT AVG(salary)
    FROM Employees
) AS salary_difference;


SELECT ename, salary
FROM Employees
WHERE eid NOT IN (
    SELECT eid
    FROM Certified
)
AND salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE eid IN (
        SELECT eid
        FROM Certified
    )
);
