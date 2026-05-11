SELECT COUNT(DISTINCT o.driver_id)
FROM Owns o
WHERE o.license NOT IN (
    SELECT p.license
    FROM Participated p
    JOIN Accident a
        ON p.report_number = a.report_number
    WHERE YEAR(a.accident_date) = 2024
);



SELECT COUNT(DISTINCT p.report_number)
FROM Car c
JOIN Participated p
    ON c.license = p.license
WHERE c.model LIKE 'Hyundai%';



SELECT a.location
FROM Accident a
GROUP BY a.location
ORDER BY COUNT(*) DESC
LIMIT 1;



SELECT YEAR(a.accident_date) AS year,
       a.location
FROM Accident a
JOIN Participated p
    ON a.report_number = p.report_number
WHERE p.damage_amount > 5000;



SELECT DISTINCT pe.name
FROM Person pe
JOIN Participated p
    ON pe.driver_id = p.driver_id
JOIN Accident a
    ON p.report_number = a.report_number
WHERE a.location = 'Lucknow';


SELECT c.model
FROM Car c
LEFT JOIN Participated p
    ON c.license = p.license
WHERE p.report_number IS NULL;