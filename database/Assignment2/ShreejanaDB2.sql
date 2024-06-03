select * from user_tables;

select * from customers;

alter table customers rename to customers_term1;
alter table customers_0321 rename to customers_0321_term1;













CREATE TABLE CUSTOMER (
CUS_CODE integer,
CUS_LNAME varchar2(15),
CUS_FNAME varchar2(15),
CUS_INITIAL varchar2(1),
CUS_AREACODE varchar2(3),
CUS_PHONE varchar2(8),
CUS_BALANCE float(8)
);

INSERT INTO CUSTOMER VALUES('10010','Ramas','Alfred','A','615','844-2573','0');
INSERT INTO CUSTOMER VALUES('10011','Dunne','Leona','K','713','894-1238','0');
INSERT INTO CUSTOMER VALUES('10012','Smith','Kathy','W','615','894-2285','896.54');
INSERT INTO CUSTOMER VALUES('10013','Olowski','Paul','F','615','894-2180','1285.19');
INSERT INTO CUSTOMER VALUES('10014','Orlando','Myron','','615','222-1672','673.21');
INSERT INTO CUSTOMER VALUES('10015','O''Brian','Amy','B','713','442-3381','1014.56');
INSERT INTO CUSTOMER VALUES('10016','Brown','James','G','615','297-1228','0');
INSERT INTO CUSTOMER VALUES('10017','Williams','George','','615','290-2556','0');
INSERT INTO CUSTOMER VALUES('10018','Farriss','Anne','G','713','382-7185','0');
INSERT INTO CUSTOMER VALUES('10019','Smith','Olette','K','615','297-3809','453.98');

-- Making a copy of a table CUSTOMER with table name CUSTOMER_0321

CREATE TABLE CUSTOMER_0321 AS SELECT * FROM CUSTOMER;


-- script that use %type, select into and where clause
select * from customer;



SET SERVEROUTPUT ON; -- used to print the output in the console

DECLARE
-- variable declaration
    v_cus_firstname customer_0321.cus_fname%TYPE;
    v_cus_lastname customer_0321.cus_lname%TYPE;
    v_cus_balance customer_0321.cus_balance%TYPE;
BEGIN
-- use of select, into and where clause
    SELECT cus_fname, cus_lname, cus_balance
    INTO v_cus_firstname, v_cus_lastname, v_cus_balance
    FROM customer_0321
    WHERE cus_= 10020;
-- displaying the retrived output
    DBMS_OUTPUT.PUT_LINE(v_cus_firstname || ' ' || v_cus_lastname || 
                        ' has ' || v_cus_balance || ' balance.');

END;

DECLARE
-- variable declaration
    v_cus_balance customer_0321.cus_balance%TYPE;
BEGIN

    SELECT cus_balance
    INTO v_cus_balance
    FROM customer_0321;
-- displaying the retrived output

    DBMS_OUTPUT.PUT_LINE('Balance is: ' || v_cus_balance);

END;



DECLARE
-- variable declaration
    v_cus_balance NUMBER(10, 2);
BEGIN

    SELECT SUM(cus_balance) -- group function
    INTO v_cus_balance
    FROM customer_0321;
-- displaying the retrived output

    DBMS_OUTPUT.PUT_LINE('The total Balance of all customers is: ' 
                            || v_cus_balance);

END;












