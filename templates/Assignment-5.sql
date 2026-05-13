CREATE DATABASE IF NOT EXISTS dbms_assignment5;

USE dbms_assignment5;

DROP TABLE IF EXISTS Borrowed;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
    book_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    published_year DATE,
    genre VARCHAR(100),
    available_copies INT DEFAULT 0
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE Borrowed (
    borrow_id INT PRIMARY KEY,
    book_id VARCHAR(10),
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    fine DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);


INSERT INTO Books VALUES
('551', 'The_Great_Gatsby', 'F_Scott_Fitzgerald', '1925-04-10', 'Tragedy', 10000),
('552', 'Ulysses', 'James_Joyce', '1922-02-02', 'Modernist_Novel', 10000),
('553', 'Lolita', 'Vladimir_Nabokov', '1955-20-01', 'Novel', 10000),
('554', 'Brave_New_World', 'Aldous_Huxley', '1932-05-05', 'Science_Fiction_Dystopian_Fiction', 10000),
('555', 'The_Sound_And_The_Fury', 'William_Faulkner', '1929-01-03', 'Southern_Gothic', 10000),
('556', 'Catch22', 'Joseph_Heller', '1961-10-10', 'Dark_Comedy', 10000),
('557', 'The_Grapes_Of_Wrath', 'John_Steinbeck', '1939-14-04', 'Novel', 10000),
('558', 'I_Claudius', 'Robert_Graves', '1934-08-10', 'Historical', 10000),
('559', 'To_The_Lighthouse', 'Virginia_Woolf', '1927-05-05', 'Modernism', 10000),
('560', 'Slaughterhouse_Five', 'Kurt_Vonnegut', '1969-03-10', 'War_Novel', 10000),
('561', 'Invisible_Man', 'Ralph_Ellison', '1952-14-04', 'African_American_Literature', 10000),
('562', 'Native_Son', 'Richard_Wright', '1940-01-03', 'Social_Protest', 10000),
('563', 'USA_Trilogy', 'John_Dos_Passos', '1930-40-05', 'Political_Fiction', 10000),
('564', 'A_Passage_To_India', 'E_M_Forster', '1924-04-06', 'Novel', 10000),
('565', 'Tender_Is_The_Night', 'F_Scott_Fitzgerald', '1934-12-04', 'Tragedy', 10000),
('566', 'Animal_Farm', 'George_Orwell', '1945-17-08', 'Political_Satire', 10000),
('567', 'The_Golden_Bowl', 'Henry_James', '1904-10-11', 'Philosophy', 10000),
('568', 'A_Handful_Of_Dust', 'Evelyn_Waugh', '1934-06-03', 'Fiction', 10000),
('569', 'As_I_Lay_Dying', 'William_Faulkner', '1930-03-02', 'Black_Comedy', 10000),
('570', 'The_Heart_Of_The_Matter', 'Graham_Greene', '1948-03-02', 'Novel', 10000);


INSERT INTO Members VALUES
(1, 'John Smith', 'john@gmail.com', 25, 'Male'),
(2, 'Alice', 'alice@gmail.com', 30, 'Female'),
(3, 'Bob', 'bob@gmail.com', 65, 'Male'),
(4, 'Emma', 'emma@gmail.com', 70, 'Female');


INSERT INTO Borrowed VALUES
(1, '551', 1, '2024-01-01', '2024-01-10', 0),
(2, '552', 2, '2024-01-05', NULL, 0),
(3, '553', 3, '2024-01-01', NULL, 50),
(4, '551', 2, '2024-02-01', '2024-02-05', 0);


SELECT COUNT(*)
FROM Borrowed b
JOIN Members m ON b.member_id = m.member_id
WHERE m.name = 'John Smith';


SELECT DISTINCT m.name
FROM Borrowed b
JOIN Books bk ON b.book_id = bk.book_id
JOIN Members m ON b.member_id = m.member_id
WHERE bk.title = 'Atomic Habits';


SELECT genre, SUM(available_copies)
FROM Books
GROUP BY genre;


SELECT genre, COUNT(*) AS count
FROM Borrowed b
JOIN Books bk ON b.book_id = bk.book_id
JOIN Members m ON b.member_id = m.member_id
WHERE m.gender = 'Female'
GROUP BY genre
ORDER BY count DESC
LIMIT 1;


SELECT genre, COUNT(*) AS count
FROM Borrowed b
JOIN Books bk ON b.book_id = bk.book_id
JOIN Members m ON b.member_id = m.member_id
WHERE m.age >= 60
GROUP BY genre
ORDER BY count DESC
LIMIT 1;


SELECT *
FROM Borrowed
WHERE return_date IS NOT NULL
AND DATEDIFF(return_date, borrow_date) <= 14;


SELECT bk.title, m.name
FROM Borrowed b
JOIN Books bk ON b.book_id = bk.book_id
JOIN Members m ON b.member_id = m.member_id
WHERE b.return_date IS NULL
AND DATEDIFF(CURDATE(), b.borrow_date) > 14;


SELECT genre, COUNT(*) AS total
FROM Borrowed b
JOIN Books bk ON b.book_id = bk.book_id
GROUP BY genre
ORDER BY total DESC
LIMIT 1;


ALTER TABLE Borrowed
ADD fine_amount DECIMAL(10,2) DEFAULT 0;


SELECT SUM(fine_amount) AS total_fine
FROM Borrowed
WHERE return_date IS NULL;


SELECT m.name, COUNT(*) AS total_books
FROM Borrowed b
JOIN Members m ON b.member_id = m.member_id
GROUP BY m.name
ORDER BY total_books DESC
LIMIT 5;


ALTER TABLE Borrowed
ADD CONSTRAINT unique_book_member
UNIQUE (book_id, member_id);


SELECT title, available_copies
FROM Books
WHERE available_copies > 0;


SELECT m.name,
CASE
    WHEN COUNT(b.borrow_id) > 10 THEN 'Frequent Borrower'
    WHEN COUNT(b.borrow_id) BETWEEN 5 AND 10 THEN 'Regular Borrower'
    ELSE 'Occasional Borrower'
END AS category
FROM Members m
LEFT JOIN Borrowed b
ON m.member_id = b.member_id
GROUP BY m.name;


SELECT m.name,
AVG(DATEDIFF(return_date, borrow_date)) AS avg_days
FROM Borrowed b
JOIN Members m ON b.member_id = m.member_id
WHERE return_date IS NOT NULL
GROUP BY m.name
HAVING avg_days < 7;


DELIMITER $$

CREATE TRIGGER after_borrow
AFTER INSERT ON Borrowed
FOR EACH ROW
BEGIN
    UPDATE Books
    SET available_copies = available_copies - 1
    WHERE book_id = NEW.book_id;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_return
AFTER UPDATE ON Borrowed
FOR EACH ROW
BEGIN
    IF NEW.return_date IS NOT NULL THEN
        UPDATE Books
        SET available_copies = available_copies + 1
        WHERE book_id = NEW.book_id;
    END IF;
END$$

DELIMITER ;
