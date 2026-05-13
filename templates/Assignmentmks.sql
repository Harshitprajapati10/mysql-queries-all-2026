
CREATE TABLE employee(
employee_name VARCHAR(100) PRIMARY KEY,
street VARCHAR(50),
city VARCHAR(50),
email_id VARCHAR(50)
);

CREATE TABLE company(
company_name VARCHAR(100) PRIMARY KEY,
city VARCHAR(50)
);

CREATE TABLE works(
employee_name VARCHAR(100) PRIMARY KEY,
company_name VARCHAR(100),
salary DECIMAL(10,2),
FOREIGN KEY(employee_name) REFERENCES employee(employee_name),
FOREIGN KEY(company_name) REFERENCES company(company_name)
);


CREATE TABLE manages(
employee_name VARCHAR(100) PRIMARY KEY,
manager_name VARCHAR(100),
FOREIGN KEY(employee_name) REFERENCES employee(employee_name)
);

-- EMPLOYEE TABLE
INSERT INTO employee (employee_name, street, city, email_id) VALUES
('Amit Sharma', 'MG Road', 'Delhi', 'amit@gmail.com'),
('Priya Singh', 'Park Street', 'Kolkata', 'priya@yahoo.com'),
('Pooja Gupta', 'Sigra', 'Varanasi', 'pooja@gmail.com'),
('Pankaj Mishra', 'Lanka', 'Varanasi', 'pankaj@gmail.com'),
('Rahul Verma', 'Brigade Road', 'Bangalore', 'rahul@outlook.com'),
('Sneha Gupta', 'Hazratganj', 'Lucknow', 'sneha@gmail.com'),
('Rohan Das', 'Marine Drive', 'Mumbai', 'rohan@gmail.com'),
('Preeti Jain', 'Banjara Hills', 'Hyderabad', 'preeti@gmail.com'),
('Ankit Tiwari', 'Civil Lines', 'Prayagraj', 'ankit@yahoo.com'),
('Neha Sharma', 'Alambagh', 'Lucknow', 'neha@gmail.com');



-- COMPANY TABLE
INSERT INTO company (company_name, city) VALUES
('First Bank Corporation', 'Mumbai'),
('Yes Bank Corporation', 'Mumbai'),
('Infosys', 'Bangalore'),
('Google', 'Bangalore'),
('Amazon', 'Hyderabad'),
('HCL', 'Noida'),
('TCS', 'Mumbai');



-- WORKS TABLE
INSERT INTO works (employee_name, company_name, salary) VALUES
('Amit Sharma', 'First Bank Corporation', 45000),
('Priya Singh', 'Yes Bank Corporation', 52000),
('Pooja Gupta', 'First Bank Corporation', 30000),
('Pankaj Mishra', 'First Bank Corporation', 15000),
('Rahul Verma', 'Google', 90000),
('Sneha Gupta', 'Infosys', 40000),
('Rohan Das', 'TCS', 25000),
('Preeti Jain', 'Yes Bank Corporation', 48000),
('Ankit Tiwari', 'Amazon', 70000),
('Neha Sharma', 'HCL', 35000);



-- MANAGES TABLE
INSERT INTO manages (employee_name, manager_name) VALUES
('Amit Sharma', 'Smith Jones'),
('Pooja Gupta', 'Smith Jones'),
('Pankaj Mishra', 'Smith Jones'),
('Priya Singh', 'Rakesh Kumar'),
('Preeti Jain', 'Rakesh Kumar'),
('Rahul Verma', 'Anil Mehta'),
('Sneha Gupta', 'Pooja Gupta'),
('Rohan Das', 'Priya Singh'),
('Ankit Tiwari', 'Rahul Verma'),
('Neha Sharma', 'Pankaj Mishra');


SELECT emp.employee_name,cmp.company_name
FROM employee emp
JOIN works w
ON emp.employee_name=w.employee_name
JOIN company cmp
ON w.company_name=cmp.company_name
WHERE cmp.company_name='First Bank Corporation';

SELECT emp.employee_name,cmp.company_name
FROM employee emp
JOIN works w
ON emp.employee_name=w.employee_name
JOIN company cmp
ON w.company_name=cmp.company_name
WHERE cmp.company_name IN('First Bank Corporation','Yes Bank Corporation');


SELECT emp.employee_name,w.salary
FROM employee emp
JOIN works w
ON emp.employee_name=w.employee_name
WHERE w.salary BETWEEN 20000 AND 50000

SELECT emp.employee_name,cmp.company_name
FROM employee emp
JOIN works w
ON w.employee_name=emp.employee_name
JOIN company cmp
ON w.company_name=cmp.company_name
WHERE cmp.company_name<>'First Bank Corporation'

SELECT emp.employee_name,mgr.manager_name
FROM employee emp
JOIN manages mgr
ON mgr.employee_name=emp.employee_name
WHERE mgr.manager_name='Smith Jones'




