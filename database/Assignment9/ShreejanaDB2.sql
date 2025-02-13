
-- Creating the Package Specification (inventory_pkg)
---------------------------------------------------------
CREATE OR REPLACE PACKAGE inventory_pkg AS
  -- 1.  procedure add_product to add a new product with an ID, name, and quantity
  PROCEDURE add_product(p_id IN NUMBER, p_name IN VARCHAR2, p_quantity IN NUMBER);
  
  -- 2. procedure update_quantity to update the quantity of an existing product
  PROCEDURE update_quantity(p_id IN NUMBER, p_quantity IN NUMBER);
  
  -- 3. procedure check_stock that takes a product ID as input and returns the current stock quantity

  PROCEDURE check_stock(p_id IN NUMBER, p_quantity OUT NUMBER);
  
  -- 4. procedure display_product to display a product's details by its ID
  PROCEDURE display_product(p_id IN NUMBER);
END inventory_pkg;


--  Creating the products table

CREATE TABLE products (
  product_id NUMBER PRIMARY KEY,
  product_name VARCHAR2(100),
  quantity NUMBER
);

-- Creating the Package Body
-------------------------------------------

CREATE OR REPLACE PACKAGE BODY inventory_pkg AS
  -- 1. Procedure to add a new product
  PROCEDURE add_product(p_id IN NUMBER, p_name IN VARCHAR2, p_quantity IN NUMBER) IS
  BEGIN
    INSERT INTO products (product_id, product_name, quantity)
    VALUES (p_id, p_name, p_quantity);
    DBMS_OUTPUT.PUT_LINE('Product added successfully.');
    DBMS_OUTPUT.PUT_LINE('Product ID: ' || p_id);
    DBMS_OUTPUT.PUT_LINE('Product Name: ' || p_name);
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || p_quantity);
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      DBMS_OUTPUT.PUT_LINE('Product with this ID already exists.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while adding the product.');
  END add_product;

  -- 2. Procedure to update the quantity of an existing product
  PROCEDURE update_quantity(p_id IN NUMBER, p_quantity IN NUMBER) IS
  BEGIN
    UPDATE products
    SET quantity = p_quantity
    WHERE product_id = p_id;
    
    IF SQL%ROWCOUNT = 0 THEN
      DBMS_OUTPUT.PUT_LINE('Product not found.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Quantity updated successfully.');
      DBMS_OUTPUT.PUT_LINE('Product ID: ' || p_id);
      DBMS_OUTPUT.PUT_LINE('New Quantity: ' || p_quantity);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while updating the quantity.');
  END update_quantity;

  -- 3. Procedure to check the stock quantity of a product
  PROCEDURE check_stock(p_id IN NUMBER, p_quantity OUT NUMBER) IS
  BEGIN
    SELECT quantity
    INTO p_quantity
    FROM products
    WHERE product_id = p_id;
    
    DBMS_OUTPUT.PUT_LINE('Stock check successful.');
    DBMS_OUTPUT.PUT_LINE('Product ID: ' || p_id);
    DBMS_OUTPUT.PUT_LINE('Current Quantity: ' || p_quantity);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      p_quantity := -1; -- Indicates product not found
      DBMS_OUTPUT.PUT_LINE('Product not found.');
    WHEN OTHERS THEN
      p_quantity := -2; -- Indicates an error occurred
      DBMS_OUTPUT.PUT_LINE('An error occurred while checking the stock.');
  END check_stock;

  -- 4. Procedure to display a product's details
  PROCEDURE display_product(p_id IN NUMBER) IS
    v_name products.product_name%TYPE;
    v_quantity products.quantity%TYPE;
  BEGIN
    SELECT product_name, quantity
    INTO v_name, v_quantity
    FROM products
    WHERE product_id = p_id;
    
    DBMS_OUTPUT.PUT_LINE('Product details:');
    DBMS_OUTPUT.PUT_LINE('Product ID: ' || p_id);
    DBMS_OUTPUT.PUT_LINE('Product Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_quantity);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Product not found.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while displaying the product details.');
  END display_product;

END inventory_pkg;





-- Implementation

-- Implementing the package to add the product

SET SERVEROUTPUT ON;

BEGIN
  inventory_pkg.add_product(3, 'Product 3', 150);
END;


-- Updating Quantity

BEGIN
  inventory_pkg.update_quantity(1, 150);
END;


-- Checking Stock

DECLARE
  v_quantity NUMBER;
