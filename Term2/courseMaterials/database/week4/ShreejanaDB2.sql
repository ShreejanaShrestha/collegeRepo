set SERVEROUTPUT ON

DECLARE
    v_grade CHAR(1) := :Enter_grade;
    v_appraisal VARCHAR2(20);
BEGIN
    v_appraisal :=
        CASE v_grade
            WHEN 'A' THEN 'Excellent'
            WHEN 'B' THEN 'Very Good'
            WHEN 'C' THEN 'Good'
            ELSE          'No such grade'
        END; -- End CASE with END 
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade || ' Appraisal ' || v_appraisal);
END;

-- Searched CASE

DECLARE
    v_grade CHAR(1) := 'A';
    v_appraisal VARCHAR2(20);
BEGIN
    v_appraisal :=
        CASE
            WHEN v_grade = 'A' THEN 'Excellent'
            WHEN v_grade IN ('B', 'C') THEN 'Good'
            ELSE 'No such grade'
        END;
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade ||
                         ' Appraisal ' || v_appraisal);
END;

-- BASIC LOOP
DECLARE
    v_country_id locations.country_id%TYPE := 'CA';
    v_loc_id     locations.location_id%TYPE;
    v_counter    NUMBER(2) := 1;
    v_new_city   locations.city%TYPE := 'Montreal';
BEGIN
    SELECT MAX(location_id) INTO v_loc_id FROM locations
    WHERE country_id = v_country_id;
    
    LOOP
        INSERT INTO locations(location_id, city, country_id)
        VALUES ((v_loc_id + v_counter), v_new_city, v_country_id);
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 3;
    END LOOP;
END;

select * from locations;

-- iterative control - loops

DECLARE
    v_counter BINARY_INTEGER := 0;
BEGIN
    LOOP
    -- increment loop counter by one
    v_counter := v_counter + 1;
    DBMS_OUTPUT.PUT_LINE('v_counter = '|| v_counter);
    -- if exit condition yields TRUE exit the loop
    
        IF v_counter = 5 THEN
            EXIT;
        END IF;
    END LOOP;
    -- control resumes here
    DBMS_OUTPUT.PUT_LINE('Done...');
END;

-- ######## other way using condition in when after EXIT ######

DECLARE
    v_counter BINARY_INTEGER :=0;
BEGIN
    LOOP
    -- increment loop counter by one
        v_counter := v_counter +1;
        DBMS_OUTPUT.PUT_LINE('v_counter = ' || v_counter);
        -- if exit condition yields TRUE exit the loop
        EXIT WHEN v_counter = 5;

    END LOOP;
    -- control resumes here
    DBMS_OUTPUT.PUT_LINE('Done...');
END;


-- ##### WHILE LOOP #####
SET SERVEROUTPUT ON SIZE 1000000

DECLARE
    v_counter NUMBER := 4;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Start');
    WHILE v_counter <= 5
    LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = ' || v_counter);
        -- decrement the value of v_counter by one
        v_counter := v_counter - 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Done');
END;

-- ##### Numeric For loop ######

BEGIN
    FOR v_counter IN 1..5
    LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = ' || v_counter);
    END LOOP;
END;


BEGIN
    FOR v_counter IN 1..5
    LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = ' || v_counter);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Counter outside the loop is ' || v_counter);
END;


BEGIN
    FOR v_counter IN REVERSE 1..5
    LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = ' || v_counter);
    END LOOP;
END;


BEGIN
    FOR v_counter IN 1..5
    LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = ' || v_counter);
        EXIT WHEN v_counter = 3;
    END LOOP;
END;


----- NESTED LOOP --------
DECLARE
    v_counter1 BINARY_INTEGER := 0;
    v_counter2 BINARY_INTEGER;
BEGIN
    WHILE v_counter1 < 3
    LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter1: ' || v_counter1);
        v_counter2 := 0;
        LOOP
            DBMS_OUTPUT.PUT_LINE('v_counter2: ' || v_counter2);
            v_counter2 := v_counter2 + 1;
            EXIT WHEN v_counter2 >= 2;
        END LOOP;
        v_counter1 := v_counter1 + 1;
    END LOOP;       
END;

DECLARE
    v_counter NUMBER := 1;
BEGIN
    WHILE v_counter < 5
    LOOP
        DBMS_OUTPUT.PUT_LINE('v_counter = ' || v_counter);
        -- decrement the value of v_counter by one
        v_counter := v_counter -1;
    END LOOP;
END;






--------------CURSOR----------------

DECLARE
    v_employee_name   CHARACTER(20);
    v_salary          employees.salary%TYPE;
    C_H1              CHAR(31) := 'Employee name         Salary';
    C_H1_UL           CHAR(31) := '-------------         -------';
    
    CURSOR v_salaries_cursor IS
        SELECT first_name || ' ' || last_name as employee_name, salary
        FROM employees
        WHERE department_id = :Enter_department; -- Try 90
        
BEGIN
    DBMS_OUTPUT.PUT_LINE(C_H1);
    DBMS_OUTPUT.PUT_LINE(C_H1_UL);
    DBMS_OUTPUT.NEW_LINE;
    OPEN v_salaries_cursor;                     -- OPEN cursor
    LOOP
        FETCH v_salaries_cursor
            INTO v_employee_name, v_salary;
        EXIT WHEN v_salaries_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(RPAD(v_employee_name, 20) || TO_CHAR(v_salary, '99999.99'));
    END LOOP;
    CLOSE v_salaries_cursor;
END;

select * from employees