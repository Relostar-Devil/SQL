create database Case_study_2;
use Case_study_2;
CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30);

select * from department;
select * from job;
select* from location;
select * from employee;

--Simple Queries:

--Question 1) List all the employee details. 
select * from employee;

--Question 2) List all the department details. 
select * from department;

--Question 3) List all job details. 
select * from job;

--Question 4) List all the locations.
select * from location;

--Question 5) List out the First Name, Last Name, Salary, Commission for all Employees. 
select First_Name, last_name, salary, comm from employee;

--Question 6) List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id"
select Employee_id as 'ID of the Employee', Last_name as 'Name of the Employee', Department_ID as 'Dep_id' from employee;

--Question 7) List out the annual salary of the employees with their names only. 
select First_name,middle_name,last_name,salary from employee;

--WHERE Condition: 

--Question 1) List the details about "Smith". 
select * from employee where last_name='smith';

--Question 2) List out the employees who are working in department 20. 
select * from employee where department_id=20;

--Question 3) List out the employees who are earning salary between 2000 and 3000. 
select * from employee where salary between 2000 and 3000;

--Question 4) List out the employees who are working in department 10 or 20. 
select * from employee where department_id= 10 or department_id= 20;

--Question 5) Find out the employees who are not working in department 10 or 30. 
select * from employee where not (department_id=10 or department_id=30);

--Question 6) List out the employees whose name starts with 'L'. 
select * from employee where first_name like 'l%';

--Question 7) List out the employees whose name starts with 'L' and ends with 'E'. 
select * from employee where first_name like 'l%e';

--Question 8) List out the employees whose name length is 4 and start with 'J'.
select * from employee where first_name like 'j___';

--Question 9) List out the employees who are working in department 30 and draw the salaries more than 2500. 
select * from employee where salary>2500 and department_id=30;

--Question 10) List out the employees who are not receiving commission. 
select * from employee where comm is null;

--ORDER BY Clause: 

--Question 1) List out the Employee ID and Last Name in ascending order based on the Employee ID. 
select employee_id, last_name from employee order by employee_id;

--Question 2) List out the Employee ID and Name in descending order based on salary. 
select employee_id, first_name, middle_name, last_name from employee order by salary;

--Question 3) List out the employee details according to their Last Name in ascending-order.
select * from employee order by last_name;

--Question 4) List out the employee details according to their Last Name in ascending order and then Department ID in descending order. 
select * from employee order by last_name asc, department_id desc;

--GROUP BY and HAVING Clause: 

--Question 1) List out the department wise maximum salary, minimum salary and average salary of the employees. 
select max(salary) as maximum_salary, min(salary) as minimum_salary, avg(salary) as average_salary from employee group by department_id;

--Question 2) List out the job wise maximum salary, minimum salary and average salary of the employees. 
select max(salary) as maximum_salary, min(salary) as minimum_salary, avg(salary) as average_salary from employee group by job_id;

--Question 3) List out the number of employees who joined each month in ascending order.
select count(employee_id) as number_of_employee, datepart(month,hire_date) as hire_month from employee group by datepart(month,hire_date);

--Question 4) List out the number of employees for each month and year in ascending order based on the year and month. 
select count(employee_id) as number_of_employee, datepart(month,hire_date) as hire_month, datepart(year,hire_date) as hire_year from employee
group by datepart(month,hire_date), datepart(year,hire_date);

--Question 5) List out the Department ID having at least four employees. 
select department_id from employee group by department_id having count(department_id)>=4;

--Question 6) How many employees joined in February month. 
select count(employee_id) from employee group by datepart(month, hire_date) having datepart(month, hire_date)=2;

--Question 7) How many employees joined in May or June month.
select count(*) from employee group by datepart(month, hire_date) having datepart(month, hire_date)=5 or datepart(month, hire_date)=6;

--Question 8) How many employees joined in 1985?
select count(*) from employee group by datepart(year, hire_date) having datepart(year, hire_date)=1985;

--Question 9) How many employees joined each month in 1985?
select count(*) as Total_Employee, datepart(month,hire_date) as Month_of_1985 from employee group by datepart(year,hire_date), datepart(month,hire_date)
having datepart(year,hire_date)=1985;

--Question 10) How many employees were joined in April 1985? 
select count(*) as Employee_Joined from employee group by datepart(year,hire_date), datepart(month, hire_date)
having datepart(year,hire_date)=1985 and datepart(month, hire_date)=5;

--Question 11) Which is the Department ID having greater than or equal to 3 employees joining in April 1985? 
select department_id from employee group by department_id, datepart(year,hire_date), datepart(month, hire_date)
having datepart(year,hire_date)=1985 and datepart(month, hire_date)=5 and count(*)>=3;

