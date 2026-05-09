SELECT p.prof_name from professors p
JOIN course c ON p.prof_ssn = c.prof_ssn 
WHERE p.prof_name LIKE 'A%'
GROUP BY p.prof_ssn, p.prof_name
HAVING COUNT(DISTINCT c.dname) = 1
   AND MAX(c.dname) = 'Computer Science';



SELECT s.sname
FROM student s
JOIN enroll e 
    ON s.sid = e.sid
JOIN course c 
    ON e.course_no = c.course_no
WHERE s.gender = 'Male'
GROUP BY s.sid, s.sname
HAVING SUM(c.dname = 'Civil Engineering') > 0
   AND SUM(c.dname = 'Computer Science') > 0;


SELECT s.sid, s.sname, s.gpa from student s
JOIN enroll e ON s.sid = e.sid
JOIN course c ON e.course_no = c.course_no
WHERE s.gender = 'Female' AND s.age <= 23
GROUP BY s.sid, s.sname, s.gpa
HAVING SUM(c.dname = 'Civil Engineering')>0;


SELECT e.dept_name FROM enroll e JOIN student s ON e.sid = s.sid
WHERE s.gender = 'Female' 
GROUP BY e.dept_name 
ORDER BY COUNT(*) DESC LIMIT 1;


SELECT d.dept_name, p.prof_name FROM department d 
JOIN professors p ON d.hod_ssn = p.prof_ssn 
JOIN course c ON d.dept_name = c.dname
GROUP BY d.dept_name, p.prof_name
HAVING COUNT(c.course_no) = (
    SELECT MIN(course_count)
    FROM (
        SELECT COUNT(*) AS course_count
        FROM course
        GROUP BY dname
    ) AS temp
);



SELECT c.course_no,
       c.cname,
       p.prof_name
FROM course c
JOIN professors p
ON c.prof_ssn = p.prof_ssn
WHERE c.dname = 'Civil Engineering';