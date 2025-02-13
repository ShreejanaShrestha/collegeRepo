CREATE TABLE dept(
    deptno number(2,0),
    dname  varchar2(14),
    loc    varchar2(13),
    constraint pk_dept primary key (deptno)
)


CREATE TABLE emp(
    empno    number(4,0),
    ename    varchar2(10),
    job      varchar2(9),
    mgr      number(4,0),
    hiredate date,
    sal      number(7,2),
    comm     number(7,2),
    deptno   number(2,0),
    constraint pk_emp primary key (empno),
    constraint fk_deptno foreign key (deptno) references dept (deptno)
)

select * from emp;
select * from dept;
select * from user_tables;

select * from employees;


-- (Practical Exercise #4)
drop table employees;

-- creating EMPLOYEES table from the provided script 

CREATE TABLE employees
(  employee_id      NUMERIC(3)   NOT NULL,
   first_name       VARCHAR(20),
   middle_initial   VARCHAR(1),
   last_name        VARCHAR(30),
   soc_sec_no       NUMERIC(9),
   hire_date        DATE,
   salary           DECIMAL(7,2),
   commission_pct   DECIMAL(3,3), 
   department_code  VARCHAR(2),
   job_code         VARCHAR(7),
   manager_id       NUMERIC(3)
)

-- Populating the employees table with the insert statements

INSERT INTO employees VALUES ( 110, 'Lauren', 'M', 'Alexander', 749583756, DEFAULT, 45000, NULL,    'TR', 'DT_MGR', NULL );
INSERT INTO employees VALUES ( 111, 'Lisa',   'L', 'James',     396812058, DEFAULT, 65000, NULL,    'MA', 'DT_MGR', NULL );
INSERT INTO employees VALUES ( 112, 'Dave',   ' ', 'Bernard',   184759364, DEFAULT, 60000, NULL,    'HT', 'DT_MGR', NULL );
INSERT INTO employees VALUES ( 113, 'Steve',  'L', 'Carr',      018593745, DEFAULT, 55000, NULL,    'VG', 'DT_MGR', NULL );
INSERT INTO employees VALUES ( 114, 'Marg',   'A', 'Horner',    947581253, DEFAULT, 45000, NULL,    'MA', 'DT_MGR', 111  );
INSERT INTO employees VALUES ( 124, 'Scott',  ' ', 'Long',      912058121, DEFAULT, 35000, DEFAULT, 'VG', 'SL_ACE', 113  );
INSERT INTO employees VALUES ( 115, 'Jim',    ' ', 'Best',      184629673, DEFAULT, 24000, DEFAULT, 'SA', 'SL_ACE', NULL );
INSERT INTO employees VALUES ( 126, 'Sue',    'A', 'McDonald',  285912756, DEFAULT, 36000, DEFAULT, 'TR', 'SL_ACE', 110  );
INSERT INTO employees VALUES ( 117, 'Trish',  'S', 'Albert',    649105738, DEFAULT, 18000, DEFAULT, 'VG', 'SL_ACE', 113  );
INSERT INTO employees VALUES ( 125, 'Terry',  'J', 'Maxwell',   385937712, DEFAULT, 22000, DEFAULT, 'HT', 'SL_ACE', 112  );
INSERT INTO employees VALUES ( 119, 'Dave',   ' ', 'Nisbet',    759127547, DEFAULT, 39000, DEFAULT, 'TR', 'SL_ACE', 110  );
INSERT INTO employees VALUES ( 120, 'Anne',   'M', 'Richie',    834577193, DEFAULT, 40000, DEFAULT, 'MA', 'SL_ACE', 111  );
INSERT INTO employees VALUES ( 122, 'Jake',   'L', 'Lee',       812954926, DEFAULT, 45000, DEFAULT, 'VG', 'SL_ACE', 113  );
INSERT INTO employees VALUES ( 118, 'Janice', 'B', 'Harper',    912758396, DEFAULT, 29000, DEFAULT, 'HT', 'SL_ACE', 112  );
INSERT INTO employees VALUES ( 123, 'Linda',  'M', 'Johnson',   295734812, DEFAULT, 24000, DEFAULT, 'MA', 'SL_ACE', 114  );
INSERT INTO employees VALUES ( 121, 'William','J', 'Johnson',   374912745, DEFAULT, 31000, DEFAULT, 'TR', 'SL_ACE', 110  );
INSERT INTO employees VALUES ( 127, 'Sharron',' ', 'Evans',     492337745, DEFAULT, 29000, DEFAULT, 'MA', 'SL_ACE', 114  );
INSERT INTO employees VALUES ( 116, 'Robert', ' ', 'Henry',     512850475, DEFAULT, 37000, DEFAULT, 'MA', 'SL_ACE', 111  );	  
INSERT INTO employees VALUES ( 131, 'Barb',   'L', 'Gibbens',   852951124, DEFAULT, 29000, DEFAULT, 'IT', 'IT_DEV', NULL );
INSERT INTO employees VALUES ( 135, 'Greg',   'J', 'Zimmerman', 539554832, DEFAULT, 31500, DEFAULT, 'IT', 'IT_DEV', NULL );
INSERT INTO employees VALUES ( 132, 'Dave',   'R', 'Bernard',   284447883, DEFAULT, 24000, DEFAULT, 'IT', 'IT_DEV', NULL );
INSERT INTO employees VALUES ( 136, 'Trish',  'S', 'Albert',    812740127, DEFAULT, 22500, DEFAULT, 'IT', 'IT_DEV', NULL );


select * from employees;


-- QUESTION 1
------------------------------------------------------------
-- (a) PL/SQL Cursor to retrieve the following information.
-- * Fetch row number, Employee Id, First Name of the employees
-- * Select all the employees with Employee_no < 115
-- * Use the complete cycle of declaring, opening, fetching, and closing a
--   cursor, including use of cursor attributes.

set SERVEROUTPUT ON

DECLARE
-- Cursor declaration
    CURSOR emp_cursor_0321 IS
        SELECT employee_id, first_name
        FROM employees
        WHERE  employee_id < 115;
    v_emp_record_0321        emp_cursor_0321%ROWTYPE;
    
BEGIN
-- Open the cursor created above
    OPEN emp_cursor_0321;
    LOOP
    -- Fetch current row from cursor into v_emp_record_0321
        FETCH emp_cursor_0321 INTO v_emp_record_0321;
        -- Test for end of the cursor using %NOTFOUND
        EXIT WHEN emp_cursor_0321%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Just FETCHED row ' 
             || emp_cursor_0321%ROWCOUNT || ' - Employee ID: ' 
             || v_emp_record_0321.employee_id ||  ' - First Name: ' 
             || v_emp_record_0321.first_name);
    END LOOP;
    CLOSE emp_cursor_0321; -- Close Cursor
END;





-- QUESTION 2
-----------------------------------------------------
-- Modification to above program to use the CURSOR FOR LOOP to achieve 4
-- the same output

DECLARE
    CURSOR emp_cursor_0321 IS
        SELECT employee_id, first_name
        FROM employees
        WHERE  employee_id < 115;
    
BEGIN
    FOR v_emp_record IN emp_cursor_0321
        LOOP
            DBMS_OUTPUT.PUT_LINE('Just FETCHED row ' 
                     || emp_cursor_0321%ROWCOUNT || ' - Employee ID: ' 
                     || v_emp_record.employee_id ||  ' - First Name: ' 
                     || v_emp_record.first_name);
        END LOOP;
END;


