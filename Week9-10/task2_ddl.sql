drop database orders;
create database orders;

\c orders


CREATE TABLE ORDER_ITEM
(
	NAME VARCHAR(30) NOT NULL,
	QUANTITY INT ,
	ITEM_PRICE INT NOT NULL,
	PRIMARY KEY (NAME)
);

CREATE TABLE SUMMARY 
(
	ITEMS INT DEFAULT 0,
	TOTAL_PRICE INT DEFAULT 0
);

-- commands to run :
-- \i 'C:/Users/anany/Desktop/3rd Year College/DBMS Lab/Week9-10/task2_data.sql'
