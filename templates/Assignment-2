/*Assignment 2*/

CREATE TABLE company(
cmp_id INT PRIMARY KEY,
company_name VARCHAR(100),
city VARCHAR(50)
);

CREATE TABLE employee(
emp_id INT PRIMARY KEY,
employee_name VARCHAR(100),
street VARCHAR(50),
city VARCHAR(50),
email_id VARCHAR(50),
cmp_id INT,
salary FLOAT,

FOREIGN KEY (cmp_id) REFERENCES company(cmp_id)
);

CREATE TABLE manages(
emp_id INT PRIMARY KEY,
mgr_id INT,

FOREIGN KEY (mgr_id) REFERENCES employee(emp_id)
);

INSERT INTO company
(cmp_id, company_name, city)
VALUES
(1, 'First Bank Corporation', 'Varanasi'),
(2, 'Yes Bank Corporation', 'Mumbai'),
(3, 'Small Bank Corporation', 'Delhi'),
(4, 'HDFC Bank', 'Lucknow');

INSERT INTO employee
(emp_id, employee_name, street, city, email_id, cmp_id, salary)
VALUES
(101, 'Amit', 'MG Road', 'Varanasi', 'amit@gmail.com', 1, 35000),
(102, 'Priya', 'Civil Lines', 'Mumbai', 'priya@gmail.com', 2, 42000),
(103, 'Rohan', 'GT Road', 'Delhi', 'rohan@gmail.com', 3, 28000),
(104, 'Pooja', 'Lanka', 'Varanasi', 'pooja@gmail.com', 1, 55000),
(105, 'Smith Jones', 'Bhelupur', 'Varanasi', 'smith@gmail.com', 4, 70000),
(106, 'Pankaj', 'Sigra', 'Lucknow', 'pankaj@gmail.com', 1, 50000);

INSERT INTO manages
(emp_id, mgr_id)
VALUES
(101, 105),
(102, 105),
(103, 105),
(104, 105),
(106, 105);


SELECT emp.employee_name,emp.city
FROM employee AS emp
JOIN company AS cmp
ON emp.cmp_id=cmp.cmp_id
WHERE cmp.company_name='First Bank Corporation'

SELECT emp.employee_name,cmp.company_name
FROM employee AS emp
JOIN company AS cmp
ON emp.cmp_id=cmp.cmp_id
WHERE cmp.company_name IN ('First Bank Corporation','Yes Bank Corporation')

select emp.employee_name,cmp.company_name
from employee emp
join company cmp
on emp.cmp_id=cmp.cmp_id
where emp.salary BETWEEN 20000 AND 50000

select emp.employee_name,emp.street,emp.city  ||' Works for First BANK CORPORATION'
from employee emp
join company cmp
on emp.cmp_id=cmp.cmp_id
where cmp.company_name='First Bank Corporation' and emp.salary>50000

select emp.employee_name,cmp.company_name
from employee emp
join company cmp
on emp.cmp_id=cmp.cmp_id
where cmp.company_name<>'First Bank Corporation' 

select * 
from employee emp
join manages mgr
on emp.emp_id=mgr.emp_id


select * 
from employee emp
join manages mgr
on mgr.mgr_id=emp.emp_id


select emp.employee_name,' Manager Name '||manager.employee_name 
from employee emp
join manages mgr
on emp.emp_id=mgr.emp_id
join employee manager 
on manager.emp_id=mgr.mgr_id
where manager.employee_name='Smith Jones'

select DISTINCT emp.employee_name,emp.city
from manages mgr
join employee emp
on mgr.mgr_id=emp.emp_id
where emp.city='Varanasi'



select distinct emp.employee_name,emp.city,emp.salary
from manages mgr
join employee emp
on mgr.mgr_id=emp.emp_id
where emp.employee_name LIKE 'S%'

select emp.employee_name,cmp.company_name
from employee emp
join company cmp
on emp.cmp_id=cmp.cmp_id
where cmp.company_name LIKE '_e%'

select emp.employee_name,cmp.company_name,emp.city,cmp.city
from employee emp
join company cmp
on emp.cmp_id=cmp.cmp_id
where cmp.city=emp.city

select emp.employee_name,manager.city,emp.city
from employee emp
join manages mgr
on emp.emp_id=mgr.emp_id
join employee manager
on mgr.mgr_id=manager.emp_id
where manager.city=emp.city AND manager.street=emp.street

select emp.employee_name,emp.salary
from employee emp
where emp.salary>ALL(
					select e.salary
					from employee e
					join company cmp
					on e.cmp_id=cmp.cmp_id
					where cmp.company_name='Small Bank Corporation'
					)

select emp.employee_name,emp.salary
from employee emp
where salary> ALL(
select AVG(e.salary)
from employee e
where emp.cmp_id=e.cmp_id
)

select cmp.company_name,COUNT(emp.emp_id)
from company cmp
join employee emp
on emp.cmp_id=cmp.cmp_id
GROUP BY cmp.cmp_id
ORDER BY COUNT(emp.emp_id) ASC

select cmp.company_name,MIN(emp.salary)
from company cmp
join employee emp 
on cmp.cmp_id=emp.cmp_id
GROUP BY cmp.company_name
ORDER BY MIN(emp.salary)

update employee
set city='New Delhi'
where employee_name='Smith Jones'



update employee 
set salary=salary+(salary*0.1)
where cmp_id=(select cmp_id
from company 
where company_name='First Bank Corporation')

select * from employee







