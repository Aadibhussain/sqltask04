
SELECT COUNT(*) AS total_members
FROM Members;

-- 2. Count how many books each author has written
SELECT a.name AS author_name, COUNT(b.book_id) AS books_written
FROM Authors a
JOIN BookAuthors ba ON a.author_id = ba.author_id
JOIN Books b ON ba.book_id = b.book_id
GROUP BY a.name;

-- 3. Find total available copies of books by genre
SELECT genre, SUM(available_copies) AS total_copies
FROM Books
GROUP BY genre;

-- 4. Find average published year of books by author
SELECT a.name AS author_name, AVG(b.published_year) AS avg_year
FROM Authors a
JOIN BookAuthors ba ON a.author_id = ba.author_id
JOIN Books b ON ba.book_id = b.book_id
GROUP BY a.name;

-- 5. Count how many loans each member has
SELECT m.name, COUNT(l.loan_id) AS total_loans
FROM Members m
LEFT JOIN Loans l ON m.member_id = l.member_id
GROUP BY m.name;

-- 6. Find members with more than 1 active loan (HAVING)
SELECT m.name, COUNT(l.loan_id) AS active_loans
FROM Members m
JOIN Loans l ON m.member_id = l.member_id
WHERE l.return_date IS NULL
GROUP BY m.name
HAVING COUNT(l.loan_id) > 1;

-- 7. Find the earliest and latest published book
SELECT MIN(published_year) AS oldest_book, MAX(published_year) AS newest_book
FROM Books;

-- 8. Average number of copies available across all books
SELECT AVG(available_copies) AS avg_copies
FROM Books;

-- 9. Count distinct genres
SELECT COUNT(DISTINCT genre) AS unique_genres
FROM Books;

-- 10. Round average published year per genre
SELECT genre, ROUND(AVG(published_year), 0) AS avg_year
FROM Books
GROUP BY genre;
