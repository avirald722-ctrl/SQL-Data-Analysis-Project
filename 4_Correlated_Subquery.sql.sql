create database correlated_subquerry;
use correlated_subquerry;

create table student(
sid int,
sname varchar(150),
class char(2),
marks int
);

insert into student values
(1,'rahul','A',60),
(2,'rohan','A',70),
(3,'rani','A',80),
(4,'ankit','B',40),
(5,'akshhay','B',55),
(6,'aayush','B',45),
(7,'smith','C',70),
(8,'gaytri','C',90);

select*from student;

-- find student whose marks are greater than avarage marks of their own class.
select sname,class,marks
 from student s1
 where marks>(
 select avg(marks) from student s2
 where s1.class=s2.class
 );
 
 -- show marks of students whose marks is equal to average marks of same class
 select sname,class,marks
 from student s1
 where marks=(
 select avg(marks) from student s2
 where s1.class=s2.class
 );
 
 select *
from student s
where marks = (
    select avg(marks)
    from student
    where class = s.class
);