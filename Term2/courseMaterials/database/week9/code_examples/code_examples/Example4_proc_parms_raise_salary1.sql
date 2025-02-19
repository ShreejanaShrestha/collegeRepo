/******************************************* 
Example 4 
-- IN parameters 
*******************************************/

CREATE OR REPLACE PROCEDURE raise_salary1 
    (p_id IN my_employees.employee_id%TYPE, 
    p_percent IN NUMBER) 
IS 
    v_old_salary my_employees.salary%TYPE; -- Local variable 
    v_new_salary my_employees.salary%TYPE; -- Local variable 
BEGIN 
    SELECT salary INTO v_old_salary 
        FROM my_employees 
        WHERE employee_id = p_id; 
    v_new_salary := v_old_salary * (1 + p_percent/100); 
    UPDATE my_employees 
        SET salary = v_new_salary 
        WHERE employee_id = p_id; 
    DBMS_OUTPUT.PUT_LINE('Old salary for employee ' || p_id || ' is ' || TO_CHAR( v_old_salary, '$99,999.99' ) ); 
    DBMS_OUTPUT.PUT_LINE('Increase percent is ' || p_percent || '%'); 
    DBMS_OUTPUT.PUT_LINE('New salary for employee ' || p_id || ' is ' || TO_CHAR( v_new_salary, '$99,999.99' ) ); 
    DBMS_OUTPUT.NEW_LINE(); 
END raise_salary1;