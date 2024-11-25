/*   QUE. 1: Create a table named Employee Details with the following 10 columns and use suitable constraint for every column:
           • EmployeeID (Serial)
           • FirstName (VARCHAR, maximum 50 characters)
           • LastName (VARCHAR, maximum 50 characters)
           • Email (VARCHAR, maximum 100 characters)
           • PhoneNumber (VARCHAR, maximum 15 characters)
           • HireDate (DATE)
           • Salary (DECIMAL, with precision 10 and scale 2)
           • DepartmentID (Integer)
           • IsActive (BOOLEAN)
           • JobTitle (VARCHAR, maximum 100 characters) */

create table employee_details 
(
Employee_ID serial,
First_Name varchar(50),
Last_Name varchar(50),	
email varchar(100),
Phone_Number varchar(15),	
Hire_Date date,
Salary	decimal(10,2), 
Department_ID int,	
Is_Active boolean,
Job_Title varchar(100)
);


select * from employee_details   -- this will show the table we have created in data output window 




/*  QUE. 2: Insert data into the Employee_Details Table
       (A). Insert at least 5 rows of data into the Employee_Details table created in Task 1.
       (B). Use meaningful data for each column, making sure the EmployeeID is unique, Salary is realistic, and the HireDate is in a valid date format.
       (C). Write the SQL queries to insert the data. */


insert into employee_details
values (1,'Arushi','Sharma','arushi.sharma@example.com',9852523420,'25-03-2016',48000,2,'No','Data Analyst'),
       (2,'Sayli','Sathe','sayli.sathe@example.com',8756363420,'19-07-2024',69000,1,'Yes','QA Engineer'),
	   (3,'Rajiv','Tayde','rajiv.tayde@example.com',9522163260,'12-08-2020',68000,4,'NO','Software Tester'),
	   (4,'Vijay','Raut','vijay.raut@example.com',8659334263,'25-11-2023',55000,3,'Yes','Business Analyst'),
	   (5,'Neha','Tandan','neha.tandan@example.com',9852112530,'22-06-2028',80000,5,'No','Office Manager');
	   
	   
	   
/*   QUE. 3: Insert Data from a CSV File into the SQL Table
             Insert data from a CSV file into the existing Employee_Details table that you created in Task 1. */
			 
copy employee_details from 'D:\Employee_Details.csv' delimiter ',' csv header;



/*   QUE. 4: Update the Employee_Details Table
             Update the EmployeeDetails table by setting the DepartmentID to 0 for all employees where IsActive is set to False. */
	 
UPDATE employee_details

set department_id = 0 where Is_active = 'False';


	   
/*   QUE. 5: Update the Employee_Details Table - Salary Increment

         (A). Increase the Salary by 8% for employees who meet the following conditions:
            • IsActive = False
            • DepartmentID = 0
            • JobTitle is one of the following:
            1.HR Manager 2. Financial Analyst 3. Business Analyst 4. Data Analyst */
			
update employee_details

set salary = salary + (salary*8/100)

where is_active = 'False' and department_id = 0 and job_title in('HR manager','Financial Analyst','Business Analyst','Data Analyst');


/*   QUE. 6: Query to Find Employees with Custom Column Names
             Retrieve the FirstName and LastName of employees whose Salary is between
             30,000 and 50,000 and display the results as Name (for FirstName) and Surname (for LastName).*/

select first_name as Name , last_name as Surname from employee_details

where salary between 30000 and 50000;


/*   QUE. 7: Query to Find Employees Whose FirstName Starts with 'A'
             Retrieve all data from the Employee_Details table where the FirstName starts with the letter 'A'.  */

select * from employee_details where first_name LIKE 'A%'; 


/*   QUE. 8: Delete Rows with EmployeeID from 1 to 5
           . Delete the rows from the Employee_Details table where the EmployeeID is between 1 and 5. */
		   
Delete from employee_details

where employee_id between 1 and 5;

		   
/*   QUE. 9: Rename Table and Columns
          1. Change the name of the table and specific column names in the existing database
             structure to enhance clarity.
          Instructions:
    QUE. 9(A)  Rename the table from Employee_Details to employee_database.*/
	
alter table employee_details

rename to employee_database; 
   
   
   
/*   QUE. 9(B)  Rename the columns as follows:
            1. Change FirstName to Name.
            2. Change LastName to Surname.  */

alter table employee_database

rename column First_name to Name;


alter table employee_database

rename column last_name to Surname;




/*  QUE. 10: Add State Column and Update Data in PostgreSQL
          1. Enhance the employee_database table by adding a new column for State and 
		     populating it based on the IsActive status of employees.
		     Instructions
    QUE. 10(A). Add a new column named State with the following specifications:
              . Data type: VARCHAR
              . Constraint: NOT NULL
    QUE. 10(B). Update the State column with the following conditions:
              . Set State to 'India' for all employees where IsActive is TRUE.
              . Set State to 'USA' for all employees where IsActive is FALSE. */	   


alter table employee_database 
add column State varchar not null DEFAULT 'Unknown';


update employee_database
set state = 'India' where is_active = 'true';

update employee_database
set state = 'USA' where is_active = 'false';


select * from employee_database; -- to show the results that are updated in table.
