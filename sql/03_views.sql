CREATE VIEW active_loans AS
SELECT
    m.full_name AS member,
    b.title AS book,
    l.loan_date,
    l.due_date
FROM loans l
JOIN members m ON l.member_ID = m.member_ID
JOIN books b ON l.book_ID = b.book_ID
WHERE l.return_date IS NULL;

CREATE VIEW overdue_loans AS
SELECT
    m.full_name AS member,
    b.title AS book,
    l.due_date,
    CURRENT_DATE - l.due_date AS days_overdue
FROM loans l
JOIN members m ON l.member_ID = m.member_ID
JOIN books b ON l.book_ID = b.book_ID
WHERE l.return_date IS NULL AND l.due_date < CURRENT_DATE;

CREATE VIEW popular_books AS
SELECT
    b.title,
    COUNT(l.loan_ID) AS borrow_count
FROM books b
LEFT JOIN loans l ON b.book_ID = l.book_ID
GROUP BY b.book_ID, b.title
ORDER BY borrow_count DESC;