BEGIN
  inventory_pkg.check_stock(1, v_quantity);
  DBMS_OUTPUT.PUT_LINE('Current Stock: ' || v_quantity);
END;


-- Displaying product

BEGIN
  inventory_pkg.display_product(1);
END;


-- Week 13 
-- Assignment 10


Alter table products
Rename column quantity to stock_quantity;

Alter table products
Rename column product_name to name;


select * from products;

Alter table products
add (category varchar2(50),
    price number(10,2));
    
    
Truncate table products;


--creating table with given columns
CREATE TABLE products (
  product_id NUMBER PRIMARY KEY,
  name VARCHAR2(100),
  stock_quantity NUMBER,
  category VARCHAR2(50),
  price NUMBER(10,2)
);

DESC products;

INSERT INTO products (product_id, name, stock_quantity, category, price)
VALUES (1, 'Laptop', 50, 'Electronics', 999.99);

INSERT INTO products (product_id, name, stock_quantity, category, price)
VALUES (2, 'Smartphone', 150, 'Electronics', 699.99);

INSERT INTO products (product_id, name, stock_quantity, category, price)
VALUES (3, 'Tablet', 80, 'Electronics', 399.99);

INSERT INTO products (product_id, name, stock_quantity, category, price)
VALUES (4, 'Headphones', 200, 'Accessories', 49.99);

INSERT INTO products (product_id, name, stock_quantity, category, price)
VALUES (5, 'Smartwatch', 120, 'Wearables', 199.99);

 
   
-- function to check of the product is in stock by using its product_id
CREATE OR REPLACE FUNCTION check_stock(p_product_id NUMBER) 
RETURN VARCHAR2 
IS
    v_stock_quantity NUMBER;
BEGIN
    SELECT stock_quantity
    INTO v_stock_quantity
    FROM products
    WHERE product_id = p_product_id;

    IF v_stock_quantity > 0 THEN
        RETURN 'In Stock';
    ELSE
        RETURN 'Out of Stock';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Product not found';
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END check_stock;



-- function that calculates the reorder level for a product based on 
-- sales rate and lead time
CREATE OR REPLACE FUNCTION reorder_level(p_product_id NUMBER) 
RETURN NUMBER 
IS
-- Assumtion:
--          a constant sales rate
--          a constant lead time
    v_sales_rate NUMBER := 10;  
    v_lead_time NUMBER := 5;
    v_stock_quantity NUMBER;
BEGIN
    SELECT stock_quantity
    INTO v_stock_quantity
    FROM products
    WHERE product_id = p_product_id;

    RETURN v_sales_rate * v_lead_time;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN -1; -- the product was not found
    WHEN OTHERS THEN
        RETURN -1; -- error
END reorder_level;




-- function that formats product details as a readable string
CREATE OR REPLACE FUNCTION format_product_info(p_product_id NUMBER) 
RETURN VARCHAR2 
IS
    v_product_info VARCHAR2(500);
    v_name VARCHAR2(100);
    v_category VARCHAR2(50);
    v_stock_quantity NUMBER;
    v_price NUMBER(10, 2);
BEGIN
    SELECT name, category, stock_quantity, price
    INTO v_name, v_category, v_stock_quantity, v_price
    FROM products
    WHERE product_id = p_product_id;

    v_product_info := 'Product ID: ' || p_product_id || ', Name: ' || v_name || ', Category: ' || v_category || ', Stock Quantity: ' || v_stock_quantity || ', Price: $' || v_price;
    RETURN v_product_info;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Product not found';
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END format_product_info;

-- Implementing the functions
---------------------------------
-- check and display stock status
DECLARE
    v_stock_status VARCHAR2(50);
BEGIN
    v_stock_status := check_stock(1); -- Passing product ID 1 
    DBMS_OUTPUT.PUT_LINE('Stock Status: ' || v_stock_status);
END;








-- calculate and display reorder level
DECLARE
    v_reorder_level NUMBER;
BEGIN
    v_reorder_level := reorder_level(1); -- Passing product ID 1 
    IF v_reorder_level != -1 THEN
        DBMS_OUTPUT.PUT_LINE('Reorder Level: ' || v_reorder_level);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: Could not calculate reorder level');
    END IF;
END;







-- format and display product details
DECLARE
    v_product_info VARCHAR2(500);
BEGIN
    v_product_info := format_product_info(1); -- Passing product ID 1
    DBMS_OUTPUT.PUT_LINE('Product Info: ' || v_product_info);
END;





select * from products;









