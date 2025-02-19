/********************************************************************** 
Example 2 -- Invoke (execute) a procedure from an anonymous block 
-- Can invoke (execute) a procedure from: 
---- An anonymous block 
---- Another procedure 
---- A calling application 
-- CANNOT invoke a procedure from inside a SQL statement such as SELECT 
***********************************************************************/

-- Execute the ADD_DEPT procedure from an anonymous block 
BEGIN 
    add_dept1; -- Direct call to procedure 
END;