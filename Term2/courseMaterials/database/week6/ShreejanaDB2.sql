select * from user_tables;
select * from departments;
select * from dept;
select * from employees;

CREATE TABLE departments
(  department_code VARCHAR(2)  NOT NULL,
   department_name VARCHAR(25) NOT NULL, 
   manager_id      NUMERIC(6)
)

INSERT INTO departments VALUES
('AD', 'Administration', NULL);
INSERT INTO departments VALUES
('AC', 'Accounting', NULL);
INSERT INTO departments VALUES
('MK', 'Marketing', NULL);
INSERT INTO departments VALUES
('TR', 'Training', 110);
INSERT INTO departments VALUES
('IT', 'Information Technology', NULL);
INSERT INTO departments VALUES
('CA', 'Cameras', NULL);
INSERT INTO departments VALUES
('MA', 'Major Appliances', 111);
INSERT INTO departments VALUES
('SA', 'Small Appliances', 115);
INSERT INTO departments VALUES
('OP', 'Office Products', NULL);
INSERT INTO departments VALUES
('VG', 'Video Games', 113);
INSERT INTO departments VALUES
('HT', 'Home Theatre', 112);

Set SERVEROUTPUT ON;

BEGIN
DBMS_OUTPUT.PUT_LINE('Hello');
END;


-- predefined errors
------------------------------
DECLARE
    e_insert_excep EXCEPTION;
    PRAGMA EXCEPTION_INIT
        (e_insert_excep, -01400);
BEGIN
    INSERT INTO departments
        (department_code, department_name)
        VALUES (60, NULL);
EXCEPTION
    WHEN e_insert_excep
        THEN 
            DBMS_OUTPUT.PUT_LINE('INSERT FAILED');
END;

-- user-defined exceptions
--------------------------------
DECLARE
    e_invalid_department EXCEPTION;
    v_name VARCHAR2(20) := 'Accounting';
    v_deptcode VARCHAR(20) := '27';
BEGIN
    UPDATE departments
        SET department_name = v_name
        WHERE department_code = v_deptcode;
        IF SQL%NOTFOUND THEN
            RAISE e_invalid_department;
        END IF;
        COMMIT;
    EXCEPTION
    WHEN e_invalid_department
        THEN DBMS_OUTPUT.PUT_LINE('No such department id.');
            ROLLBACK;
END;


---------------------------------
-- week 5 Exception labs
---------------------------------

select * from emp;
select * from dept;

DECLARE
    v_name varchar2(6);
BEGIN
    SELECT ename INTO v_name 
    FROM emp
    WHERE empno = 7777;
    DBMS_OUTPUT.PUT_LINE('Hello');
END;

-- the code above gives no data found error
-- now we will use exception handling here to show the message

DECLARE
    v_name varchar2(6);
BEGIN
    SELECT ename INTO v_name
    FROM emp
    WHERE empno = 9999;
    DBMS_OUTPUT.PUT_LINE('Hello');
EXCEPTION
    WHEN no_data_found 
    THEN DBMS_OUTPUT.PUT_LINE('ERROR!!!!! There is no employee with the selected id');
END;

------------------------------------
-- example 2
------------------------------------

DECLARE
    v_name varchar2(6);
    v_name1 varchar2(100);
BEGIN
    SELECT ename INTO v_name
    FROM emp
    WHERE empno = 7900;
    
    SELECT ename INTO v_name1 
    FROM emp
    WHERE deptno = 20;
    
    DBMS_OUTPIT.PUT_LINE('Hello ' || v_name || '. Your department id is: ' || v_deparment_name);
EXCEPTION
    WHEN no_data_found
        THEN DBMS_OUTPUT.PUT_LINE('There is no employee with selected id');
    WHEN too_may_rows 
        THEN DBMS_OUTPUT.PUT_LINE('There are more than one employees in this department');
END;



-- example question
--------------------------------------
select * from emp;

DECLARE
    e_insert_exception EXCEPTION;
    
    v_deptno NUMBER := 79;
    v_dname VARCHAR2(10) := 'Software';
BEGIN
    INSERT INTO dept
        (deptno, dname)
        VALUES (v_deptno, v_dname);
--EXCEPTION
--    WHEN e_insert_exception
--        THEN DBMS_OUTPUT.PUT_LINE('');

END;





-- stored procedure
------------------------
CREATE OR REPLACE PROCEDURE add_room
IS
    v_room_id room.room_id%TYPE;
    v_room_name room.room_name%TYPE;
BEGIN
    v_room_id := 101;
    v_room_name := 'Full stack';
    INSERT INTO room(room_id, room_name)
        VALUES(v_room_id, v_room_name);
    DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row');
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'Room: ' || v_room_id);
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'Room Name: ' || v_room_name);
END;

select * from user_objects where object_type = 'Procedure' and object_name = 'add_class';


-- procedure with parameters
------------------------------------

CREATE OR REPLACE PROCEDURE add_room_with_params
    (p_room_id IN room.room_id%TYPE,
     p_room_name  room.room_name%TYPE)
IS
BEGIN
    INSERT INTO room(room_id, room_name)
        VALUES(p_room_id, p_room_name);
    DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row');
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'Room: ' || p_room_id);
    DBMS_OUTPUT.PUT_LINE('Inserted ' || 'Room Name: ' || p_room_name);
END;