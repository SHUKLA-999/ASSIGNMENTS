USE ASSIGNMENT ;

/* 1.Display all information in the tables EMP and DEPT? */
SELECT * FROM EMPLOYEE_1000 ;
SELECT * FROM DEPARTMENT ;


/* 2. Display only the hire date and employee name for each employee? */
SELECT FIRST_NAME, HIRE_DATE , DEPARTMENT_ID FROM EMPLOYEE_1000;


/* 3. Display the ename concatenated with the job ID, separated by a comma and space, and
name the column Employee and Title ? */
SELECT FIRST_NAME, LAST_NAME, CONCAT_WS("-",FIRST_NAME ,LAST_NAME) 
FROM EMPLOYEE_1000 ;


/*4. Display the hire date, name and department number for all clerks?*/ 
SELECT FIRST_NAME,HIRE_DATE,DEPARTMENT_ID FROM EMPLOYEE_1000 ;


/*5. Create a query to display all the data from the EMP table. Separate each column by a
comma. Name the column THE OUTPUT?*/
SELECT * FROM EMPLOYEE_1000 ;
ALTER TABLE EMPLOYEE_1000 ADD COLUMN THE_OUTPUT INT AFTER CITY;


/*6. Display the names and dates of employees with the column headers "Name" and "Start
Date?*/
SELECT EMPLOYEE_ID AS "NAME",HIRE_DATE AS "START DATE" FROM EMPLOYEE_1000;


/*7. Display the names and hire dates of all employees in the order they were hired?*/
SELECT EMPLOYEE_ID,HIRE_DATE FROM EMPLOYEE_1000 WHERE HIRE_DATE;


/*8. Display the names and salaries of all employees in reverse salary order?*/ 
SELECT REVERSE(FIRST_NAME) FROM EMPLOYEE_1000;
SELECT REVERSE(SALARY) FROM EMPLOYEE_1000;
SELECT REVERSE(FIRST_NAME) AND (SALARY) FROM EMPLOYEE_1000;


/*9. Display 'ename" and "deptno" who are all earned commission and display salary in
reverse order?*/
SELECT EMPLOYEE_ID,DEPARTMENT_ID FROM EMPLOYEE_1000 WHERE REVERSE (SALARY); 


/*10. Display the last name and job title of all employees who do not have a manager?*/
SELECT LAST_NAME,JOB_ID FROM EMPLOYEE_1000 WHERE NOT MANAGER_ID;


/*11. Display the last name, job, and salary for all employees whose job is sales representative
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000?*/
SELECT LAST_NAME,JOB_ID,SALARY FROM EMPLOYEE_1000 WHERE JOB_ID NOT IN ("2500","3500","5000");


/*12.Display the maximum, minimum and average salary and commission earned?*/
SELECT MIN(SALARY)FROM EMPLOYEE_1000;
SELECT MAX(SALARY)FROM EMPLOYEE_1000;
SELECT AVG(SALARY)FROM EMPLOYEE_1000;
SELECT COUNT(SALARY)FROM EMPLOYEE_1000;
SELECT * FROM EMPLOYEE_1000 WHERE COMMISSION_PCT;


/*13.Display the department number, total salary payout and total commission payout for
each department?*/ 
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMPLOYEE_1000 GROUP BY DEPARTMENT_ID;
SELECT COMMISSION_PCT FROM EMPLOYEE_1000;


/*14.Display the department number and number of employees in each department?*/
SELECT DEPARTMENT_ID, COUNT(*) FROM EMPLOYEE_1000 GROUP BY DEPARTMENT_ID; 
ALTER TABLE EMPLOYEE_1000 ADD COLUMN DEPARTMENT VARCHAR(30) AFTER DEPARTMENT_ID;

/*15.Display the department number and total salary of employees in each department?*/
SELECT  SUM(SALARY) FROM EMPLOYEE_1000;
SELECT DISTINCT DEPARTMENT FROM EMPLOYEE_1000 ;


