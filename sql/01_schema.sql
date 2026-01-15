CREATE TABLE authors (
    author_ID SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL );

CREATE TABLE categories (
    category_ID SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL );

CREATE TABLE books (
    book_ID SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    publication_year INT CHECK (publication_year > 0),
    category_ID INT REFERENCES categories(category_ID) ON DELETE SET NULL,
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,
    CONSTRAINT check_copies CHECK (available_copies BETWEEN 0 AND total_copies) );


CREATE TABLE book_authors (
    book_ID INT REFERENCES books(book_ID) ON DELETE CASCADE,
    author_ID INT REFERENCES authors(author_ID) ON DELETE CASCADE,
    PRIMARY KEY (book_ID, author_ID) );


CREATE TABLE members (
    member_ID SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP );


CREATE TABLE loans (
    loan_ID SERIAL PRIMARY KEY,
    book_ID INT NOT NULL REFERENCES books(book_ID) ON DELETE RESTRICT,
    member_ID INT NOT NULL REFERENCES members(member_ID) ON DELETE RESTRICT,
    loan_date DATE DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE,
    CHECK (due_date >= loan_date)
);


CREATE INDEX idx_books_ISBN ON books(ISBN) ;
	
CREATE INDEX idx_members_email ON members(email) ;
	
CREATE INDEX idx_loans_book_ID ON loans(book_ID) ;

CREATE INDEX idx_loans_member_ID ON loans(member_ID) ;

CREATE UNIQUE INDEX uniq_active_loan ON loans(book_ID, member_ID)
WHERE return_date IS NULL;

CREATE INDEX idx_loans_active ON loans(book_ID)
WHERE return_date IS NULL;

