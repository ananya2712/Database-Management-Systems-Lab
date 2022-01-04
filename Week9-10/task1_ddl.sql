drop database company;
create database company;

\c company

CREATE TABLE Employee
 (	Fname VARCHAR(15) NOT NULL ,
	Minit CHAR, 
	Lname VARCHAR(15) NOT NULL, 
	ID INT NOT NULL ,
	Dname VARCHAR(20) NOT NULL ,
	PRIMARY KEY (ID)
);
	
CREATE TABLE DEPARTMENT
 (	Dname VARCHAR(15)  NOT NULL,
	Dnumber INT NOT NULL , 
	PRIMARY KEY (Dname) 
);
	