/*16.Display the employee's name who doesn't earn a commission. Order the result set
without using the column name?*/
SELECT FIRST_NAME ,LAST_NAME AS FIRSTNAME,SALARY FROM EMPLOYEE_1000 WHERE COMMISSION_PCT IS NULL; 


/*17.Display the employees name, department id and commission. If an Employee doesn't
earn the commission, then display as 'No commission'. Name the columns appropriately?*/
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID,
CASE 
  WHEN (COMMISSION_PCT) THEN (SELECT(COMMISSION_PCT)
  FROM EMPLOYEE_1000) 
  ELSE COMMISSION_PCT
  END AS "NO COMMISSION" FROM EMPLOYEE_1000;

  
/*18.Display the employee's name, salary and commission multiplied by 2. If an Employee
doesn't earn the commission, then display as 'No commission. Name the columns
appropriate?*/
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID,
CASE
WHEN (COMMISSION_PCT*2)>0 THEN (SELECT(COMMISSION_PCT*2)
FROM EMPLOYEE_1000)
ELSE "NO COMMISSION"
END FROM EMPLOYEE_1000;  


/*19) Display the sum of salaries of the employees working under each Manager?*/
SELECT MANAGER_ID, SUM(SALARY) FROM EMPLOYEE_1000
GROUP BY MANAGER_ID;


/*20) Select the Managers name, the count of employees working under and the department
ID of the manager?*/
SELECT COUNT(EMPLOYEE_ID),COUNT(DEPARTMENT_ID) FROM EMPLOYEE_1000;


/*21) Select the employee name, department id, and the salary. Group the result with the
manager name and the employee last name should have second letter 'a?*/
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEE_1000 WHERE LAST_NAME LIKE "_A%";


/*22) Display the average of sum of the salaries and group the result with the department id.
Order the result with the department id?*/
SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE_1000
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;


/*23) Display the commission, if not null display 10% of salary, if null display a default value 1?*/
SELECT EMPLOYEE_ID,COMMISSION_PCT,
CASE 
    WHEN COMMISSION_PCT = 0.00 THEN '1'
    ELSE 0.10*SALARY
END AS SALARY
FROM EMPLOYEE_1000;


/*24. Write a query that displays the employee's last names only from the string's 2-5th
position with the first letter capitalized and all other letters lowercase, Give each column an
appropriate label?*/
SELECT LAST_NAME, CONCAT(UCASE(SUBSTR(LAST_NAME,2,1)),LCASE(SUBSTR(LAST_NAME,3,3)))
FROM EMPLOYEE_1000;


/*25. Write a query that displays the employee's first name and last name along with a " in
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
month on which the employee has joined?*/
SELECT FIRST_NAME,LAST_NAME,CONCAT_WS("-",FIRST_NAME,LAST_NAME) AS EMPLOYEE_ID,DATE_FORMAT(HIRE_DATE,"%M") AS HIRE_MONTH
FROM EMPLOYEE_1000;


/*26. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
department id, salary and the manager name all in Upper case, if the Manager name
consists of 'z' replace it with '$!?*/
SELECT EMPLOYEE_ID,CONCAT(INSERT(EMPLOYEE_ID,2,0,"00"),"E") AS EMPLOYEE_ID,DEPARTMENT_ID,SALARY,UCASE(MANAGER_ID) AS MANAGER,
CASE
  WHEN MANAGER_ID LIKE 'Z%' THEN '$!'
  WHEN MANAGER_ID LIKE '%Z%' THEN '$!'
  WHEN MANAGER_ID LIKE '%Z' THEN '$!'
  ELSE MANAGER_ID
  END AS MANAGER_EDITED
  FROM EMPLOYEE_1000;
  
  
