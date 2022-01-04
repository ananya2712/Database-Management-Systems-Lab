-- Q1
    -- Before
SELECT E.Ssn, P.Pname FROM Employee_0058 E, Project_0058 P, WORKS_ON_0058 W WHERE P.Pname='ProductX' AND P.Pnumber=W.Pno AND E.Ssn=W.Essn;
    -- Update
UPDATE Employee_0058 SET Salary=Salary+0.1*Salary FROM Project_0058 P, WORKS_ON_0058 W WHERE P.Pname='ProductX' AND P.Pnumber=W.pno AND Ssn=W.Essn;
    -- After
SELECT E.Ssn, P.Pname FROM Employee_0058 E, Project_0058 P, WORKS_ON_0058 W WHERE P.Pname='ProductX' AND P.Pnumber=W.Pno AND E.Ssn=W.Essn;

-- Q2
SELECT SUM(E.Salary) AS SUM_SALARY, MIN(E.Salary) AS MIN_SALARY, MAX(E.Salary) AS MAX_SALARY, AVG(E.Salary) AS AVG_SALARY FROM Employee_0058 E, Department D WHERE D.Dname='Research' AND E.Dno=D.Dnumber;

-- Q3
SELECT COUNT(*) FROM (SELECT DISTINCT Salary FROM Employee_0058) AS COUNT_DISTINCT_SALARY;

-- Q4
SELECT E.Ssn FROM Employee_0058 E, Dependent D WHERE E.Ssn=D.Essn GROUP BY E.Ssn HAVING COUNT(*) >= 2;

-- Q5
SELECT E.Dno, COUNT(E.Ssn), AVG(E.Salary) FROM Employee_0058 E GROUP BY E.Dno;

-- Q6
SELECT Fname, Minit, Lname FROM Employee_0058 WHERE Salary >= 10000 + (SELECT MIN(Salary) FROM Employee_0058);

-- Q7
SELECT Fname, Minit, Lname FROM Employee_0058 WHERE Dno=(SELECT Dno FROM Employee_0058 WHERE Salary=(SELECT MAX(Salary) FROM Employee_0058));

-- Q8
SELECT Dno, COUNT(*) FROM (SELECT * FROM Employee_0058 WHERE Salary >= 40000) AS TEMP GROUP BY Dno;
