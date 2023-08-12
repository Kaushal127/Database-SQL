-- SUB QUERY 

-- Q = Find products that have same product linr as of "1917 grand touring sedan"
SELECT productName 
FROM products
WHERE productLine = 
      (SELECT productLine
      FROM products
      WHERE productName = "1917 Grand Touring Sedan") ;
      
-- Q = Find cars that are costlier than "1936 Mercedes Benz 500k Roadster"      

SELECT *
FROM products
WHERE productLine regexp "car" AND MSRP > (
						SELECT MSRP
						FROM products
						WHERE productName = "1936 Mercedes Benz 500k Roadster" ) ;
                        
-- Sub Query with aggregate function
-- Q = Find all the cars costlier than avg cost of all cars 

SELECT *
FROM products
WHERE productLine regexp "car" AND MSRP > (
						SELECT AVG(MSRP)
                        FROM products
                        WHERE productLine regexp "car" ) ;
                        
 -- Sub Query vs Joins 
 -- Q : find customers who never placed orders 
 
 SELECT customerNumber 
 FROM customers 
 WHERE customerNumber NOT IN (
		SELECT distinct customerNumber
        FROM orders ) ;
        
-- Same query using joins 
SELECT customerNumber 
FROM customers 
LEFT JOIN orders USING (customerNumber)        
WHERE orderNumber IS NULL ;

-- Q : All the customer data wjo have ordered the product with product code "S18_1749"
-- JOIN is preferred in this 

SELECT *
FROM customers
WHERE customerNumber IN (
		SELECT customerNumber
        FROM orderdetails
        JOIN orders USING (orderNumber) 
        WHERE productCode ="S18_1749");
        
 -- USING joins 
 
 SELECT DISTINCT *
 from customers
 JOIN orders USING (customerNumber)
 JOIN orderdetails USING (orderNumber)
 WHERE productCode="S18_1749" ;