/*27. Write a query that displays the employee's last names with the first letter capitalized and
all other letters lowercase, and the length of the names, for all employees whose name
starts with J, A, or M. Give each column an appropriate label. Sort the results by the
employees' last names?*/
SELECT CONCAT(UCASE(SUBSTR(LAST_NAME,1,1)),LCASE(SUBSTR(LAST_NAME,2))) AS SUR_NAME,LENGTH(LAST_NAME) AS CHAR_LENGTH
FROM EMPLOYEE_1000
WHERE LAST_NAME LIKE 'A%' OR LAST_NAME LIKE 'J%' OR LAST_NAME LIKE 'M%'
ORDER BY LAST_NAME;


/*28. Create a query to display the last name and salary for all employees. Format the salary to
be 15 characters long, left-padded with $. Label the column SALARY?*/
SELECT LAST_NAME,SALARY,CONCAT('$'," ",(FORMAT(SALARY,15))) AS SALARY
FROM EMPLOYEE_1000;


/*29. Display the employee's name if it is a palindrome?*/
SELECT FIRST_NAME FROM EMPLOYEE_1000
WHERE FIRST_NAME = REVERSE (FIRST_NAME);


/*30. Display First names of all employees with initcaps?*/
SELECT CONCAT(UCASE(SUBSTR(FIRST_NAME,1,1)),LCASE(SUBSTR(FIRST_NAME,2))) AS INITCAP_NAME FROM EMPLOYEE_1000;


/*31. Extract first letter from First Name column and append it with the Last Name. Also add
"@systechusa.com" at the end. Name the column as e-mail address. All characters should
be in lower case. Display this along with their First Name?*/
SELECT FIRST_NAME,LAST_NAME,LCASE(CONCAT(SUBSTR(FIRST_NAME,1,1),LAST_NAME,"@systechusa.com")) AS EMAIL_ADDRESS
FROM EMPLOYEE_1000;


/*32.Display the names and job titles of all employees with the same job as Trenna?*/
SELECT CONCAT_WS(" ",FIRST_NAME,LAST_NAME) AS FULL_NAME,JOB_ID
FROM EMPLOYEE_1000
WHERE JOB_ID IN 
(SELECT JOB_ID FROM EMPLOYEE_1000 WHERE FIRST_NAME ='TRENNA'); 


/*33.Display the name of the employee whose salary is the lowest?*/ 
SELECT FIRST_NAME FROM EMPLOYEE_1000 
WHERE SALARY =(SELECT MIN(SALARY) FROM EMPLOYEE_1000);


/* 34.Display the names of all employees except the lowest paid?*/
SELECT CONCAT_WS(" ",FIRST_NAME,LAST_NAME) AS FULL_NAME
FROM EMPLOYEE_1000
WHERE SALARY NOT IN (SELECT MIN(SALARY) FROM EMPLOYEE_1000);


/* 35.Display the employee last name and department name of all employees who have an 'a'
in their last name?*/
SELECT LAST_NAME , JOB_ID FROM EMPLOYEE_1000
WHERE LAST_NAME LIKE "%A";


/*36.Display the employee last name and employee number along with their manager's last
name and manager number?*/
SELECT EMPLOYEE_ID,LAST_NAME,MANAGER_ID,FIRST_NAME
FROM EMPLOYEE_1000;


/*37.Create a query to display the employee numbers and last names of all employees who
earn more than the average salary. Sort the results in ascending order of salary?*/
SELECT EMPLOYEE_ID,LAST_NAME,SALARY
FROM EMPLOYEE_1000
WHERE SALARY> (SELECT AVG(SALARY) FROM EMPLOYEE_1000)
ORDER BY SALARY;


/*38.Display the last name and salary of every employee who reports to FILLMORE?*/
SELECT LAST_NAME,SALARY
FROM EMPLOYEE_1000
WHERE FIRST_NAME ='NEENA';


/*39.Write a query to display the top three earners in the EMPLOYEES table. Display their last
names and salaries?*/
SELECT LAST_NAME,SALARY
FROM EMPLOYEE_1000 
ORDER BY SALARY DESC
LIMIT 4;


