-- Q : Total payments from each customer after a certain date 

SELECT customerNumber ,
		customerName ,
	    SUM(amount) AS totalSum 
FROM payments 
JOIN customers USING (customerNumber)
WHERE paymentDate>'2004-02-02'
GROUP BY customerNumber ;

-- Q : Value of each unique order sorted by total order value 

SELECT orderNumber ,
		SUM(quantityOrdered*priceEach) AS totalOrder
FROM orderdetails
GROUP BY orderNumber
ORDER BY totalOrder DESC ;

-- Q : Value of each unique order , customer name and sorted by total order value 

SELECT orderNumber ,
		customerNumber,
		customerName ,
		SUM(quantityOrdered*priceEach) AS totalOrder
FROM orderdetails
JOIN orders o USING (orderNumber) 
JOIN customers c USING (customerNumber)
GROUP BY orderNumber
ORDER BY totalOrder DESC ;

-- Q : Value of each unique order , customer number , customer name and sales employee sorted by total order value 


SELECT orderNumber ,
		customerNumber,
		customerName ,
        employeeNumber,
        firstName ,
		SUM(quantityOrdered*priceEach) AS totalOrder
FROM orderdetails
JOIN orders o USING (orderNumber) 
JOIN customers c USING (customerNumber)
JOIN employees e ON e.employeeNumber=c.salesRepEmployeeNumber
GROUP BY orderNumber
ORDER BY totalOrder DESC ;

-- Q : Coumt of orders by each customers and sales employee 

SELECT  customerNumber ,
		customerName ,
		firstName AS "Sales Employee" ,
		COUNT(*) AS TotalOrders
FROM orders o
JOIN customers c USING (customerNumber)
JOIN employees e 
   ON c.salesRepEmployeeNumber=e.employeeNumber
GROUP BY customerNumber ;

-- Q : Number of orders for each sale representative 

SELECT  COUNT(orderNumber) AS TotalCount,
		employeeNumber ,
        firstName AS "Sales Employee" 
FROM orders
JOIN customers c USING (customerNumber)
JOIN employees e
   ON e.employeeNumber=c.salesRepEmployeeNumber
   GROUP BY employeeNumber ;
   
-- Q : Country wise count of orders on every date 

SELECT  country ,
		orderDate ,
		COUNT(*) AS totalOrders 
FROM orders
JOIN customers USING (customerNumber)
GROUP BY country , orderDate ;

-- Q : find customers whose total value > 80000 across all their orders

SELECT c.customerNumber ,
	   c.customerName ,	
		SUM(od.quantityOrdered*od.priceEach) AS totalOrderValue
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
GROUP BY 
		c.customerNumber ,
        c.customerName
HAVING totalOrderValue > 80000 ;

SELECT customerNumber ,
		customerName ,
		SUM(amount) AS totalValue 
FROM payments
JOIN customers USING (customerNumber)
GROUP BY customerNumber
HAVING totalValue>'80000'  