--Joins:

--Question 1) List out employees with their department names.
select first_name, middle_name, last_name, Name from employee join department on employee.department_id=department.department_id;

--Question 2) Display employees with their designations.
select first_name, middle_name, last_name, designation from employee join job on employee.job_id=job.job_id;

--Question 3) Display the employees with their department names and city. 
select first_name, middle_name, last_name, name, city from employee join department on employee.department_id=department.department_id
join location on department.location_id=location.location_id;

--Question 4) How many employees are working in different departments? Display with department names. 
select distinct name, count(*) from department join employee on department.department_id=employee.department_id group by name;

--Question 5) How many employees are working in the sales department?
select count(*) from department join employee on department.department_id=employee.department_id group by name having name='sales';

--Question 6) Which is the department having greater than or equal to 3 employees and display the department names in ascending order. 
select name from department join employee on department.department_id=employee.department_id group by name having count(employee.department_id)>=3;

--Question 7) How many employees are working in 'Dallas'? 
select count(*) from employee join department on employee.department_id=department.department_id
join location on department.location_id=location.location_id where city='Dallas';

--Question 8) Display all employees in sales or operation departments.
select * from employee join department on employee.department_id=department.department_id where name='sales' or name='operation';

--CONDITIONAL STATEMENT: 

 --Question 1) Display the employee details with salary grades. Use conditional statement to create a grade column.
 select *,(case
 when salary<=1000 then 'E'
 when salary<=1500 then 'D'
 when salary<=2000 then 'C'
 when salary<=2500 then 'B'
 when salary<=3000 then 'A'
 end) as Grade_column
 from employee

 --Question 2)  List out the number of employees grade wise. Use conditional statement to create a grade column. 
 select count(*),case
 when salary<=1000 then 'E'
 when salary<=1500 then 'D'
 when salary<=2000 then 'C'
 when salary<=2500 then 'B'
 when salary<=3000 then 'A'
 end as Grade_column
 from employee group by case
 when salary<=1000 then 'E'
 when salary<=1500 then 'D'
 when salary<=2000 then 'C'
 when salary<=2500 then 'B'
 when salary<=3000 then 'A'
 end order by Grade_column asc;

 --Question 3)  Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
 select count(*),case
 when salary<=1000 then 'E'
 when salary<=1500 then 'D'
 when salary<=2000 then 'C'
 when salary<=2500 then 'B'
 when salary<=3000 then 'A'
 end as Grade_column
 from employee where salary between 2000 and 5000 group by case
 when salary<=1000 then 'E'
 when salary<=1500 then 'D'
 when salary<=2000 then 'C'
 when salary<=2500 then 'B'
 when salary<=3000 then 'A'
 end order by Grade_column asc;

 --Subqueries:

 --Question 1) Display the employees list who got the maximum salary.
select first_name, middle_name, last_name from employee where salary = (select max(salary) from employee);

--Question 2) Display the employees who are working in the sales department.
select * from employee join department on employee.department_id=department.department_id where name = (select name from department where name='sales');

--Question 3) Display the employees who are working as 'Clerk'.
select * from employee join job on employee.job_id=job.job_id where designation = (select designation from job where designation='clerk');

--Question 4) Display the list of employees who are living in 'Boston'.
select * from employee join department on employee.department_id=department.department_id join location on department.location_id=location.location_id
where city = (select city from location where city='boston');

--Question 5) Find out the number of employees working in the sales department.
select count(*) from employee join department on employee.department_id=department.department_id where name = (select name from department where name='sales');

--Question 6) Update the salaries of employees who are working as clerks on the basis of 10%.
update employee set salary=salary+salary*0.1
where employee.job_id = (select job.job_id from job join employee on employee.job_id=job.job_id where designation='clerk')
select * from employee where employee.job_id = (select job.job_id from job join employee on employee.job_id=job.job_id where designation='clerk');

--Question 7) Display the second highest salary drawing employee details.
select top 1 * from employee where salary < (select max(salary) from employee) order by salary desc;

--Question 8) List out the employees who earn more than every employee in department 30.
select * from employee where department_id=30 and salary=(select max(salary) from employee);

--Question 9) Find out which department has no employees. 
select name from department full join employee on employee.department_id=department.department_id where employee_id is null;
--or
select name from department where department_id not in (select department_id from employee);

--Question 10) Find out the employees who earn greater than the average salary for their department.
select * from employee join department on employee.department_id=department.department_id where salary>(select avg(salary) from employee);