/*40.Display the names of all employees with their salary and commission earned. Employees
with a null commission should have O in the commission column?*/
SELECT FIRST_NAME,SALARY,
CASE 
 WHEN COMMISSION_PCT IS NULL THEN '0'
 ELSE COMMISSION_PCT
 END AS COMMISSION
 FROM EMPLOYEE_1000;
 
 /*41. Write a query to display the last name, department number, department name for all
employees? */
SELECT LAST_NAME , DEPARTMENT, DEPARTMENT_ID FROM EMPLOYEE_1000;


/*42. Create a unique list of all jobs that are in department 4. Include the location of the
department in the output? */
SELECT DISTINCT DEPARTMENT FROM EMPLOYEE_1000;


/*43.Write a query to display the employee last name,department name,location id and city of
all employees who earn commission? */
SELECT LAST_NAME ,DEPARTMENT,COMMISSION_PCT FROM EMPLOYEE_1000
WHERE COMMISSION_PCT IS NOT NULL ;


/*44.Write a query to display the last name,job,department number and department name for
all employees who work in ATLANTA?*/
SELECT LAST_NAME , JOB_ID, DEPARTMENT, CITY FROM EMPLOYEE_1000
WHERE CITY = 'ATLANTA' ; 


/*45. Display the employee last name and employee number along with their manager's last
name and manager number?*/
SELECT LAST_NAME,EMPLOYEE_ID, MANAGER_ID, MALAST_NAME FROM EMPLOYEE_1000;


/*46. Create a query that displays the name,job,department name,salary,grade for all
employees. Derive grade based on salary(>=50000=A)*/
SELECT LAST_NAME , JOB_ID, DEPARTMENT , SALARY FROM EMPLOYEE_1000
WHERE SALARY> 5000;
SELECT SALARY AS A FROM EMPLOYEE_1000;


/* 47. Display the names and hire date for all employees who were hired before their
managers along withe their manager names and hire date. Label the columns as Employee
name, emp_hire_date,manager name,man_hire_date? */
SELECT FIRST_NAME AS EMPLOYEE_NAME, HIRE_DATE AS EMP_HIRE_DATE,
MANAGER_ID AS MAN_HIRE_DATE FROM EMPLOYEE_1000;


/* 48.Write a query to display employee numbers and employee name (first name, last name)
of all the sales employees who received an amount of 2000 in bonus? */
ALTER TABLE EMPLOYEE_1000 ADD COLUMN BONUS INT AFTER EMPLOYEE_ID ;
SELECT FIRST_NAME, LAST_NAME ,JOB_ID, BONUS FROM EMPLOYEE_1000
WHERE BONUS = '2000' ; 


/* 49.Fetch address details of employees belonging to the state CA. If address is null, provide
default value N/A? */
SELECT FIRST_NAME , CITY FROM EMPLOYEE_1000 WHERE CITY = 'CA';


/* 50. Write a query that displays all the products along with the Sales OrderID even if an order
has never been placed for that product? */
ALTER TABLE EMPLOYEE_1000 ADD COLUMN SALES_ORDERID INT AFTER JOB_ID ;
SELECT SALES_ORDERID FROM EMPLOYEE_1000;


/* 51.Find the subcategories that have at least two different prices less than $15?*/
ALTER TABLE EMPLOYEE_1000 ADD COLUMN SUBCATEGORIES INT AFTER FIRST_NAME;
SELECT SUBCATEGORIES FROM EMPLOYEE_1000 
WHERE SUBCATEGORIES < '15' ;


/* 52.A. Write a query to display employees and their manager details. Fetch employee id,
employee first name, and manager id, manager name? */
SELECT EMPLOYEE_ID , FIRST_NAME , MANAGER_ID FROM EMPLOYEE_1000;


/* 53. Display the employee id and employee name of employees who do not have manager? */
ALTER TABLE EMPLOYEE_1000 ADD COLUMN MANAGER VARCHAR(78) AFTER MANAGER_ID;
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER
FROM EMPLOYEE_1000
WHERE MANAGER IS NULL;


