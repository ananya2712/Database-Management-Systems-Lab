-- Question 1 : Create an employee table which contains employee details and the department he works for.
--Create another table department consisting of dname and number of employees. Write triggers
--to increment or decrement the number of employees in a department table when the record in
--the employee table is inserted or deleted respectively. 

CREATE FUNCTION INCREASE() returns trigger
    language plpgsql
    as 
    $$ 
    begin 
    update DEPARTMENT SET DNUMBER = DNUMBER + 1
    WHERE Dname = NEW.Dname;
        return NEW;
    end;
    $$;    

CREATE TRIGGER increment
    AFTER INSERT 
    ON EMPLOYEE
    FOR EACH ROW
    EXECUTE PROCEDURE INCREASE();
    
-- commands to test
SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
INSERT into EMPLOYEE values ('Ananya','M','Uppal', '888661234','Research'); 
SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;