#1 Query is to create a database and a table named books.
Create database library;
use library;
create table books(
id int Primary key Auto_increment,
title varchar(250),
author varchar(100),
year year,
genre varchar(100)
);
Select *from books;
#2 Query is to insert values in the table books.
insert into books(title,author,year,genre)
values("The Great Gatsby","F.Scott Fitzgerald",1925,"Fiction"),
      ("Pride and Prejudice","Jane Austen",1913,"Romance"),
      ("To kill a Mockingbird","Harper lee",1960,"Fiction"),
      ("1984","Georrge Orwell",1949,"Dystopian"),
      ("Moby Dick","Herman Melville",1951,"Adventure");
#3 Query is to select all the books starts with letter T by using like operator.
select *from books where title like "T%";
#4 Query is to find all the books where author's last name ends with son by using like operator.
select* from books where author like "%son"; 
#5 Query is to find all the books in which title contains the word end by using like operator.
select * from books where title like"%and%";
#6 Query is to retrieve all the books where title ends with the word bird by using like operator.
select *from books where title like "%bird";
#7 Query is to find all the books where title has exactly 3 characters by using regexp operator.
SELECT *FROM books WHERE title regexp "^[a-zA-Z]* [a-zA-Z]* [a-zA-Z]*$";
select *from books where title regexp "^[a-zA-Z]+ [a-zA-Z]+ [a-zA-Z]+$";
#8 Query is to find all the books where title contains a number by using regexp operator.
select *from books where title regexp"[0-9]";
#9 Query is to find all the books where author name start between A and J by using regexp operator.
select *from books where author regexp"^[A-J]";
#10 Query is to find all the books where genre is either fiction or Adventure by using regexp operator.
select*from books where genre regexp"Fiction|Adventure";
#11 Query is to find all the books where title contains at least one uppercase letter by using regexp operator.
select *from books where title regexp"[a-b]{10}";
#12 Query is to find all the books where year is between 1800 and 1950 by using like operator.
select *from books where year like "19%" and year<1951 ;        
#13 Query is to find all the books where author's name contains exactly  two words by using regexp operator.
select *from books where author regexp "^[a-zA-Z]+ [a-zA-Z]+$";
#14 Query is to find all the books where title starts with P and contains exactly two words by using regexp operator.
select*from books where title regexp"^P.+[a-zA-Z]+ [a-zA-Z]+$";
#15 Query is to find all the books where title contains any special characters by using regexp operator.
select*from books where title regexp"[^a-zA-Z0-9 ]";  
