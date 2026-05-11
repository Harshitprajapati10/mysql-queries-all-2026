-- Person(driver_id, name, address)

-- Car(license, model, year)

-- Accident(report_number, accident_date, location)

-- Owns(driver_id, license)

-- Participated(driver_id, license, report_number, damage_amount)



SELECT COUNT(DISTINCT o.driver_id) FROM Owns o
JOIN Participated p ON o.license = p.license
JOIN `Accident` a ON a.report_number = p.report_number
WHERE a.accident_date LIKE '2024%';

INSERT INTO `Accident` VALUES
(1006,'2025-6-17','New Mexico');


SELECT COUNT(a.report_number) FROM `Accident` a
JOIN `Participated` p ON a.report_number = p.report_number
JOIN `Person` person ON p.driver_id = person.driver_id
WHERE person.name = 'Steve Jobs';



SELECT c.model,a.location FROM Car c
JOIN `Participated` P ON c.license = P.license
JOIN `Accident` a ON P.report_number = a.report_number
ORDER BY P.damage_amount DESC LIMIT 1;



SELECT p.name
FROM Person p
LEFT JOIN Participated pa
    ON p.driver_id = pa.driver_id
WHERE pa.report_number IS NULL;


SELECT DISTINCT c.model
FROM Car c
JOIN Participated p
    ON c.license = p.license
JOIN Accident a
    ON p.report_number = a.report_number
WHERE a.accident_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);