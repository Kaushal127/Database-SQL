-- DATA aggeregation

-- Summarising data 
-- Aggeregate functions in MySQL
-- MAX()  --> Max of all value
-- MIN()  --> Min of all value
-- AVG()  --> Avg of all value
-- SUM()  --> Sum of all value
-- COUNT()  --> count all non null value

SELECT MAX(amount) AS "High Payment" ,
	   MIN(amount) AS "Low Payment" ,
       AVG(amount) AS "Avg Payment" ,
       SUM(amount) AS "Total Payment" ,
       count(*) AS "Total rows"
FROM payments ;

-- Aggeregate function on strings and dates can be applied 

SELECT MAX(paymentDate) ,
		MIN(paymentDate)
FROM payments ;

SELECT MAX(checkNumber) ,
	   MIN(checkNumber)
FROM payments ;

-- Group By clause 
-- Q : no of products in each product line 

SELECT productLine ,
		COUNT(*) AS productCount 
FROM products
  GROUP BY productLine ;
  
-- Count of employee display office code , location that work in the same office 

SELECT officeCode ,
	   city ,
	   state ,
	   COUNT(employeeNumber) AS employeeCount
FROM employees 
JOIN offices USING (officeCode) 
GROUP BY officeCode , city , state ; 

-- HAVING clause 
-- Q : In the above if we have to filter out emplyeecount more than 4 

SELECT officeCode ,
	   city ,
	   COUNT(employeeNumber) AS employeeCount
FROM employees 
JOIN offices USING (officeCode) 
GROUP BY officeCode , city  
HAVING employeeCount > 4 ;

-- In the backend how it works
--           FROM --> WHERE --> GROUP BY --> HAVING --> SELECT --> DISTINCT --> ORDER BY --> LIMIT   
-- it select from table  (FROM)
-- then filtering (WHERE)
-- then grouping (GROUP BY)
-- then another level of filtering (HAVING)
-- then Select column (SELECT)
-- then Distinct it (DISTINCT) 
-- then sorting (ORDER BY) 
-- then puts limit (LIMIT)

-- Q : count countrywise orders display orders > 20 from france japan USA and finland

SELECT country ,
		COUNT(*) AS totalOrder  
FROM orders 
JOIN customers USING (customerNumber)  
  WHERE country IN ("france" , "japan" , "USA" , "Finland") 
 GROUP BY country
 HAVING totalOrder>20 ;