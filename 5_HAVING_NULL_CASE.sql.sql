create database newtable;
use newtable;
create table employee_info(
emp_id int primary key,
name varchar(50),
department varchar(50),
salary int);

insert into employee_info values
(1,'ravi','it',50000),
(2,'aman','hr',30000),
(3,'neha','finance',70000),
(4,'kiran','it',90000),
(5,'pooja','hr',40000),
(6,'arjun','it',12000),
(7,'sneha','finance',60000),
(8,'rahul','it',80000),
(9,'meena','hr',75000),
(10,'vikas','finance',50000);
select *from employee_info;

-- where
select count(*) from employee_info
where salary>100000;

select count(*) from employee_info
having salary>100000;

-- find the name of department where the sum of salary is greater than 100000(in each department).
select department,sum(salary) from employee_info
group by department
having sum(salary)>100000
order by sum(salary)
limit 1;

-- find department where average salary is greater than 60000
select department,avg(salary) from employee_info
group by department
having avg(salary)>50000
order by avg(salary);
 
 -- find department having more than 3 employee
select department, count(*) from employee_info
group by department
having count(*)>3;

-- find department where minimum salary is less than 40000
select department,min(salary) from employee_info
group by department
having min(salary)<40000
order by min(salary);

-- find department where total salaye is between 100000 to 200000
select department,sum(salary) from employee_info
group by department
having sum(salary) between 100000 and 200000;

-- find department where maximum salary is greater than average salary
select department,max(salary),avg(salary) from employee_info
group by department
having max(salary)>avg(salary);

insert into employee_info values
(11,'smith','it',null),
(12,'alice','hr',null);

-- is null
 select*from employee_info
 where salary is null;
 
 -- is not null
 select*from employee_info
 where salary is not null;
 
 -- categorize salary in medium high and no salary
 select name,department,
 case
 when salary is null then "no salary"
  when salary>70000 then "high"
   when salary<50000 then "LOW"
   else "low"
   end as "salary_category"
   from employee_info;

