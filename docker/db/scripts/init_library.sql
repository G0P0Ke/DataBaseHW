CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE library.Publisher(
    pubName text primary key,
    pubAddress text NOT NULL
);

CREATE TABLE library.Category(
    categoryName text primary key,
    parentCat text,

    FOREIGN KEY (parentCat)
        REFERENCES library.Category(categoryName)
);

CREATE TABLE library.Book(
    isbn serial primary key,
    author text,
    pagesNum int,
    title text,
    pubYear date,
    pubName text,

    FOREIGN KEY (pubName)
        REFERENCES library.Publisher(pubName)
);

CREATE TABLE library.Book_Category(
    categoryName text REFERENCES library.Category(categoryName),
    isbn int REFERENCES library.Book(isbn),
    CONSTRAINT category_book_pkey PRIMARY KEY (categoryName, isbn)
);

CREATE TABLE library.Copy(
    copyNumber serial,
    isbn int REFERENCES library.Book(isbn),
    shelfPosition int,

   CONSTRAINT copy_book_pkey PRIMARY KEY (copyNumber, isbn)
);

CREATE TABLE library.Reader(
    number serial primary key,
    firstName text,
    lastName text,
    birthday date,
    address text
);

CREATE TABLE library.Borrowing(
    copyNumber int,
    isbn int,
    readerNr int REFERENCES library.Reader(number),
    returnDate date,

    FOREIGN KEY (copyNumber, isbn)
        REFERENCES library.Copy (copyNumber, isbn),
    CONSTRAINT copy_reader_pkey PRIMARY KEY (copyNumber, readerNr, isbn)
);