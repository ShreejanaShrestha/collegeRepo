/******************************************* 
Example 5 
-- Selecting multiple rows using a cursor 
*******************************************/ 

CREATE OR REPLACE PROCEDURE process_employees1 
IS 
    SALARY_INCREASE CONSTANT NUMBER (3,1) := 2.5;
    CURSOR emp_cursor IS 
        SELECT employee_id 
            FROM my_employees;
BEGIN 
    FOR v_emp_rec IN emp_cursor LOOP 
        raise_salary1(v_emp_rec.employee_id, SALARY_INCREASE); -- Invoke raise_salary procedure 
    END LOOP; 
    COMMIT; 
END process_employees1;