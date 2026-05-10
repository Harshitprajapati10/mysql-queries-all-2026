-- give book with no titles

SELECT *
FROM combinedlibrary
WHERE book_title IS NULL
   OR TRIM(book_title) = '';



-- give book with no publisher

SELECT *
FROM combinedlibrary
WHERE publisher IS NULL
   OR TRIM(publisher) = '';


-- give book with  no book shelf no.

SELECT *
FROM combinedlibrary
WHERE book_shelf_no IS NULL
   OR TRIM(book_shelf_no) = '';