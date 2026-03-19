create database sql_practice;
use sql_practice;
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    Age INT
);
INSERT INTO Employees VALUES
(1,'Amit','HR',30000,25),
(2,'Neha','IT',50000,28),
(3,'Rohan','Finance',45000,30),
(4,'Priya','IT',60000,32),
(5,'Karan','HR',35000,27),
(6,'Sneha','Finance',40000,29),
(7,'Arjun','IT',55000,31),
(8,'Meena','HR',32000,26);

select*from Employees;

-- PART 1 – Comparison Operator Questions

-- Find employees whose salary is equal to 50000.
select*from Employees
WHERE Salary = 50000;

-- Find employees whose salary is greater than 40000.
 select*from Employees
WHERE Salary > 40000;

-- Find employees whose salary is less than 35000.
select*from Employees
WHERE Salary < 35000;

-- Find employees whose salary is greater than or equal to 50000.
select*from Employees
WHERE Salary >= 50000;

-- Find employees whose salary is less than or equal to 32000.
select*from Employees
WHERE Salary <= 32000;

-- Find employees whose salary is not equal to 45000.
select*from Employees
WHERE Salary != 45000;

-- Find employees whose age is greater than 30.
select*from Employees
WHERE AGE > 30;

-- PART 2 –----------------------- Logical Operator Questions-------------------------

-- AND Operator

-- Find employees whose department is IT AND salary greater than 50000.
SELECT*FROM Employees
WHERE Department = 'IT' AND Salary > 50000;

-- Find employees whose department is HR AND age less than 28.
select*from Employees
WHERE Department = 'HR' AND Age < 28;

-- Find employees whose salary greater than 40000 AND age greater than 30.
select*from Employees
WHERE Salary > 40000 AND Age > 30;

-- OR Operator

-- Find employees whose department is HR OR Finance.
select*FROM Employees
WHERE Department = 'HR' OR Department = 'Finance';

-- Find employees whose salary greater than 55000 OR age less than 26.
select*from Employees
WHERE Salary > 55000 OR Age < 26;

-- Find employees whose department is IT OR salary greater than 50000.
SELECT *FROM Employees
WHERE Department = 'IT' OR Salary > 50000;

-- NOT Operator

-- Find employees whose department is NOT IT.
SELECT *FROM Employees
WHERE NOT Department = 'IT';
-- or
SELECT *FROM Employees
WHERE Department != 'IT';

-- Find employees whose salary is NOT greater than 45000.
SELECT*FROM Employees
WHERE NOT Salary > 45000;

-- Find employees whose age is NOT less than 28.
SELECT*FROM Employees
WHERE NOT Age < 28;

-- PART 3 –--------------------- LIKE Operator Questions---------------------------

-- Find employees whose name starts with 'A'.
SELECT *from Employees
WHERE Name LIKE 'A%';

-- Find employees whose name ends with 'a'.
SELECT *from Employees
WHERE Name LIKE '%a';

-- Find employees whose name contains 'ha'.
SELECT*FROM Employees
WHERE Name LIKE '%ha%';

-- Find employees whose name starts with 'R'.
SELECT*FROM Employees
WHERE Name LIKE 'R%';

-- Find employees whose name contains 'n'.
SELECT*FROM Employees
WHERE Name LIKE '%n%';

-- PART 4 –------------------ Advanced LIKE Questions----------------------------

-- Find employees whose name starts with 'A' and has exactly 5 characters.
SELECT *FROM Employees
WHERE Name LIKE 'A____';

-- Find employees whose name second letter is 'r'.
SELECT *FROM Employees
WHERE Name LIKE '_r%';

-- Find employees whose name ends with 'n'.
SELECT *FROM Employees
WHERE Name LIKE '%n';

-- PART 5 –------------------ Mixed Practice (Most Important)---------------------

-- Find employees whose department is IT AND salary greater than 50000.
select*from Employees
WHERE Department = 'IT' AND Salary > 50000;

-- Find employees whose salary between 30000 and 45000.
select*from Employees
WHERE Salary BETWEEN 30000 AND 45000;

-- Find employees whose department is HR OR salary greater than 55000.
select*from Employees
WHERE Department = 'HR' OR Salary > 55000;

-- Find employees whose name starts with 'A' AND department is IT.
select*from Employees
WHERE Name LIKE 'A%' AND Department = 'IT';

-- Find employees whose age greater than 28 AND name ends with 'a'.
select*from Employees
WHERE Age > 28 AND Name LIKE '%a';

-- PART 1 –---------------------- ORDER BY (Sorting)-------------------------------

-- Display all employees sorted by salary (ascending).
SELECT *FROM Employees
ORDER BY Salary ASC;

-- Display all employees sorted by salary (descending).
SELECT *FROM Employees
ORDER BY Salary DESC;

-- Display employees sorted by age (ascending).
SELECT *FROM Employees
ORDER BY Age ASC;

-- Display employees sorted by name alphabetically.
SELECT *FROM Employees
ORDER BY Name ASC;

-- Display employees sorted by department then salary.
SELECT *FROM Employees
ORDER BY Department, Salary;

-- Display employees sorted by department ascending and salary descending.
SELECT *FROM Employees
ORDER BY Department ASC, Salary DESC;

-- PART 2 –------------------------ GROUP BY (Aggregation)---------------------------

-- Find total salary of each department.
SELECT Department, SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department;

-- Find average salary of each department.
SELECT Department, AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY Department;

-- Find maximum salary in each department.
SELECT Department, MAX(Salary) AS Max_Salary
FROM Employees
GROUP BY Department;

-- Find minimum salary in each department.
SELECT Department, MIN(Salary) AS Min_Salary
FROM Employees
GROUP BY Department;

