-- Invoke the query_emp procedure from another procedure 
-- Returns the employee name and salary 
DECLARE 
    v_emp_name employees.last_name%TYPE;        -- Variable declared to hold value from OUT parameter 
    v_emp_salary employees.salary%TYPE;         -- Variable declared to hold value from OUT parameter 
BEGIN 
    query_emp1(120, v_emp_name, v_emp_salary); -- 1 IN parameter and 2 OUT parameters
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_emp_name); 
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_emp_salary); 
END;