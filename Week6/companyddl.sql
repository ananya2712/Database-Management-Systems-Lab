drop database company;
create database company;

\c company

CREATE TABLE 	Employee_0058
 (	Fname VARCHAR(15) NOT NULL ,
	 Minit CHAR, 
	Lname VARCHAR(15) NOT NULL, 
	Ssn CHAR(9) NOT NULL,
	Bdate DATE,
	Address	 VARCHAR(30),
	Gender CHAR,
	Salary DECIMAL(10,2),
	Super_ssn CHAR(9),
	Dno INT NOT NULL,
	PRIMARY KEY (Ssn),
	FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn)       );
	
CREATE TABLE 	DEPARTMENT_0058
 (	Dname VARCHAR(15)  NOT NULL,
	Dnumber INT NOT NULL, 
	Mgr_ssn CHAR(9) NOT NULL,
	Mgr_start_date DATE,
	PRIMARY KEY (Dnumber),
	UNIQUE (Dname),
	FOREIGN KEY (Mgr_ssn) REFERENCES  EMPLOYEE(Ssn)	);
	
CREATE TABLE 	DEPT_LOCATIONS_0058
 (	Dnumber INT NOT NULL, 
	Dlocation VARCHAR(15) NOT NULL,
	PRIMARY KEY (Dnumber, Dlocation),
	FOREIGN KEY (Dnumber) REFERENCES  DEPARTMENT(Dnumber)	);


CREATE TABLE 	PROJECT_0058
 (	Pname VARCHAR(15)  NOT NULL,
	Pnumber INT NOT NULL, 
	Plocation VARCHAR(15) ,
              Dnum INT NOT NULL,
	PRIMARY KEY (Pnumber),
	UNIQUE(Pname),
	FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)	);


CREATE TABLE 	WORKS_ON_0058
 (	Essn CHAR(9) NOT NULL,
	Pno INT NOT NULL, 
	Hours DECIMAL(3,1) NOT NULL,
	PRIMARY KEY (Essn, Pno),
	FOREIGN KEY (Essn) REFERENCES  EMPLOYEE(Ssn)	,
	FOREIGN KEY(Pno) REFERENCES PROJECT(Pnumber)	);

CREATE TABLE 	DEPENDENT_0058
 (	Essn CHAR(9) NOT NULL,
	Dependent_name VARCHAR(15) NOT NULL,
	Gender CHAR,
	Bdate DATE,
	Relationship VARCHAR(8),
	PRIMARY KEY (Essn, Dependent_name),
	FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn));

--Add the following constraint after the data values have been entered into the tables.
Alter Table EMPLOYEE Add Constraint FKEY_Dno FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber);

