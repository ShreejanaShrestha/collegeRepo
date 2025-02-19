/********************************************************************** 
Example 3  
-- Parameters 
---- Communicate data between the caller and the subprogram 
---- Commonly referred to as arguments 
------ Arguments are more appropriately thought of as the actual values assigned to the parameter variables 
------ when the subprogram is called at runtime 
---- MODE: IN, OUT, IN OUT 
---- Prefix with p_

-- IN parameters 
---- IN mode is the default if no mode is specified 
---- IN parameters can only be read within the procedure 
---- IN parameters cannot be modified 
***********************************************************************/

CREATE OR REPLACE PROCEDURE add_dept_with_parms1 
    (p_dept_code IN dept.department_code%TYPE, 
    p_dept_name dept.department_name%TYPE)  -- The IN mode is the default if no mode is specified 
IS                                          -- No local variables defined between IS/BEGIN 
BEGIN 
    INSERT INTO dept(department_code, department_name) 
        VALUES(p_dept_code, p_dept_name); 
    DBMS_OUTPUT.PUT_LINE('Inserted '|| SQL%ROWCOUNT ||' row'); 
    DBMS_OUTPUT.PUT_LINE('Inserted '|| 'Department: ' || p_dept_code ); 
    DBMS_OUTPUT.PUT_LINE('Inserted '|| 'Dept Name: ' || p_dept_name ); 
END;