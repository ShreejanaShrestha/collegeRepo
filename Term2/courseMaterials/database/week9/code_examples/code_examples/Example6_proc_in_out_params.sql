/******************************************* 
Example 6 
-- IN & OUT parameters 
*******************************************/

CREATE OR REPLACE PROCEDURE query_emp1 
    (p_id IN employees.employee_id%TYPE, 
    p_name OUT employees.last_name%TYPE, 
    p_salary OUT employees.salary%TYPE) 
IS 
BEGIN 
    SELECT last_name, salary 
        INTO p_name, p_salary 
        FROM employees 
        WHERE employee_id = p_id;
END query_emp1;