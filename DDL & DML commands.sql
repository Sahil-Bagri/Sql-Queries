#Query is to create a database with name comapany and a table with name emplyoees
Create database company;
use company;
Create table employees(
id int Primary key auto_increment,
name varchar(100),
position varchar(100),
salary decimal(10,2),
date_of_joining date
);
#Query is to insert values in the created table of database company
insert into employees(name,position,salary,date_of_joining)
values ("John Doe","Manager",55000.00,"2020-01-15"),
	   ("Jane Smith","Developer",48000.00,"2019-07-10"),
       ("Alice Johnson","Designer",45000.00,"2021-03-22"),
       ("Bob Brown","Developer",50000.00,"2018-11-01");
# Query is to select all the employees who are developers
Select *from employees where position="Developer";
#Query is to update the salary to 46000.00 where name is Alice Johnson in table employees
set sql_safe_updates=0;
update employees
set salary=46000.00 where name="Alice Johnson";
#Query is to delete record from employees where name is Bob Brown
delete from employees where name="Bob Brown";
#Query is to select employees where salary is higher than 48000.00
select *from employees where salary>48000;
#Query is to add a column name email in the table employees
alter table employees add email varchar(100);
#Query is to update email where name is John Doe in table employees
update employees
set email="john.doe@company.com" where name="John Doe";
#Query is to select only name and salary from employees
Select name,salary from employees;
#Query is to count no of employees who join after 1st january 2021
select count(*) from employees where date_of_joining>2021-01-01;
#Query is to select salary in descending order
select *from employees order by salary desc;
#Query is to drop column of email from table employees
alter table employees drop column email;
#Query is to select the highest salry ih the table employees
select *from employees order by salary desc Limit 1;