/* 54. Display the names of all products of a particular subcategory 15 and the names of their
vendors?*/
ALTER TABLE EMPLOYEE_1000 ADD COLUMN VENDOR VARCHAR(78) AFTER DEPARTMENT ;
 SELECT FIRST_NAME , VENDOR FROM EMPLOYEE_1000
 WHERE SUBCATEGORIES = '15' ;
 
 
 /* 55. Find the products that have more than one vendor? */
 ALTER TABLE EMPLOYEE_1000 ADD COLUMN PRODUCT VARCHAR(89) AFTER FIRST_NAME ;
 SELECT PRODUCT, COUNT(DISTINCT Vendor) AS NUMVENDORS
FROM EMPLOYEE_1000
GROUP BY PRODUCT
HAVING COUNT(DISTINCT Vendor) > 1;


/* 56. Find all the customers who do not belong to any store ? */
ALTER TABLE EMPLOYEE_1000 ADD COLUMN STORE_ID INT AFTER FIRST_NAME ;
SELECT STORE_ID FROM EMPLOYEE_1000
WHERE STORE_ID IS NULL;


/* 57.Find sales prices of product 718 that are less than the list price recommended for that
product? */
 SELECT SALES_ORDERID FROM employee_1000
 WHERE SALES_ORDERID <= '718' ;
 
 
 /* 58. Display product number, description and sales of each product in the year 2001 ? */
 ALTER TABLE EMPLOYEE_1000 ADD COLUMN YEAR INT AFTER DEPARTMENT ;
 SELECT STORE_ID, YEAR FROM EMPLOYEE_1000
 WHERE YEAR = 2001 ;
 
 
 /* 59.  Write a query to display the last name and hire date of any employee in the same
department as SALES ? */
ALTER TABLE EMPLOYEE_1000 ADD COLUMN DEPARTMENT_NAME VARCHAR(89) AFTER DEPARTMENT ; 
 SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEE_1000
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEE_1000 WHERE DEPARTMENT_NAME = 'SALES')
ORDER BY HIRE_DATE DESC;


/* 60. Create a query to display the employee numbers and last names of all employees who
earn more than the average salary. Sort the results in ascending order of salary? */
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEE_1000
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE_1000)
ORDER BY salary ASC;


/* 61. Write a query that displays the employee numbers and last names of all employees who
work in a department with any employee whose last name contains ' u ? */
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEE_1000
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEE_1000
WHERE LAST_NAME LIKE '%U%'
) ;


/* 62. Display the last name and salary of every employee who reports to FILLMORE? */
 SELECT LAST_NAME, SALARY
FROM EMPLOYEE_1000
WHERE MANAGER_ID = (SELECT EMPLOYEE_ID 
FROM EMPLOYEE_1000 WHERE LAST_NAME = 'FILLMORE');

CREATE TABLE DEPARTMENT_1
(
DEP_IDD INT PRIMARY KEY,
DEP_NAME VARCHAR(678),
DEP_EMAIL VARCHAR(786),
DEP_JOB_ID VARCHAR(67),
DEP_STORE_ID INT,
FOREIGN KEY (DEP_STORE_ID) REFERENCES EMPLOYEE_1000 (EMPLOYEE_ID)
) ;

ALTER TABLE DEPARTMENT_1 ADD CONSTRAINT FOREIGN KEY (DEP_STORE_ID)
REFERENCES EMPLOYEE_1000 (EMPLOYEE_ID) ; 


/* 63. Display the department number, last name, and job ID for every employee in the
OPERATIONS department? */
 SELECT JOB_ID, EMAIL, DEPARTMENT_NAME, EMPLOYEE_ID
FROM EMPLOYEE_1000
JOIN DEPARTMENT_1  ON DEP_IDD = EMPLOYEE_ID
WHERE DEPARTMENT_NAME = 'SALES';


/* 64. DISPLAY LEFT JOIN ON EMPLOYEE? */

