Create database company;
use company;
create table Sales(
saleid int primary key auto_increment,
productid int,
customerid int,
saledate date,
quantity int,
unitprice int,
region varchar(20));
 
insert into Sales(productid,customerid,saledate,quantity,unitprice,region)
values(101,1001,"2024-01-05",5,200,"North"),
     (102,1002,"2024-01-10",10,150,"East"),
     (103,1003,"2024-02-15",2,300,"North"),
     (104,1004,"2024-02-20",7,250,"West"),
     (101,1005,"2024-03-05",1,200,"East");

# Q1- Query to calculate the total sales (Quantity * UnitPrice) for each product.
Select productid, Sum(quantity*unitprice) As 'Total Sales' from sales group by productid;

# Q2- Query to find the total number of products sold in each region.
Select region,sum(quantity) AS 'Total Product Sold' from sales group by region;

# Q3- Query to get the average sales amount per product.
Select productiD,avg(quantity*unitprice) AS "Average Sales" from sales group by productid;

# Q4- Regions where total sales are more than 3000.
Select region, sum(quantity*unitprice) AS "Total Sales" from sales group by region having sum(quantity*unitprice)>3000;

# Q5-  Query to get the maximum quantity sold for each product.
Select productid,max(quantity) AS "Maximum Quantity Sold" from sales group by productid;

# Q6- Query to calculate the average quantity of products sold per region.
Select region,avg(quantity)from sales group by region;

# Q7- Find the product IDs that have generated a total sales amount of more than 1000.
Select productid, sum(quantity*unitprice) from sales group by productid having sum(quantity*unitprice)>1000;

# Q8- Query to get the total number of sales (rows) made for each customer.
Select customerid, count(*) As "Total Sales" from sales group by customerid;

# Q9- Find the products for which the average quantity sold is less than 5.
Select productid , avg(quantity)from sales group by productid having  avg(quantity)<5;

# Q10- Query to find the sum of total sales for each customer in each region.
Select customerid,region, sum(quantity*unitprice) AS "Total Sales" from sales group by customerid,region;

# Q11- Query to calculate the total sales for each month.
Select month(saledate), sum(quantity*unitprice) AS "Total Sales" from sales group by month(saledate);

# Q12- Find the regions where the average unit price is more than 200.
Select region,avg(unitprice) from sales group by region having avg(unitprice)>200;

# Q13- Query to get the minimum and maximum quantity sold per region.
select region, min(quantity) as "Minimum quantity sold",max(Quantity) as "Maximum Quantity Sold" from sales group by region;

# Q14- Find the customers who have made more than 2 purchases.
select customerid from sales group by customerid having count(*)>2;

# Q15- Query to find the total sales for each product and filter only those products where the total sales exceed 1500.  
Select productid, sum(quantity*unitprice) as"Total Sales" from sales  group by productid having sum(quantity*unitprice)>1500;