create database multiple_subquerry;
use  multiple_subquerry;

create table customers (
customerid int primary key,
customername varchar(50),
country varchar(50)
);

insert into customers (customerid, customername, country) values
(1,'rahul','india'),
(2,'john','usa'),
(3,'maria','germany'),
(4,'amit','india');

create table orders (
orderid int primary key,
customerid int,
amount int);

insert into orders (orderid,customerid,amount) values
(101,1,5000),
(102,3,8000),
(103,1,2000);

select*from customers;
select*from orders;

-- show customers who placed orders
select customerid from orders;

select customername from customers
where customerid in(select customerid from orders);

create table products(
productid int primary key,
productname  varchar(50),
price int);
drop table products;
insert into products values
(1,'laptop',50000),
(2,'mobile',15000),
(3,'tablet',25000),
(4,'moniter',12000);

create table orders1(
orderid int ,
productid int,
qty int
);
insert into orders1 values
(101,1,2),
(102,3,1),
(103,2,3);

select*from products;
select*from orders1;

-- show products that were ordered
select productid from 
orders1;

select productname from products
where productid in (select productid from 
orders1);

-- find product costlier than any products. 
select price from products
where price>20000;

select productname,price from products
where price >any (
select price from products
where price>20000);

-- find product costlier than all products above 200000.
select productname,price from products
where price >= (
select price from products
where price>20000);

create table employees(
emoid int,
name varchar(50),
department varchar(50),
salary int
);
 insert into employees values
 (1,'ravi','hr',40000),
 (2,'neha','it',60000),
 (3,'amit','hr',45000),
 (4,'john','it',60000);
 
 insert into employees values(5,'amit','hr',40000);
 
 -- find employee who have same department.
 select name,department,salary
 from employees
 where (department,salary) = any
 (
 select department, salary
 from employees
 where name = 'ravi'
 );