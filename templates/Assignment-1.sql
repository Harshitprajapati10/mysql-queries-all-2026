CREATE TABLE EMPLOYEE_ASSI1(
emp_id INT PRIMARY KEY,
name VARCHAR(50),
age INT,
salary FLOAT,
city VARCHAR(50),
country VARCHAR(50),
email_id VARCHAR(50)
);

INSERT INTO EMPLOYEE_ASSI1 VALUES
(1,'Ashwini',22,2300,'Varanasi','India','ashwinichaturvedi8924@gmail.com'),
(2,'Ashwini Chaturvedi',22,2300,'Varanasi','India','ashwinichaturvedi8924@gmail.com'),
(3,'Aieshi',21,23000,'Gorakhpur','India','aieshishukla630@gmail.com'),
(4,'Aieshi Shukla',21,23000,'Gorakhpur','India','aieshishukla630@gmail.com');

/*1*/
SELECT emp_id,name,age,salary 
FROM EMPLOYEE_ASSI1

SELECT name,age,salary
FROM EMPLOYEE_ASSI1 
WHERE city='Varanasi'

SELECT name,age,salary
FROM employee_assi1
WHERE city<>'Varanasi'

INSERT INTO EMPLOYEE_ASSI1 VALUES
(7,'Anujiii',2,200,'Varanasi','India','ashwinichaturvedi8924@gmail.com'),
(6,'Ashwini Chturvedi',22,23400,'Varanasi','India','ashwinichaturvedi8924@gmail.com')

SELECT name,salary
FROM employee_assi1
WHERE city='Varanasi'
ORDER BY emp_id

SELECT emp_id,name,age,salary
FROM employee_assi1
WHERE city='Varanasi' AND age<20

SELECT name,salary
FROM employee_assi1
WHERE city='Varanasi' OR city='Gorakhpur'

SELECT name,age,salary 
FROM employee_assi1
WHERE salary BETWEEN 2300 AND salary<45000

INSERT INTO EMPLOYEE_ASSI1 VALUES
(8,'Pratibha',47,400000,'Varanasi','Germany','ashwinichaturvedi8924@gmail.com'),
(9,'Aaditya Chaturvedi',22,600000,'Mandavi','Germany','ashwinichaturvedi8924@gmail.com'),
(10,'Aryan',21,23000,'Gorakhpur','France','aieshishukla630@gmail.com'),
(11,'Aryan Shukla',21,23000,'Gorakhpur','France','aieshishukla630@gmail.com');

SELECT name,salary,country
FROM employee_assi1
WHERE country='India' OR country='France' OR country='Germany'

SELECT name,salary,country
FROM employee_assi1
WHERE country IN('India','France','Germany')

SELECT name,salary,country
FROM employee_assi1
WHERE country!='India' OR country!='France' OR country!='Germany'

SELECT name,salary
FROM employee_assi1
WHERE name LIKE '%i'

SELECT name,country
FROM employee_assi1
WHERE country LIKE '___%i';

SELECT name,email_id
FROM employee_assi1
WHERE email_id LIKE '%@gmail.com'

SELECT country,COUNT(emp_id),AVG(salary),MAX(salary)
FROM employee_assi1
GROUP BY country




