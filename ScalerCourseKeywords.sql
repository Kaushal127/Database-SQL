-- ALL keyword 

-- Q : Find products costlier than all trucks 
-- we can use MAX Or ALL 
-- Using MAX 

SELECT * 
FROM products 
WHERE MSRP > (
		SELECT MAX(MSRP)
        FROM products
        WHERE productLine REGEXP "trucks");

-- Using All keyword
SELECT * 
FROM products 
WHERE MSRP > ALL (
		SELECT MSRP
        FROM products
        WHERE productLine REGEXP "trucks");
        
-- ANY keyword 
-- Q : select cleints who have made atleast two payments 
-- This can be done using ANY or IN 
-- Using IN 
SELECT *
FROM customers
WHERE customerNumber IN (
			SELECT customerNumber
			FROM payments
			GROUP BY customerNumber
			HAVING COUNT(*) >= 2 
		) ; 

-- Using  ANY 
SELECT *
FROM customers
WHERE customerNumber = ANY (
			SELECT customerNumber
			FROM payments
			GROUP BY customerNumber
			HAVING COUNT(*) >= 2 
		) ; 
-- Corelated SubQuery        
-- Q : Find products whose price are higher than avg MSRP in their corresponding product line 

SELECT *
FROM products p
WHERE MSRP > (
		SELECT AVG(MSRP)
		FROM products
		WHERE productLine = p.productLine
	) ;

-- EXISTS operator
-- Q = Select customers who have made any payment 

-- This might be written in two way 
SELECT *
FROM customers
WHERE customerNumber IN (
		SELECT DISTINCT customerNumber
        FROm payments 
	) ;
    
-- Using EXISTS operator
SELECT *
FROM customers c
WHERE EXISTS ( -- return true as soon as customer is found in payment table
		SELECT customerNumber
        FROM payments
        WHERE customerNumber = c.customerNumber
	);
    
-- Subquery in select clause view of payments table.
-- Q = Write query to create the following view of payment table 
-- add 2 columns as avgPayment as avg og all amount and differnce as diffrence between amount and avg amount

SELECT * ,
	   -- create avgPayment row
       (SELECT AVG(amount) FROM payments) AS avgPayment ,
        amount - (SELECT avgPayment) AS Difference
 FROm payments ;  
 
-- SubQuery in FROM  clause
-- Q= Same query as above with difference > 0 What we can do we will return table as subquery And given a name to that is mendatory

SELECT * 
FROM (
		SELECT * ,
		(SELECT AVG(amount) FROM payments) AS avgPayment ,
		amount - (SELECT avgPayment) AS Difference
		FROm payments
	) AS InvoiceSummary -- Alais is mendatory in that case 
WHERE Difference > 0 ;    
