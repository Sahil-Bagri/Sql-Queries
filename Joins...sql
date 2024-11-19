create database joins;
use joins;
drop database joins;
create table employee(
emp_id int primary key auto_increment,
emp_name varchar(50),
dept_id int,
salary int);
 
insert into employee(emp_name,dept_id,salary)
values("Alice",101,6000),
     ("Bob",102,7000),
     ("Charlie",103,8000),
     ("David",101,7500),
     ("Eve",102,8500);
 
create table departments(
dept_id int,
dept_name varchar(50));
 
insert into departments(dept_id,dept_name)
values(101,"HR"),
     (102,"Sales"),
     (103,"IT"),
     (104,"Marketing");
     
create table projects(
project_id int,
project_name varchar(30),
dept_id int);
 
insert into projects(project_id,project_name,dept_id)
values(1,"Project A", 101),
     (2,"Project B",102),
     (3,"Project C",103),
     (4,"Project D",104);
#find all employee who work in sales department
select employee.emp_name, departments.dept_name from employee
right join departments on employee.dept_id=departments.dept_id where departments.dept_name="Sales";

# Find departments name who have employees
select employee.emp_name as "employee name",departments.dept_name as "department name" from employee Inner Join departments on departments.dept_id = employee.dept_id;

# #find the employees who have salary hiher than 7500 and work in project an an it department
select employee.emp_name,departments.dept_name from employee inner join departments on employee.dept_id = departments.dept_id  where dept_name="IT"and salary>7500;

# #find number of employees in each department
select count(emp_id),departments.dept_name as"dept_name"  from employee Inner Join departments on employee.dept_id = departments.dept_id group by dept_name;

# Get total salary of each department
select sum(salary),departments.dept_name as"dept_name"  from employee Inner Join departments on employee.dept_id = departments.dept_id group by dept_name;

# Find all departments that have no employees
SELECT departments.dept_id, departments.dept_name FROM departments LEFT JOIN employee ON departments.dept_id = employee.dept_id WHERE Employee.dept_id IS NULL;

# list the employee names and their respective project names
select employee.emp_name,projects.project_name from employee inner join projects on employee.dept_id=projects.dept_id;

# Find the employee and project name for employees in 'HR' department
select employee.emp_name,projects.project_name from employee inner join  departments on departments.dept_id = employee.dept_id
inner join projects on employee.dept_id=projects.dept_id where departments.dept_name="HR";

# Retrive departments with more than 1 project assigned
 select departments.dept_name,count(projects.dept_id)from projects right join departments on projects.dept_id=departments.dept_id
 group by departments.dept_name having  count(projects.dept_id)>1;

# Retrive departments with 1 project assigned
select projects.project_name from departments left join projects on departments.dept_id=projects.dept_id
group by projects.project_name having  count(departments.dept_id)=1;

# Find employees who work in departments that are not assigned any projects
select departments.dept_name,employee.emp_id from employee left join departments on employee.dept_id=departments.dept_id
left join projects on departments.dept_id=projects.dept_id
group by departments.dept_name,employee.emp_id having  count(projects.dept_id)=1;

# List the departments along with the number of employees and projects
select distinct(departments.dept_name),count(employee.emp_id),count(projects.project_id) from departments left join employee on departments.dept_id=employee.dept_id
left join projects on departments.dept_id=projects.dept_id
group by departments.dept_name,employee.emp_id,projects.project_id;

# Get the department  name and total salary spent on employees for departments with at least 2employees
select d.dept_name,count(e.emp_id),sum(salary) from departments d inner join employee e on d.dept_id=e.dept_id group by dept_name having count(emp_id)=2;
