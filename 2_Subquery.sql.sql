create database sub_querry;
use sub_querry;
create table customers(
customerid int,
customername varchar(50),
country varchar(50),
cityname varchar(50),
creditlimit int
);

insert into customers values
(1,'rahul sharma','usa','new york city',50000),
(2,'emily brown','uk','london',42000),
(3,'pierra martin','france','paris',38000),
(4,'hans muller','germany','berlin',45000),
(5,'sophia wilson','usa','chicago',52000),
(6,'james smith','uk','manchester',50000),
(7,'clarie dubois','france','lyon',36000),
(8,'lucas weber','germany','munich',41000),
(9,'danieal scott','usa','boston',47000),
(10,'oliver taylor','uk','birmingham',43000);

select*from customers;
-- find all employee working in same office location as that of sophia.
-- inner
select cityname from customers
where customername='sophia wilson';

-- outer
select customername from customers
where country ='usa';

-- combination
select customername from customers
where country=(select country from customers
where customername='sophia wilson') and customername!='sophia wilson';

-- find the customer with maximum credit limit.
select customername from customers
where creditlimit=(select max(creditlimit) from customers);

-- find the customer whose creditlimit more than maximum creditlimit of the customer
-- belonging to the chicago city

-- inner
select max(creditlimit) from customers
where cityname ='manchester';

-- outer
select customername from customers
where creditlimit>50000;

-- combine
select customername from customers
where creditlimit>=(select max(creditlimit) from customers
where cityname ='manchester');

-- find the customers with highest credit limit in usa,france,and uk.
select customername from customers
where creditlimit=(select max(creditlimit) from customers);

-- find the second highest creditlimit of customer using sub querry.
select max(creditlimit) from customers
where creditlimit<(select max(creditlimit) from customers); 

