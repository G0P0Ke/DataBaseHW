CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE library.Publisher(
    publisher_id serial primary key,
    name text NOT NULL ,
    address text NOT NULL
);

CREATE TABLE library.Category(
    title text primary key,
    parent_title text,

    FOREIGN KEY (parent_title)
        REFERENCES library.Category(title)
);

CREATE TABLE library.Book(
    isbn serial primary key,
    author text,
    page_count int,
    title text,
    year date,
    publisher_id serial,

    FOREIGN KEY (publisher_id)
        REFERENCES library.Publisher(publisher_id)
);

CREATE TABLE library.Book_Category(
    title text REFERENCES library.Category(title),
    isbn int REFERENCES library.Book(isbn),
    CONSTRAINT category_book_pkey PRIMARY KEY (title, isbn)
);

CREATE TABLE library.Copy(
    copy_number serial primary key,
    place int,
    book_id int,

    FOREIGN KEY (book_id)
        REFERENCES library.Book(isbn)
);

CREATE TABLE library.Reader(
    reader_id serial primary key,
    name text,
    surname text,
    birthday date,
    address text
);

CREATE TABLE library.Library(
    copy_number int REFERENCES library.Copy(copy_number),
    reader_id int REFERENCES library.Reader(reader_id),
    end_date date,
    CONSTRAINT copy_reader_pkey PRIMARY KEY (copy_number, reader_id)
);