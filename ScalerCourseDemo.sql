USE classicmodels ;

-- select all column 
select * FROM employees WHERE officeCode=1 ORDER BY firstName ;

-- select few column
select firstName , lastName FROM employees WHERE officeCode=1 ORDER BY firstName ;

-- clause
SELECT productCode ,
	   productName ,
       buyPrice ,
       MSRP AS "selling price" 
  FROM products ;  
  -- inorder to rename column and use airthmatic operations on column for eg to give discount 
  SELECT productCode ,
	   productName ,
       buyPrice ,
       MSRP AS "selling price" ,
       (MSRP*0.90) AS "discounted price"
  FROM products ;
  
  -- Where clause
  SELECT *
  FROM payments 
  WHERE amount > "40000" ;
  
  -- Logical Operator
    SELECT *
  FROM payments 
  WHERE (amount <= 40000 OR amount >= 60000 ) AND paymentDate = '2003-06-05'  ;
  
  
  -- IN operator 
  -- Q = If we have to select employee which are coming from ofiicecodes 1 , 2 , 4
  
  SELECT *
  FROM employees
  WHERE officeCode IN (1,2,4) 
  ORDER BY officeCode ;
  
  -- BETWEEN operator
  
  SELECT *
  FROM customers 
  WHERE creditLimit BETWEEN 20000 AND 40000 ;
  
  
  -- LIKE operator 
  
  SELECT *
  FROM employees 
  WHERE jobTitle LIKE "%sale%" ;
  
   SELECT *
  FROM employees 
  WHERE jobTitle LIKE "sale%" ;
  
   SELECT *
  FROM employees 
  WHERE jobTitle LIKE "sale_____" ;
  
  
-- Regular expression operator 
-- ^ beginning of string 
-- $ end of string 
-- | logical or 
-- [abcd] 
-- [a-d] in  the range from a to d

SELECT *
FROM employees 
WHERE firstName REGEXP "^[a-h]|lie$" ;

-- IS NULL operator 
SELECT * 
FROM customers 
WHERE state IS NULL ;
