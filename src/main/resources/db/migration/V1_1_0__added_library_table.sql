CREATE TABLE books (
                       id SERIAL PRIMARY KEY,
                       title VARCHAR(100) NOT NULL,
                       author VARCHAR(50) NOT NULL,
                       publication_year INTEGER NOT NULL
);

CREATE TABLE readers (
                         id SERIAL PRIMARY KEY,
                         name VARCHAR(50) NOT NULL,
                         email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE bookings (
                          id SERIAL PRIMARY KEY,
                          book_id INTEGER NOT NULL,
                          reader_id INTEGER NOT NULL,
                          booking_date DATE NOT NULL,
                          return_date DATE,
                          FOREIGN KEY (book_id) REFERENCES books(id),
                          FOREIGN KEY (reader_id) REFERENCES readers(id)
);