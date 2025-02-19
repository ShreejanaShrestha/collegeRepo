/********************************************************************** 
Example 1 -- Procedure with no parameters (parameters are optional) 
-- Body is the same as an anonymous block 
-- The declarative section of a procedure starts immediately after the procedure declaration (IS) 
-- and does not begin with the keyword DECLARE 
***********************************************************************/
CREATE OR REPLACE PROCEDURE add_dept1           -- Mandatory -- Procedure name 
IS                                              -- Mandatory – Followed by local variables and constants 
    v_dept_code dept.department_code%TYPE;      -- DECLARE not used - Local variables and constants 
    v_dept_name dept.department_name%TYPE; 
BEGIN -- Mandatory 
    v_dept_code := 15; 
    v_dept_name := 'ST-Curriculum'; 
    INSERT INTO dept(department_code, department_name) 
        VALUES(v_dept_code, v_dept_name); 
    DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row'); 
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'Department: ' || v_dept_code ); 
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'Dept Name: ' || v_dept_name ); 
END; -- Mandatory