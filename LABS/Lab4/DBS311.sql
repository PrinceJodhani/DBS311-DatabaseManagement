SELECT last_name,employee_id,hire_date FROM employees 
WHERE employee_id > (SELECT employee_id FROM employees WHERE last_name = 'Dunn')
AND
hire_date > (SELECT hire_date FROM employees WHERE employee_id = 10);

SELECT name, customer_id, credit_limit FROM customers
WHERE customer_id > (SELECT customer_id FROM customers WHERE name = 'Facebook')
AND
credit_limit < (SELECT credit_limit FROM customers WHERE name = 'United Continental Holdings');


SELECT name, customer_id, credit_limit FROM customers 
WHERE credit_limit = (SELECT MAX(credit_limit) FROM customers);


SELECT order_id, customer_id, order_date FROM orders
WHERE order_date > (SELECT MIN(order_date) FROM orders)
AND
order_date < (SELECT order_date FROM orders WHERE order_id = 77);


SELECT customer_id, MIN(order_date) FROM orders
WHERE order_date < (SELECT MIN(order_date) FROM orders WHERE customer_id = 1)
GROUP BY customer_id;
-----------------------------------------------------------
SELECT quantity, unit_price, COUNT(*) OVER() FROM order_items
WHERE unit_price > (SELECT AVG(unit_price) FROM order_items)
GROUP BY item_id
;

SELECT SUM(quantity) AS "Quantity",AVG(unit_price) AS "Average Lowest Unit Price", COUNT(item_id) OVER() AS "Total items" FROM order_items
WHERE unit_price > (SELECT MIN(unit_price) FROM order_items)
GROUP BY item_id;