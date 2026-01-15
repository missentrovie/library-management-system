erDiagram
    authors ||--o{ book_authors : ""
    books ||--o{ book_authors : ""
    books }o--|| categories : ""
    members ||--o{ loans : ""
    books ||--o{ loans : ""

    authors {
        SERIAL author_ID PK
        VARCHAR(150) full_name
    }
    categories {
        SERIAL category_ID PK
        VARCHAR(100) name
    }
    books {
        SERIAL book_ID PK
        VARCHAR(255) title
        VARCHAR(20) ISBN
        INT publication_year
        INT category_ID FK
        INT total_copies
        INT available_copies
    }
    book_authors {
        INT book_ID PK,FK
        INT author_ID PK,FK
    }
    members {
        SERIAL member_ID PK
        VARCHAR(150) full_name
        VARCHAR(150) email
        TIMESTAMP created_at
    }
    loans {
        SERIAL loan_ID PK
        INT book_ID FK
        INT member_ID FK
        DATE loan_date
        DATE due_date
        DATE return_date
    }