SELECT EMPLOYEE_1000.*, DEPARTMENT_1.DEP_IDD
FROM EMPLOYEE_1000
LEFT JOIN DEPARTMENT_1 ON EMPLOYEE_1000.DEPARTMENT_ID = DEPARTMENT_1.DEP_IDD ;


/* 65. DISPLAY RIGHT JOIN ON EMPLOYEE AND DEPARTMENT ? */
 SELECT *
FROM EMPLOYEE_1000
RIGHT JOIN DEPARTMENT_1 ON  DEP_IDD = EMPLOYEE_ID;



/* 65. Modify the above query to display the employee numbers, last names, and salaries of all
employees who earn more than the average salary and who work in a department with any
employee with a 'u'in their name? */
 SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEE_1000
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE_1000)
AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEE_1000 WHERE LAST_NAME LIKE '%u%');

/* 66.Display the names of all employees whose job title is the same as anyone in the sales
dept ? */
SELECT FIRST_NAME, DEPARTMENT_NAME
FROM EMPLOYEE_1000 
WHERE JOB_ID IN (SELECT JOB_ID FROM EMPLOYEE_1000
WHERE DEPARTMENT_NAME = 'SALES'
);

/* 67. Write a query to display the top three earners in the EMPLOYEES table. Display their last
names and salaries ? */
SELECT LAST_NAME, SALARY
FROM EMPLOYEE_1000
ORDER BY SALARY DESC
LIMIT 3;


/* 68.  Display the names of all employees with their salary and commission earned. Employees
with a null commission should have O in the commission column ? */
SELECT FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, SALARY,
COALESCE(COMMISSION_PCT, 0) AS COMMISIION_EARNED
FROM EMPLOYEE_1000 ;

/* 69. Display the Managers (name) with top three salaries along with their salaries and
department information? */
SELECT MANAGER AS Manager_Name, SALARY AS SALARIES, DEPARTMENT AS DEPARTMENTS
FROM EMPLOYEE_1000
JOIN DEPARTMENT ON DEPARTMENT_ID = DEPARTMENT_ID
ORDER BY SALARY DESC
LIMIT 3;


/* 70. Write a compound query to produce a list of employees showing raise percentages,
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
given a 15% raise, and employees in department 6 are not given a raise ? */
SELECT EMPLOYEE_ID, SALARY,DEPARTMENT,
CASE
WHEN DEPARTMENT IN (1, 3) THEN SALARY * 0.05
WHEN DEPARTMENT = 2 THEN SALARY * 0.1
WHEN DEPARTMENT IN (4, 5) THEN SALARY * 0.15
ELSE 0
END AS RAISE_PERCENTAGE
FROM EMPLOYEE_1000 ;

/* 71. Display the structure of employee? */
DESCRIBE EMPLOYEE_1000 ;

/* 72. Display Firstname as ename in employee? */
SELECT FIRST_NAME AS ENAME FROM EMPLOYEE_1000;

/* 73 . Display the employee name in ascending order ? */
SELECT * FROM EMPLOYEE_1000 ORDER BY FIRST_NAME ASC ;


/*74.  DISPLAY the last name letter u ? */
SELECT * FROM EMPLOYEE_1000 WHERE LAST_NAME LIKE "U%";


/* 75. Find the date difference between the hire date and resignation_date for all the
employees. Display in no. of days, months and year(1 year 3 months 5 days).
Emp_ID Hire Date Resignation_Date ? */

/* 1. 1/1/2000, 7/10/2013 */

SELECT CONCAT( FLOOR(DATEDIFF('2013-07-10', '2000-01-01') /365), 'YEAR' ,
FLOOR((DATEDIFF('2013-07-10', '2000-01-01') % 365) / 30), ' MONTH ',
(DATEDIFF('2013-07-10', '2000-01-01') % 30), ' DAY'
) AS DURATION ;

/* 2.  4/12/2003 ,3/8/2017 */

SELECT CONCAT(FLOOR(DATEDIFF('2017-03-08', '2003-04-12') / 365), 'YEAR', 
FLOOR((DATEDIFF('2017-03-08', '2003-04-12') % 365) / 30), ' MONTH',
(DATEDIFF('2017-03-08', '2003-04-12') % 30), 'DAY'
) AS DURATION ;

