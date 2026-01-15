SELECT * FROM active_loans;

SELECT * FROM overdue_loans;

SELECT title, available_copies FROM books
WHERE available_copies > 0;

SELECT b.title, l.loan_date, l.return_date FROM loans l
JOIN books b ON l.book_id = b.book_ID
WHERE l.member_ID = 1;