-- Count number of employees in each department.
SELECT Department, COUNT(*) AS Total_Employees
FROM Employees
GROUP BY Department;

-- PART 3 –------------------------- GROUP BY with ORDER BY---------------------------------

-- Display average salary of each department sorted by average salary.
SELECT Department, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department
ORDER BY Avg_Salary;

-- Show number of employees in each department sorted by highest count.
SELECT Department, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Department
ORDER BY Employee_Count DESC;

-- Show total salary by department sorted by department name.
SELECT Department, SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department
ORDER BY Department;

-- Find department with highest total salary.
SELECT Department, SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department
ORDER BY Total_Salary DESC
LIMIT 1;

-- Find total employees and average age in each department.
SELECT Department,
COUNT(*) AS Total_Employees,
AVG(Age) AS Average_Age
FROM Employees
GROUP BY Department;

-- Find total salary and maximum salary for each department.
SELECT Department,
SUM(Salary) AS Total_Salary,
MAX(Salary) AS Max_Salary
FROM Employees
GROUP BY Department;

-- PART 4 –-------------------------- LIMIT-------------------------------

-- Display first 3 employees.
select*from Employees
LIMIT 3;

-- Display top 5 highest paid employees.
Select*from Employees
ORDER BY Salary DESC
LIMIT 5;

-- Display top 2 youngest employees.
select*from Employees
ORDER BY Age ASC
LIMIT 2;

-- Display top 4 employees with highest salary.
select*from Employees
ORDER BY Salary DESC
LIMIT 4;

-- PART 5 –---------------------------------- OFFSET---------------------------------

-- Skip first 2 employees and show next 3 employees.
SELECT *FROM Employees
LIMIT 3 OFFSET 2;

-- Skip first 5 employees and show next 2 employees.
SELECT *FROM Employees
LIMIT 2 OFFSET 5;

-- Show 3rd to 6th highest salary employees.
SELECT *FROM Employees
ORDER BY Salary DESC
LIMIT 4 OFFSET 2;

-- Skip first 3 youngest employees and show next 2.
SELECT *FROM Employees
ORDER BY Age ASC
LIMIT 2 OFFSET 3;

-- PART 6 –------------------------------- Advanced Practice---------------------------

-- Find second highest salary employee using LIMIT and OFFSET.
SELECT *FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;

-- Find third highest salary employee.
SELECT *FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 2;

-- Show top 2 highest paid employees in the IT department.
SELECT *FROM Employees
WHERE Department = 'IT'
ORDER BY Salary DESC
LIMIT 2;

-- Show top 3 oldest employees.
SELECT *FROM Employees
ORDER BY Age DESC
LIMIT 3;

-- Show departments sorted by total salary and display only first 2 departments.
SELECT Department, SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department
ORDER BY Total_Salary DESC
LIMIT 2;

-- Assignment: String Functions in MySQL
-- Table for Practice

CREATE TABLE Students (
ID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
City VARCHAR(50)
);

INSERT INTO Students VALUES
(1,'Amit','Sharma','Delhi'),
(2,'Neha','Verma','Mumbai'),
(3,'Rohan','Gupta','Pune'),
(4,'Priya','Singh','Delhi'),
(5,'Anita','Mehta','Chennai');
select*from students;

-- PART 1 –----------------------- UPPER() and LOWER()-------------------------------

-- Display all first names in uppercase.
SELECT UPPER(FirstName) as FirstName_Upper
FROM Students;

-- Display all last names in lowercase.
SELECT LOWER(LastName) as LastName_Lower
FROM Students;

-- Display city names in uppercase.
SELECT UPPER(City) as FirstName_Upper
FROM Students;

-- PART 2 –------------------ LENGTH()-----------------------------

-- Find the length of each first name.
SELECT FirstName, LENGTH(FirstName) as Name_Length
FROM Students;

-- Find the length of each city name.
SELECT City, LENGTH(City) as City_Length
FROM Students;

-- Display students whose first name length is greater than 4.
SELECT *from students
WHERE LENGTH(FirstName) > 4;

-- PART 3 –-------------------------- CONCAT()-------------------------------------

-- Display full name of students by combining first name and last name.
SELECT CONCAT(FirstName, LastName) as FullName
FROM Students;

-- Display full name with a space between them.
SELECT CONCAT(FirstName,' ' ,LastName) as FullName
FROM Students;

-- Display full name like "Amit Sharma from Delhi".
SELECT CONCAT(FirstName, ' ', LastName, ' from ', City) as Student_Info
FROM Students;

-- PART 4 –------------------------- SUBSTRING()--------------------------------------

-- Display first 3 letters of each first name.
SELECT SUBSTRING(FirstName,1,3) as First3Letters
FROM Students;

-- Display last 2 letters of each last name.
SELECT SUBSTRING(LastName, LENGTH(LastName)-1, 2) as Last2Letters
FROM Students;

-- Display first 2 letters of city name.
SELECT SUBSTRING(City,1,2) as City_First2
FROM Students;

-- PART 5 –----------------
----------- REPLACE()------------------------------------

-- Replace Delhi with New Delhi.
SELECT REPLACE(City,'Delhi','New Delhi') as Updated_City
FROM Students;

-- Replace letter 'a' with '*' in first name.
SELECT REPLACE(FirstName,'a','*') as Modified_Name
FROM Students;

-- PART 6 –---------------------------- TRIM()---------------------------------------

-- Remove extra spaces from the beginning of a string.
select LTRIM('   Amit') as Trimmed_Text;

-- Remove extra spaces from the end of a string.
select RTRIM('Amit   ') as Trimmed_Text;

-- Remove spaces from both sides of a string.
select TRIM('   Amit   ') as Trimmed_Text;