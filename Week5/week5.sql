-- Question 1

-- Question 1a
CREATE TEMP TABLE TEMP_TABLE_0058 (
    Lname VARCHAR(15) NOT NULL,
    Pname VARCHAR(15)  NOT NULL,
    Hours DECIMAL(3,1) NOT NULL
);
\d TEMP_TABLE_0058;

INSERT INTO TEMP_TABLE_0058 (Lname, Pname, Hours)
SELECT E.Lname, P.Pname, W.Hours from Employee E, PROJECT P, WORKS_ON W
WHERE E.Ssn = W.Essn AND P.Pnumber = W.Pno;

SELECT * FROM TEMP_TABLE_0058;


-- Question 1b
-- Before
SELECT * FROM Project WHERE Pnumber=10;

UPDATE PROJECT SET Plocation='Bellaire', Dnum=5 WHERE Pnumber=10;

-- After
SELECT * FROM Project WHERE Pnumber=10;

-- Question 1c
SELECT *  
FROM Employee, Department 
WHERE Employee.Dno = Department.Dnumber AND Department.Dname = 'Research';

UPDATE Employee
SET Salary = Salary + (0.10 * Employee.Salary)
FROM Department
WHERE Dno = Department.Dnumber AND Department.Dname='Research';

SELECT *  
FROM Employee, Department 
WHERE Employee.Dno = Department.Dnumber AND Department.Dname = 'Research';

-- Question 1d

SELECT *
FROM Employee 
WHERE Lname='Brown';

DELETE FROM Employee
WHERE Lname='Brown';

SELECT *
FROM Employee 
WHERE Lname='Brown';

-- Question 1e

ALTER TABLE employee DROP CONSTRAINT employee_super_ssn_fkey;
ALTER TABLE department DROP CONSTRAINT department_mgr_ssn_fkey;
ALTER TABLE works_on DROP CONSTRAINT works_on_essn_fkey;
DELETE FROM Employee WHERE Ssn NOT IN ( SELECT D.Essn FROM Dependent D);
SELECT * FROM Employee;

-- Question 2

-- Question 2a
-- Make your own table schemas from here on but here is there general structure
BEGIN;
    CREATE TABLE TBNAME_0058 (
        A INT,
        B INT
    );

    INSERT INTO TBNAME_0058(A, B) VALUES(1, 2),(3,4);
    INSERT INTO TBNAME_0058(A, B) VALUES(5, 6);
END TRANSACTION;

\d TBNAME_0058;
SELECT * FROM TBNAME_0058;


-- Question 2b
BEGIN;
    CREATE TABLE TBNAME1_0058(
        A INT,
        B INT
    );

    INSERT INTO TBNAME1_0058(A, B) VALUES(7, 8);
    INSERT INTO TBNAME1_0058(A, B) VALUES(9, 10);

    \d TBNAME1_0058;

    SELECT * FROM TBNAME1_0058;
ROLLBACK;

\d TBNAME1_0058;


-- Question 2c
BEGIN;
    CREATE TABLE TBNAME2_0058(
        A INT,
        B INT
    );

    INSERT INTO TBNAME2_0058(A, B) VALUES(9, 10);
    INSERT INTO TBNAME2_0058(A, B) VALUES(11, 12);

    SAVEPOINT HELLO;

    INSERT INTO TBNAME2_0058(A, B) VALUES(13, 14);
    INSERT INTO TBNAME2_0058(A, B) VALUES(15, 16);

    \d TBNAME2_0058;
    SELECT * FROM TBNAME2_0058;

    ROLLBACK TO HELLO;
END TRANSACTION;

SELECT * FROM TBNAME2_0058;
