SELECT * FROM Staff s 
JOIN Branch b ON b.branchNo = s.branchNo
WHERE s.gender = 'Male' AND s.salary > 80000 AND b.city = 'Mumbai';



SELECT * FROM Staff s 
JOIN Branch b ON b.branchNo = s.branchNo
WHERE s.gender = 'Male' AND b.city IN ('New Delhi','Kolkata')
AND s.position = 'Manager';



SELECT * FROM `Property` p WHERE p.rent <4000 ORDER BY p.rent;


SELECT * FROM `Owner` o WHERE o.address LIKE '%Lucknow%';


SELECT SUM(s.salary) FROM `Staff` s 
GROUP BY s.gender HAVING s.gender = 'Male';


SELECT COUNT(p.propertyNo) from `Property` p
WHERE p.rent > 3500;


SELECT COUNT(s.staffNo), SUM(s.salary) from `Staff` s
WHERE s.position = 'Manager';


SELECT *
FROM Staff s
WHERE s.salary > (
    SELECT AVG(s1.salary)
    FROM Staff s1
    WHERE s1.branchNo = s.branchNo
);



UPDATE Staff
SET salary = salary * 1.05
WHERE position = 'Manager';
