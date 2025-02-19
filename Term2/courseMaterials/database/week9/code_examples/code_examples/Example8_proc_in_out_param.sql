/******************************************* 
Example 8 
-- IN/OUT parameter 
-- Send value IN and OUT via the same parameter 
*******************************************/ 
CREATE OR REPLACE PROCEDURE format_phone1 
    (p_phone_no IN OUT VARCHAR2) 
IS 
BEGIN 
    p_phone_no := '(' || SUBSTR(p_phone_no,1,3) || ')' || SUBSTR(p_phone_no,4,3) || '-' || SUBSTR(p_phone_no,7); 
END format_phone1;