CREATE DATABASE TDI

----------Write an SQL query to create a table called books-------------

CREATE TABLE Books(
Book_id INT,
Title VARCHAR (100),
Author VARCHAR (100),
Genre VARCHAR (10),
Year_published INT,
Price DECIMAL (10, 2)
PRIMARY KEY (Book_id)
)

SELECT * FROM Books

-------Write an SQL query to insert all the 10 book records into your table.----------

INSERT INTO Books(Book_id,Title,Author,Genre,Year_published,Price)
VALUES
(1,'The Great Gatsby', 'F.Scott','Fiction', '1925', '10.99'),
(2, 'Pride and Prejudice', 'Jane Austen', 'Fiction','1813','8.99'),
(3, 'Cosmos', 'Carl Sagan','Science', '1980', '12.5'),
(4, 'Sapiens', 'Yuval Noah', 'History', '2011', '15'),
(5, 'Atomic Habits', 'Adam Sandler', 'Self-Help', '2018', '14.99'),
(6, '1984', 'George Orwell', 'Fiction', '1949', '9.99'),
(7, 'Educated', 'Tara Westover', 'Memoir','2018', '13.99'),
(8, 'The Gene', 'Siddhartha', 'Science', '2016', '14.5'),
(9, 'The Alchemist', 'Paulo Coelho', 'Fiction', '1988', '7.99'),
(10, 'Guns, Germs, Steel', 'Jared Diamond', 'History', '1997', '16')


---------Write an SQL query to retrieve all books whose price is greater than $10.------------

SELECT [Title], [Price]
FROM Books
WHERE Price >10


---Write an SQL query to retrieve the titles and prices of books published after the year 2000, sorted by price in descending order.---------

SELECT [Title], [Price]
FROM Books
WHERE Year_published >2000
ORDER BY Price DESC


--It has been identified that the author of Atomic Habits was incorrectly entered as "Adam Sandler." Update the record to correct the author's name to "James Clear."---

UPDATE Books
SET Author = 'James Clear'
WHERE Book_id = 5


-----Add the following two new books to the books table:-----

INSERT INTO Books(Book_id,Title,Author,Genre,Year_published,Price)
VALUES
(11, 'Thinking, Fast and Slow', 'Daniel Kahneman',	'Psychology', '2011', '18.99'),
(12, 'The Power of Habit', 'Charles Duhigg', 'Self-Help', '2012', '12.99')


--Write a query to retrieve only the title and genre columns from the books table.-----

SELECT [Title], [Genre]
FROM Books
