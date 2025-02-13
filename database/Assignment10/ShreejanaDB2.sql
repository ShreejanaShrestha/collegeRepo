create or replace function welcome_msgJune(p_name IN varchar2)
return varchar2
is
Begin
return('Welcome ' || p_name);
End;


set serveroutput on;
Declare
lv_msg varchar2(250);
begin
lv_msg := welcome_msgJune('Lambton college');
dbms_output.put_line(lv_msg);
end;

select welcome_msgJune ('hello Lambton College') 
from dual;


create or replace FUNCTION id_is_good
  (i_student_id IN NUMBER)
  RETURN BOOLEAN
AS
  v_id_cnt NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO v_id_cnt
    FROM student
   WHERE student_id = i_student_id;
  RETURN 1 = v_id_cnt;
EXCEPTION
  WHEN OTHERS
  THEN
    RETURN FALSE;
END id_is_good;


--  ################# script to create courses table


create table courses(
    code        VARCHAR2(6)  constraint C_PK primary key, 
    description VARCHAR2(30) constraint C_DESC_NN not null, 
    category    CHAR(3)      constraint C_CAT_NN not null, 
    duration    NUMBER(2)    constraint C_DUR_NN not null, 
    constraint  C_CODE_CHK   check (code = upper(code)), 
    constraint  C_CAT_CHK    check (category in ('GEN','BLD','DSG'))
    );


-- now insert database

insert into courses values
      ('SQL','Introduction to SQL',         'GEN',4);
insert into courses values
      ('OAU','Oracle for application users','GEN',1);
insert into courses values
      ('JAV','Java for Oracle developers',  'BLD',4);
insert into courses values
      ('PLS','Introduction to PL/SQL',      'BLD',1);
insert into courses values
      ('XML','XML for Oracle developers',   'BLD',2);
insert into courses values
      ('ERM','Data modeling with ERM',      'DSG',3);
insert into courses values
      ('PMT','Process modeling techniques', 'DSG',1);
insert into courses values
      ('RSD','Relational system design',    'DSG',2);
insert into courses values
      ('PRO','Prototyping',                 'DSG',5);
insert into courses values
      ('GEN','System generation',           'DSG',4);

alter table courses enable primary key;


DECLARE
   V_id number;
BEGIN
   V_id := &id; 
   IF id_is_good(v_id)
   THEN
      DBMS_OUTPUT.PUT_LINE
         ('Student ID: '||v_id||' is a valid.');
   ELSE
      DBMS_OUTPUT.PUT_LINE
         ('Student ID: '||v_id||' is not valid.');
   END IF;
END;

select * from student;


CREATE OR REPLACE FUNCTION show_description
(i_course_code courses.code%TYPE)
RETURN varchar2
AS
--pragma UDF;  
v_description varchar2(50);
BEGIN
    SELECT description
    INTO v_description
    FROM courses
    WHERE code = i_course_code;
RETURN v_description;
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
        RETURN('The Course is not in the database');
    WHEN OTHERS
        THEN
        RETURN('Error in running show_description');
END;


select show_description ('SQL') 
from dual;

desc products;




