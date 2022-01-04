-- use nested query to retrieve names of all employees with 2 or more dependents 
SELECT FName , Lname 
FROM Employee 
WHERE 
(	SELECT COUNT(*)
	FROM DEPENDENT 
	WHERE SSN = ESSN) >=2;

--Using nested query Retrieve the name of each employee
--who has a dependent with the same first name and is 
--the same sex as the employee

SELECT E.FName , E.Lname
FROM Employee AS E
WHERE E.SSN IN  
(
	SELECT ESSN
	FROM DEPENDENT
	WHERE E.FName = DEPENDENT_NAME AND E.GENDER = GENDER
);

--Using nested query retrieve names of employees whose 
--salary is greater than the salary of all the employees 
--in department 5

SELECT E.FName , E.Lname
FROM Employee AS E 
WHERE E.SALARY > all(
	SELECT SALARY
	FROM Employee
	WHERE DNO = 5
);

--Retrieve the names of employees who have no dependents

SELECT FName , Lname
FROM Employee
WHERE NOT EXISTS
(
	SELECT *
	FROM DEPENDENT
	WHERE SSN = ESSN
); 

--name of managers with at least one dependent 

SELECT FName , Lname
FROM Employee
WHERE EXISTS 
(
	SELECT * 
	FROM DEPENDENT
	WHERE ESSN = SSN
) 
AND EXISTS 
(
	SELECT * 
	FROM DEPARTMENT 
	WHERE SSN = MGR_SSN
);

--USING NATURAL JOIN , RETREIVE THE NAME AND ADDRESS OF
--EVERY EMPLOYEE WHO WORKS FOR RESEARCH DEPT.

SELECT FName, Lname , ADDRESS
FROM
(
	EMPLOYEE JOIN DEPARTMENT ON DNO = DNUMBER
)
WHERE DNAME = 'Research';