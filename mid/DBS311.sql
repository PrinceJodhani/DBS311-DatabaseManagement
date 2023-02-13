--Display each employee's name, their job title and their managers name and their job title

SELECT e.first_name || ' ' || e.last_name, e.job_title, a.first_name FROM employees e 
LEFT OUTER JOIN employees a ON e.employee_id = a.manager_id;

SELECT e.first_name || ' ' || e.last_name AS "Name", e.job_title, 
m.first_name || ' ' || m.last_name AS "Manager Name", m.job_title AS "Manager's Job"
FROM employees e
JOIN employees m
ON e.employee_id = m.manager_id;

Select * from products left outer join order_items using (product_id) where item_id is null;

--Display the product names who have the lowest list price
SELECT product_name 
FROM products 
WHERE list_price = (SELECT MIN(list_price) FROM products);

--3
--Display the country ids and the country names whose region name is either 'Europe' or 'Asia'.
SELECT country_id, country_name FROM countries 
JOIN regions r ON countries.region_id = r.region_id
WHERE UPPER(r.region_name) = 'EUROPE' OR UPPER(r.region_name) = 'ASIA';

--Display how many customers who have pending orders and display their name in descending order
SELECT COUNT(*) OVER() AS "Pending Orders", c.name FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'Pending' ORDER BY c.name DESC;

--Display the full name of contacts and their emails addresses for the customers who have maximum credit limit
SELECT first_name || ' ' || last_name, email FROM contacts
WHERE customer_id = (SELECT customer_id 
FROM customers c
WHERE c.credit_limit = (SELECT MAX(credit_limit) FROM customers));


SELECT a.first_name, a.email FROM customers c JOIN contacts a 
ON a.customer_id = c.customer_id WHERE a.customer_id = (SELECT customer_id FROM customers WHERE credit_limit = (SELECT MAX(credit_limit) From customers));

SELECT c.first_name, email FROM contacts c
JOIN customers cu
ON cu.customer_id = c.customer_id
WHERE c.customer_id = (SELECT customer_id FROM customers WHERE credit_limit = 
(SELECT MAX(credit_limit) From customers));

SELECT customer_id FROM customers c WHERE c.credit_limit = 
(SELECT MAX(c.credit_limit) From customers);

SELECT MAX(credit_limit) From customers;

--Display the position title of the employee and their full name and their hiring date in this format 'MON-DD-YYYY' and display the results sorted by the newest employee first in each job position.
SELECT job_title, first_name || ' ' || last_name AS "Full Name", TO_CHAR(hire_date,'MON DD, YYYY') AS "Date"
FROM employees 
ORDER BY hire_date DESC;

--Display each customers id and their total number of orders who ordered in the year '2017'
SELECT customer_id AS "Customer ID", COUNT(*) AS "Total Orders" 
FROM orders
WHERE lpad(order_date,2) = 17
GROUP BY customer_id;

--Display the customer name of orders who have the newest order date
SELECT c.name FROM orders o 
JOIN customers c ON
c.customer_id = o.customer_id
WHERE o.order_date = (SELECT MAX(order_date) FROM orders);

--Display the quantity and unit price of the orders whose order status is 'Shipped' and product name is 'Intel Xeon E5-2690 V4'
SELECT quantity, unit_price FROM order_items ot
JOIN orders o ON ot.order_id = o.order_id
JOIN products p ON ot.product_id = p.product_id
WHERE UPPER(o.status) = 'SHIPPED' 
AND UPPER(p.product_name) = 'INTEL XEON E5-2690 V4';


--Display each product name that is less than $200 and it is only available in US. 
--In the same query display the products category name and its availability in which 
--warehouse and its warehouse location address. Hint:Using Join not subqueries
--The final results should have the following columns
--PRODUCT_NAME,CATEGORY_NAME, WAREHOUSE_NAME, ADDRESS,CITY,STATE,POSTAL_CODE
SELECT p.product_name, pc.category_name, w.warehouse_name, l.address, l.city, l.state, l.postal_code
FROM products p 
JOIN product_categories pc
ON p.category_id = pc.category_id
JOIN warehouses w ON p.category_id = w.warehouse_id
JOIN locations l
ON w.location_id = l.location_id
WHERE p.standard_cost < 200;













