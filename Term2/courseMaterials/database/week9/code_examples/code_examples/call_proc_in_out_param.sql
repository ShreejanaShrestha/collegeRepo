-- Invoke the format_phone procedure from another procedure 
-- Returns formatted phone number 
DECLARE 
    v_phone_no VARCHAR2(13); 
BEGIN 
    v_phone_no := '8006330575' ; 
    format_phone1 (v_phone_no); 
    DBMS_OUTPUT.PUT_LINE('The formatted phone number is: ' || v_phone_no); 
END;