SELECT COUNT(customer_id) AS "Tot_Customer", SUM(credit_limit) FROM customers;

SELECT 
MIN(credit_limit) AS "Min", 
MAX(credit_limit) AS "Max", 
AVG(credit_limit) AS "Avg" 
FROM customers;

----------------------------------------------------------------------------
SELECT COUNT(distinct salesman_id),COUNT(distinct order_id) FROM orders;
----------------------------------------------------------------------------

SELECT MIN(hire_date) AS "Oldest",MAX(hire_date) AS "Newest" FROM employees;

SELECT MIN(first_name) as "First Line", MAX(first_name) as "Last Line"
FROM employees;
-------------------------------------------------------------------------------
SELECT last_name, COUNT(last_name) FROM employees GROUP BY last_name HAVING last_name LIKE 'G%';

SELECT last_name FROM employees WHERE last_name LIKE 'G%' AND COUNT(last_name LIKE '%G');

SELECT last_name, COUNT(last_name LIKE '%G')
FROM employees
WHERE last_name LIKE 'G%';

SELECT last_name FROM employees GROUP BY last_name HAVING last_name LIKE 'G%';
SELECT COUNT(DISTINCT last_name) FROM employees WHERE last_name LIKE '%G';
-----------------------------------------------------------------------

SELECT COUNT(DISTINCT salesman_id) FROM orders;
SELECT salesman_id FROM orders GROUP BY salesman_id;

SELECT item_id, AVG(unit_price) FROM order_items GROUP BY item_id ORDER BY 1;

SELECT item_id, SUM(quantity) FROM order_items GROUP BY item_id ORDER BY 1;

SELECT name, customer_id FROM customers WHERE credit_limit > 4000;