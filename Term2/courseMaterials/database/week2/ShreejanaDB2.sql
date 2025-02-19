set SERVEROUTPUT ON; -- this line is used to print the output in the console. 
                     --If it is set of OFF then it does not print the output

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL World');
    DBMS_OUTPUT.PUT_LINE('PL/SQL is easy!');
    
END;

-- IF THEN

DECLARE
    v_num1 NUMBER := 5;
    v_num2 NUMBER := 3;
    v_temp NUMBER;
BEGIN
-- if v_num1 is greater than v_num2 rearrange their values
IF v_num1 > v_num2
THEN
    v_temp := v_num1;
    v_num1 := v_num2;
    v_num2 := v_temp;
END IF;
-- display the values of v_num1 and v_num2
    DBMS_OUTPUT.PUT_LINE('v_num1 = ' || v_num1);
    DBMS_OUTPUT.PUT_LINE('v_num2 = ' || v_num2);
END;

-- IF THEN ELSE
SET SERVEROUTPUT ON;
DECLARE
    v_num Number := &sv_user_num;
BEGIN
-- test if the number provided by the user is even
IF MOD(v_num, 2) = 0
THEN
    DBMS_OUTPUT.PUT_LINE(v_num || 'is even number');
ELSE
    DBMS_OUTPUT.PUT_LINE(v_num || 'is odd number');
END IF;
END;

-- ##############################

--DECLARE
--    v_num1 NUMBER := 0;
--    v_num2 NUMBER;
--BEGIN
--    DBMS_OUTPUT.PUT_LINE('Before IF statement...');
--IF v_num1 = v_num2
--THEN

DECLARE
    v_emp_salary employees.salary%TYPE;
BEGIN
    SELECT salary INTO v_emp_salary
    FROM employees WHERE first_name = 'Neena';
END;


select * from employees where first_name = 'Neena';



DECLARE
    v_my_name VARCHAR2(20) := :Enter_name;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_my_name);
END;

BEGIN
    DBMS_OUTPUT.PUT_LINE('My name is ' || :Enter_name);
END;



select * from employees_copy;



DECLARE
    v_emp_avg_salary employees_copy.salary%TYPE;
    v_emp_count Number;
BEGIN
    SELECT avg(salary), count(*) INTO v_emp_avg_salary, v_emp_count
    FROM employees_copy;
    DBMS_OUTPUT.PUT_LINE('Average salary of ' || v_emp_count || ' employees is ' || v_emp_avg_salary);
END;
    

