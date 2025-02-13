SET SERVEROUTPUT on;






select * from Customers_321;

DESC sp_insert321;

CREATE TABLE Customers_321 (
ID INT NOT NULL,
NAME VARCHAR (20) NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR (25),
SALARY DECIMAL (18, 2),
PRIMARY KEY (ID)
);


/*create a Stored Procedures to insert data to the table.
Stored Procedure name : sp_insert789
*/
CREATE OR REPLACE PROCEDURE sp_insert321 -- procedure name with parameters
-- use of IN parameters which represents the mode and is default if not specified
    (p_id IN customers_321.id%TYPE, 
    p_name customers_321.name%TYPE,
    p_age customers_321.age%TYPE,
    p_address customers_321.address%TYPE,
    p_salary customers_321.salary%TYPE)
IS
BEGIN
    INSERT INTO customers_321(id, name, age, address, salary)
        VALUES(p_id, p_name, p_age, p_address, p_salary);
    
    DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row');
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'ID ' || p_id);
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'Name ' || p_name);
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'Age ' || p_age);
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'Address ' || p_address);
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'Salary ' || p_salary);
END;    
    
-- Invoking the procedure to insert the given set of data

BEGIN
    sp_insert321(2, 'Arshdeep', 25, 'Delhi', 15000.00);
    sp_insert321(3, 'Navpreet', 23, 'Kota', 20000.00);
    sp_insert321(4, 'Shubham', 45, 'Mumbai', 60500.00);
    sp_insert321(5, 'Satyam', 27, 'Bhopal', 85000.00);
    sp_insert321(6, 'Rahul', 35, 'MP', 45000.00);
END;
    
   
/*
Creating Store procedure for checking Loan approval criteria for customer
whose salary is >40000 and age>=35
*/ 
CREATE OR REPLACE PROCEDURE query_loan_approval_check321 -- procedure name
IS
    CURSOR customer_cursor_321 IS -- cursor declaration
        SELECT *
        FROM customers_321
        WHERE salary > 40000 and age >=35;
    -- variables declarations
    v_id customers_321.id%TYPE;
    v_name customers_321.name%TYPE;
    v_age customers_321.age%TYPE;
    v_address customers_321.address%TYPE;
    v_salary customers_321.salary%TYPE;
BEGIN
    OPEN customer_cursor_321; --  -- OPEN cursor created above
    LOOP
        -- fetch current row from cursor
        FETCH customer_cursor_321 INTO v_id, v_name, v_age, v_address, v_salary;
        -- Test for end of the cursor using %NOTFOUND
        EXIT WHEN customer_cursor_321%NOTFOUND;
        -- use of %ROWCOUNT to find the rows fetched
        DBMS_OUTPUT.PUT_LINE('Rows fetched so far ' 
            || TO_CHAR(customer_cursor_321%ROWCOUNT));
            
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_id);
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
        DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
        DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
        DBMS_OUTPUT.PUT_LINE('Loan Approved');
    END LOOP;
    CLOSE customer_cursor_321; -- close cursor
END;   
  
-- executing the loan_approval procedure invoking it  
    
BEGIN
    query_loan_approval_check321;
END;
    
  
  
  
  
  
  
  
  






    
select * from user_objects 
where object_type = 'Procedure' and object_name = 'sp_insert321';  

