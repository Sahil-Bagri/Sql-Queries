create database bankai;
use bankai;

create table employees(
emp_id int primary key,
name varchar(100),
dept_name varchar(100),
salary int);
 
insert into employees(emp_id,name,dept_name,salary)
values(1,"John","HR",5000),
      (2,"Alice","IT",7000),
      (3,"Bob","Finance",6000),
      (4,"Eve","IT",8000),
      (5,"Charlie","Finance",7500);
	
create table departments(
dept_id int,
dept_name varchar(100));

insert into departments(dept_id,dept_name)
values(1,"HR"),
      (2,"IT"),
	  (3,"Finance");
      
#1. Find employees with salaries greater than the average salary of all employees. 
select name,salary from employees where salary>(select avg(salary) from employees);

#2. Find employees whose salary is higher than the salary of 'Alice'. 
select name,salary from employees where salary >(select salary from employees where name ="Alice");

#3. List employees who belong to a department that has the name 'IT'. 
select name,dept_name from employees where dept_name in (select dept_name from departments where dept_name="IT");

#4. Get the names of employees who earn the highest salary in their department. 
select name,salary,dept_name from employees where salary in (select salary from employees where dept_name in
(select dept_name from employees group by dept_name having salary=max(salary)));

#5. Retrieve the departments where at least one employee earns more than 7000. 
select dept_name,name,salary from employees where salary in (select salary from employees where salary>7000);

#6. List employees who do not belong to any department in the departments table. 
select name,dept_name from employees where dept_name in(select dept_name from employees group by dept_name having count(name) is null);

#7. Find the second-highest salary among employees. 
select name,salary from employees where salary= (select salary from employees order by salary desc limit 1,1);

#8. Retrieve the names of employees who work in the department with the highest number of employees. 
select name ,  dept_name from employees where dept_name in  (select dept_name from employees group by dept_name having count(*) = 
( select count(*) from employees group by dept_name order by count(*) desc limit 1));

#9. Find employees who earn more than the average salary in their department. 
select name,salary from employees where dept_name in (select dept_name from employees group by dept_name having salary>avg(salary));

#10. Retrieve employees whose salary is above 7000 and belong to it departments in the departments table. 
select name ,salary from employees where dept_name in (select dept_name from departments where dept_name ="IT" and salary>7000);

#11. List all departments that have no employees. 
select dept_name from departments where dept_name in (select dept_name from employees where name is null);

#12. Find employees who have the same salary as another employee in a different department. 
select salary,dept_name from employees where salary in
(select a.salary from employees a join employees  b on a.salary=b.salary where a.dept_name!= b.dept_name);

#13. Get the total salary of the department with the maximum total salary. 
select sum(salary) from employees where dept_name =(select dept_name from employees group by dept_name order by sum(salary) desc limit 1);

#14. Retrieve employees whose department has more than two employees. 
select name from employees where dept_name in (select dept_name from employees group by dept_name having count(name)>2);

#15. Find employees whose salary is higher than the average salary of employees in the IT department. 
select name,salary from employees where salary > (select avg(salary) from employees where dept_name="IT");



create table employee(emp_id int ,
name varchar(30) ,
dept_id int ,
salary int ,
age int , 
city varchar(20));

insert into employee(emp_id , name , dept_id , salary , age , city)
values(1, 'Alice ', 101 ,50000 , 28 , 'New York'),
(2 , 'Bob' , 102 , 55000,38 , 'Chicago'),
(3, 'Charlie' , 101 , 66000 ,38 ,'Los Angeles' ),
(4 , 'David' , 103 ,45000, 25,'New York'),
(5, 'Eve' , 104 , 70000 , 45 , 'San Diago ');

create table department(
dept_id int primary key ,
dept_name varchar(100));


insert into department(dept_id,dept_name)
values(101,"HR"),
      (102,"sales"),
      (103,"it"),
      (104,"Marketing");

#1st.find the highest salary employee in the departmetns
select name from employee where salary in (select max(salary) from employee);

#2nd. Find the employee who is in the city of Alice
select name from employee where city in (select city from employee where name="Alice " );

#3rd.List all employees more than the average salary of the employees table
select name from employee where salary>(select avg(salary) from employee);

#4th. Retrieve names of employees whose age is below than average age
select name from employee where age<(select avg(age) from employee);

#5th. Get the name of the department with the lowest paid employees
select dept_name ,salary from department left join employee on department.dept_id=employee.dept_id where salary=(select min(salary) from employee);

#6th. Find all employees who belong to a department where the average salary is more than 60000
select name from  employee where dept_id =(select dept_id from employee group by dept_id having avg(salary)>60000);

#7th. ist name of employee who earn the minimum salary in their respectitive departments
select name from employee where dept_id in (select dept_id from employee group by dept_id having salary=min(salary));

#8th. find employees who are older than the average age of employees in their department
select name from employee where dept_id in (select dept_id from employee group by dept_id having age>avg(age));

#9th. Find the name of employees who earn less than Bob
select name from employee where salary in (select salary from employee where name="Bob");

#10 find dept with no empl old than 30 yrs 
select  dept_id,dept_name from department where dept_id in (select dept_id from employee where age in (select age from employee where age<30));

#11th Get the names of who live in the same city as the highest paid employee
select name from employee where salary in (select max(salary) from employee where city in (select city from employee group by city having count(name)>1));
 
#12th. Find the departmetns with at least one employee earning more than 55000
select dept_name from department where dept_id in (select dept_id from employee where salary >50000);

#13th. List the names of employees who are younger than all employees in IT department
select name,age from employee where age in (select min(age) from employee where dept_id=(select dept_id from department where dept_name="it"));
