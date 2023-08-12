-- INNER JOIN 

SELECT  payments.customerNumber ,
		paymentDate ,
        amount ,
        customerName 
FROM payments 
INNER JOIN customers 
	ON payments.customerNumber=customers.customerNumber ;
    
    
-- alias to table name 
SELECT  p.customerNumber ,
		paymentDate ,
        amount ,
        customerName 
FROM payments p
INNER JOIN customers c 
	ON p.customerNumber=c.customerNumber ;
    
-- Joining Multiple table 
SELECT orderNumber,
		c.customerName ,
        o.customerNumber ,
        p.paymentDate 
FROM orders o 
JOIN customers c 
  ON o.customerNumber=c.customerNumber 
JOIN payments p 
  ON c.customerNumber=p.customerNumber ;
  
-- Self Join 

SELECT * 
FROM employees emp 
JOIN employees mgr 
  ON  emp.reportsTo=mgr.employeeNumber ; 
  
SELECT emp.employeeNumber ,
		emp.firstName ,
        emp.jobTitle ,
        mgr.firstName AS "Manager Name" ,
        mgr.jobTitle AS "Manager Title" 
FROM employees emp 
JOIN employees mgr 
  ON  emp.reportsTo=mgr.employeeNumber ; 
  
-- Implicit Join   
  
 SELECT  payments.customerNumber ,
		paymentDate ,
        amount ,
        customerName 
FROM payments 
INNER JOIN customers 
	ON payments.customerNumber=customers.customerNumber ;
    
-- Exact same as above but without using join
SELECT p.customerNumber ,
		paymentDate ,
        amount ,
        customerName 
FROM payments p , customers c
    WHERE p.customerNumber=c.customerNumber ;

-- Outer Join 

-- What orders have been placed by customers 
-- Inner join problem is we dont get customers who havent placed order 
-- Q: For every customer , show the orders that a customer has place

SELECT c.customerNumber ,
		customerName ,
        o.orderNumber 
FROM customers c 
LEFT JOIN orders o    
   ON c.customerNumber = o.customerNumber ;
   
-- Using clause 
-- If we have to join two tables using USING clause it will simply syntax for that column name of two table must be same
SELECT c.customerNumber ,
		customerName ,
        o.orderNumber 
FROM customers c 
LEFT JOIN orders o    
   USING (customerNumber) ; 
   
-- NATURAL JOIN 
-- we dont specify column name it will automitacaly detect a commom column name between two table 
-- It is not commonly used it will loose control on join condition , unexpected results

SELECT customerNumber,
		orderNumber,
        customerName
FROM orders
NATURAL JOIN customers ;  
    