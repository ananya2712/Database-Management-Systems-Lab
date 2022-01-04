-- Question 1

CREATE TABLE DEPARTMENT_0058(
    Dname VARCHAR(10) UNIQUE,
    Dnumber VARCHAR(10) PRIMARY KEY,
    Mgr_ssn VARCHAR(10),
    Mgr_start_date DATE
);

CREATE TABLE EMPLOYEE_0058 (
    Fname VARCHAR(20) NOT NULL,
    Minit VARCHAR(20),
    Lname VARCHAR(20) NOT NULL,
    Ssn VARCHAR(10) PRIMARY KEY,
    Bdate DATE CHECK (Bdate < '1985-01-01'),
    Emp_address VARCHAR,
    Sex VARCHAR(1),
    Salary INT,
    Super_ssn VARCHAR(10) REFERENCES EMPLOYEE_0058(Ssn),
    Dno VARCHAR(10) UNIQUE REFERENCES DEPARTMENT_0058 (Dnumber)
);

-- ALTER TABLE DEPARTMENT_0058 ADD FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE_0058 (Ssn);
-- this messes a lot of shit up, but this line is required according to their diagram, i will simply cry, good day to whoever is reading this

CREATE TABLE DEPT_LOCATIONS_0058 (
    Dlocation VARCHAR UNIQUE NOT NULL,
    Dnumber VARCHAR(10) UNIQUE NOT NULL REFERENCES DEPARTMENT_0058 (Dnumber),
    PRIMARY KEY (Dlocation, Dnumber)
);

CREATE TABLE PROJECT_0058 (
    Pname VARCHAR(20) DEFAULT 'PROJECT_NAME',
    Pnumber VARCHAR(10) UNIQUE NOT NULL,
    Plocation VARCHAR UNIQUE NOT NULL,
    Dnum VARCHAR(10) UNIQUE REFERENCES DEPARTMENT_0058 (Dnumber),
    PRIMARY KEY (Pnumber, Plocation)
);

CREATE TABLE WORKS_ON_0058 (
    Essn VARCHAR(10) REFERENCES EMPLOYEE_0058 (Ssn),
    Pno VARCHAR(10) REFERENCES PROJECT_0058 (Pnumber),
    P_Hours INT,
    PRIMARY KEY (Essn, Pno)
);

CREATE TABLE DEPENDENT_0058 (
    Dependent_name VARCHAR(20) UNIQUE NOT NULL,
    Sex VARCHAR(1),
    Bdate DATE CHECK (Bdate < '1985-01-01'),
    Relationship VARCHAR(20) NOT NULL DEFAULT 'parent',
    Essn VARCHAR(10) UNIQUE NOT NULL REFERENCES EMPLOYEE_0058 (Ssn),
    PRIMARY KEY (Dependent_name, Essn)
);

\d DEPARTMENT_0058;
\d EMPLOYEE_0058;
\d DEPT_LOCATIONS_0058;
\d PROJECT_0058;
\d WORKS_ON_0058;
\d DEPENDENT_0058;

