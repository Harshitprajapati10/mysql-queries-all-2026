-- USE library_db;


-- CREATE TABLE books1 AS
-- SELECT *
-- FROM books
-- WHERE accession_no IS NULL;


-- CREATE TABLE books2 AS
-- SELECT *
-- FROM books
-- WHERE accession_no IS NOT NULL;


-- CREATE TABLE books_with_titles AS
-- SELECT *
-- FROM books2
-- WHERE book_title IS NOT NULL;


-- CREATE TABLE books_without_publisher AS
-- SELECT *
-- FROM books2
-- WHERE publisher IS NULL;


CREATE TABLE books_with_shelfno AS
SELECT *
FROM books2
WHERE self_no IS NOT NULL;