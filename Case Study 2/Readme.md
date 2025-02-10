# **Create the following table:**
 
*LOCATION* 
| Location_ID (PK) | City      |
|------------------|----------|
| 122             | New York  |
| 123             | Dallas    |
| 124             | Chicago   |
| 167             | Boston    |
 
*DEPARTMENT*
| Department_Id (PK) | Name        | Location_Id (FK) |
|--------------------|-------------|------------------|
| 10                 | Accounting  | 122              |
| 20                 | Sales      | 124              |
| 30                 | Research   | 123              |
| 40                 | Operations | 167              |

*JOB*
| Job_ID (PK) | Designation  |
|-------------|--------------|
| 667         | Clerk        |
| 668         | Staff        |
| 669         | Analyst      |
| 670         | Sales Person |
| 671         | Manager      |
| 672         | President    |
 
 
*EMPLOYEE* 
| Employee_Id | Last_Name | First_Name | Middle_Name | Job_Id (FK) | Hire_Date   | Salary | Comm | Department_Id (FK) |
|-------------|-----------|------------|-------------|-------------|-------------|--------|------|---------------------|
| 7369        | Smith     | John       | Q           | 667         | 17-Dec-84   | 800    | Null | 20                  |
| 7499        | Allen     | Kevin      | J           | 670         | 20-Feb-85   | 1600   | 300  | 30                  |
| 755         | Doyle     | Jean       | K           | 671         | 04-Apr-85   | 2850   | Null | 30                  |
| 756         | Dennis    | Lynn       | S           | 671         | 15-May-85   | 2750   | Null | 30                  |
| 757         | Baker     | Leslie     | D           | 671         | 10-Jun-85   | 2200   | Null | 40                  |
| 7521        | Wark      | Cynthia    | D           | 670         | 22-Feb-85   | 1250   | 50   | 30                  |

 
# **Simple Queries:**


1. List all the employee details. 
2. List all the department details. 
3. List all job details. 
4. List all the locations. 
5. List out the First Name, Last Name, Salary, Commission for all Employees. 
6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id". 
7. List out the annual salary of the employees with their names only. 


# **WHERE Condition:**


1. List the details about "Smith". 
2. List out the employees who are working in department 20. 
3. List out the employees who are earning salary between 2000 and 3000. 
4. List out the employees who are working in department 10 or 20. 
5. Find out the employees who are not working in department 10 or 30. 
6. List out the employees whose name starts with 'L'. 
7. List out the employees whose name starts with 'L' and ends with 'E'. 
8. List out the employees whose name length is 4 and start with 'J'. 
9. List out the employees who are working in department 30 and draw the salaries more than 2500. 
10. List out the employees who are not receiving commission.


# **ORDER BY Clause:**


1. List out the Employee ID and Last Name in ascending order based on the Employee ID. 
2. List out the Employee ID and Name in descending order based on salary. 
3. List out the employee details according to their Last Name in ascending-order. 
4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.


# **GROUP BY and HAVING Clause:**


1. List out the department wise maximum salary, minimum salary and average salary of the employees. 
2. List out the job wise maximum salary, minimum salary and average salary of the employees. 
3. List out the number of employees who joined each month in ascending order. 
4. List out the number of employees for each month and year in ascending order based on the year and month. 
5. List out the Department ID having at least four employees. 
6. How many employees joined in February month. 
7. How many employees joined in May or June month. 
8. How many employees joined in 1985? 
9. How many employees joined each month in 1985? 
10. How many employees were joined in April 1985? 
11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?


# **Joins:**


1. List out employees with their department names. 
2. Display employees with their designations. 
3. Display the employees with their department names and city. 
4. How many employees are working in different departments? Display with department names. 
5. How many employees are working in the sales department? 
6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order. 
7. How many employees are working in 'Dallas'? 
8. Display all employees in sales or operation departments.


# **CONDITIONAL STATEMENT**


1. Display the employee details with salary grades. Use conditional statement to create a grade column. 
2. List out the number of employees grade wise. Use conditional statement to create a grade column. 
3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.


# **Subqueries:**


1. Display the employees list who got the maximum salary. 
2. Display the employees who are working in the sales department. 
3. Display the employees who are working as 'Clerk'. 
4. Display the list of employees who are living in 'Boston'. 
5. Find out the number of employees working in the sales department. 
6. Update the salaries of employees who are working as clerks on the basis of 10%. 
7. Display the second highest salary drawing employee details. 
8. List out the employees who earn more than every employee in department 30. 
9. Find out which department has no employees. 
10. Find out the employees who earn greater than the average salary for their department.