-- INSERTING VALUES
INSERT INTO DEPARTMENT_0058(Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES('1', '11', 'a', '2000-01-01');
INSERT INTO DEPARTMENT_0058(Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES('2', '22', 'b', '2000-02-01');
INSERT INTO DEPARTMENT_0058(Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES('3', '33', 'c', '2000-04-01');
INSERT INTO DEPARTMENT_0058(Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES('4', '44', 'd', '2000-06-01');
INSERT INTO DEPARTMENT_0058(Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES('5', '55', 'e', '2000-05-01');

INSERT INTO EMPLOYEE_0058(Fname, Minit, Lname, Ssn, Bdate, Emp_address, Sex, Salary, Super_ssn, Dno) VALUES('a', 'a', 'a', 'a', '1980-01-01', 'home', 'F', 1, 'a', '11');
INSERT INTO EMPLOYEE_0058(Fname, Minit, Lname, Ssn, Bdate, Emp_address, Sex, Salary, Super_ssn, Dno) VALUES('b', 'b', 'b', 'b', '1980-01-01', 'home', 'F', 1, 'b', '22');
INSERT INTO EMPLOYEE_0058(Fname, Minit, Lname, Ssn, Bdate, Emp_address, Sex, Salary, Super_ssn, Dno) VALUES('c', 'c', 'c', 'c', '1980-01-01', 'home', 'F', 1, 'c', '33');
INSERT INTO EMPLOYEE_0058(Fname, Minit, Lname, Ssn, Bdate, Emp_address, Sex, Salary, Super_ssn, Dno) VALUES('d', 'd', 'd', 'd', '1980-01-01', 'home', 'F', 1, 'd', '44');
INSERT INTO EMPLOYEE_0058(Fname, Minit, Lname, Ssn, Bdate, Emp_address, Sex, Salary, Super_ssn, Dno) VALUES('e', 'e', 'e', 'e', '1980-01-01', 'home', 'F', 1, 'e', '55');

INSERT INTO DEPT_LOCATIONS_0058(Dlocation, Dnumber) VALUES('aaa', '11');
INSERT INTO DEPT_LOCATIONS_0058(Dlocation, Dnumber) VALUES('bbb', '22');
INSERT INTO DEPT_LOCATIONS_0058(Dlocation, Dnumber) VALUES('ccc', '33');
INSERT INTO DEPT_LOCATIONS_0058(Dlocation, Dnumber) VALUES('ddd', '44');
INSERT INTO DEPT_LOCATIONS_0058(Dlocation, Dnumber) VALUES('eee', '55');

INSERT INTO PROJECT_0058(Pname, Pnumber, Plocation, Dnum) VALUES('Z', '1', 'aaa', '11');
INSERT INTO PROJECT_0058(Pname, Pnumber, Plocation, Dnum) VALUES('Y', '2', 'bbb', '22');
INSERT INTO PROJECT_0058(Pname, Pnumber, Plocation, Dnum) VALUES('X', '3', 'ccc', '33');
INSERT INTO PROJECT_0058(Pname, Pnumber, Plocation, Dnum) VALUES('W', '4', 'ddd', '44');
INSERT INTO PROJECT_0058(Pname, Pnumber, Plocation, Dnum) VALUES('V', '5', 'eee', '55');

INSERT INTO WORKS_ON_0058(Essn, Pno, P_Hours) VALUES('a', '1', 1);
INSERT INTO WORKS_ON_0058(Essn, Pno, P_Hours) VALUES('b', '2', 2);
INSERT INTO WORKS_ON_0058(Essn, Pno, P_Hours) VALUES('c', '3', 3);
INSERT INTO WORKS_ON_0058(Essn, Pno, P_Hours) VALUES('d', '4', 4);
INSERT INTO WORKS_ON_0058(Essn, Pno, P_Hours) VALUES('e', '5', 5);

INSERT INTO DEPENDENT_0058(Dependent_name, Sex, Bdate, Relationship, Essn) VALUES('a', 'M', '1980-01-01', 'parent', 'a');
INSERT INTO DEPENDENT_0058(Dependent_name, Sex, Bdate, Relationship, Essn) VALUES('b', 'M', '1980-01-01', 'son', 'b');
INSERT INTO DEPENDENT_0058(Dependent_name, Sex, Bdate, Relationship, Essn) VALUES('c', 'M', '1980-01-01', 'parent', 'c');
INSERT INTO DEPENDENT_0058(Dependent_name, Sex, Bdate, Relationship, Essn) VALUES('d', 'M', '1980-01-01', 'daughter', 'd');
INSERT INTO DEPENDENT_0058(Dependent_name, Sex, Bdate, Relationship, Essn) VALUES('e', 'M', '1980-01-01', 'parent', 'e');

SELECT * FROM DEPARTMENT_0058;
SELECT * FROM EMPLOYEE_0058;
SELECT * FROM DEPT_LOCATIONS_0058;
SELECT * FROM PROJECT_0058;
SELECT * FROM WORKS_ON_0058;
SELECT * FROM DEPENDENT_0058;

-- Question 2a

\d
DROP TABLE WORKS_ON_0058; -- change table name
\d

SELECT * FROM PROJECT_0058;
TRUNCATE TABLE PROJECT_0058; -- change here too
SELECT * FROM PROJECT_0058;

-- Question 2b

CREATE VIEW EMP_PARENT_0058 AS SELECT * FROM DEPENDENT_0058 WHERE Relationship='parent'; 
SELECT * FROM EMP_PARENT_0058;
DROP VIEW EMP_PARENT_0058;

-- Question 2c

CREATE USER user1_0058 WITH PASSWORD 'anan' CREATEDB;
CREATE USER user2_0058 WITH PASSWORD 'anana' CREATEDB;
CREATE USER user3_0058 WITH PASSWORD 'ananan' CREATEDB;
CREATE USER user4_0058 WITH PASSWORD 'ananana' CREATEDB;

GRANT SELECT ON EMPLOYEE_0058 TO user1_0058;
GRANT ALTER ON DEPARTMENT_0058 TO user2_0058;
GRANT ALL PRIVILEGES ON DATABASE week4 TO user3_0058; -- CHANGE DATABASE NAME HERE
GRANT ALTER, DELETE, UPDATE on DEPENDENT_0058, PROJECT_0058 TO user4_0058;
-- THERE IS NO ALTER PRIVILEGE, so this is part two of where i will do the cry.

-- Question 2d
ALTER TABLE EMPLOYEE_0058 ADD COLUMN JOIN_DATE DATE CHECK (JOIN_DATE > Bdate);
\d EMPLOYEE_0058;
ALTER TABLE EMPLOYEE_0058 DROP COLUMN JOIN_DATE;
\d EMPLOYEE_0058;
ALTER TABLE EMPLOYEE_0058 ADD COLUMN JOIN_DATE DATE CHECK (Bdate < JOIN_DATE - INTERVAL '21 years');
\d EMPLOYEE_0058;