/* 76. 22/9/2012, 21/6/2015 */
SELECT CONCAT(FLOOR(DATEDIFF('2015-21-O6','2012-22-09') / 365), 'YEAR',
FLOOR((DATEDIFF('2015-21-O6','2012-22-09') % 365) /30), 'MONTH',
(DATEDIFF('2015-21-O6','2012-22-09') % 30), 'DAY'
) AS DURATION ;

/* 77. 13/4/2015, NULL */
SELECT CONCAT(FLOOR(DATEDIFF('2015-13-04','NULL') / 365), 'YEAR',
FLOOR((DATEDIFF('2015-13-04','NULL') % 365) /30), 'MONTH',
(DATEDIFF('2015-13-04','NULL') % 30), 'DAY'
) AS DURATION ;


/* 78. 5 03/06/2016, NULL */

SELECT CONCAT(FLOOR(DATEDIFF('2016-03-06','NULL') / 365), 'YEAR',
FLOOR((DATEDIFF('2016-03-06','NULL') % 365) /30), 'MONTH',
(DATEDIFF('2016-03-06','NULL') % 30), 'DAY'
) AS DURATION ;


/* 79. Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd,
yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900) ? */
SELECT IFNULL(DATE_FORMAT(HIRE_DATE, '%m/%d/%Y'), 'DEC 01, 1900') AS FORMATTED_HIRE_DATE,
IFNULL(DATE_FORMAT(RESIGNATION_DATE, '%b %D, %Y'), 'DEC 01th, 1900') AS FORMATTED_RESIGNATION_DATE
FROM EMPLOYEE_1000;



/* 80.  Calcuate experience of the employee till date in Years and months(example 1 year and 3
months) ? */

SELECT CONCAT(FLOOR(DATEDIFF('2017-03-08', '2003-04-12') / 365), 'YEAR', 
FLOOR((DATEDIFF('2017-03-08', '2003-04-12') % 365) / 30), ' MONTH',
(DATEDIFF('2017-03-08', '2003-04-12') % 30), 'DAY'
) AS EXPERIENCE FROM EMPLOYEE_1000 ;



/* 81.  Display the count of days in the previous quarter ? */
SELECT DATEDIFF(LAST_DAY(DATE_SUB(CURDATE(), INTERVAL 1 QUARTER)), 
DATE_SUB(CURDATE(), INTERVAL 1 QUARTER)
) + 1 AS DAYS_IN_PREVIOUS_QUARTER ;



/* 82.  Fetch the previous Quarter's second week's first day's date ? */
 SELECT DATE_SUB(DATE_SUB(DATE_ADD(LAST_DAY(DATE_SUB(NOW(), INTERVAL 3 MONTH)), 
INTERVAL 1 DAY
), 
INTERVAL WEEKDAY(DATE_SUB(NOW(), INTERVAL 3 MONTH)) + 13 DAY
), 
INTERVAL 1 WEEK
) AS Previous_Quarter_Second_Week_First_Day;



/* 83.  Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)? */
SELECT
    DATE_ADD('2024-04-01', INTERVAL (15 - 1) * 7 DAY) AS STARTDATE,
    DATE_ADD('2024-04-01', INTERVAL (15 - 1) * 7 + 6 DAY) AS ENDDATE;
  
  
  
 /* 84. Find out the date that corresponds to the last Saturday of January, 2015 using with
clause? */
SELECT DATE_SUB(LAST_DAY('2015-01-01'), INTERVAL (DAYOFWEEK(LAST_DAY('2015-01-01')) + 1) DAY) AS 
Last_Saturday_of_January_2015;


/*85. Describe the employee table AND Department ? */
DESCRIBE EMPLOYEE_1000 ;
 DESCRIBE DEPARTMENT_1 ;  













   
	
 


    

    
 
    








    
    

    




 
 
 








 
