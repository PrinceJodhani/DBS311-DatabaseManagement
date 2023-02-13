UPDATE order_items SET quantity = 100 WHERE order_id BETWEEN 1 AND 10;

SELECT * FROM employees WHERE employee_id IN(121,122);

DELETE FROM employees WHERE employee_id IN(121,122);

DELETE FROM testemployee;

SELECT * FROM testemployee;


SELECT * FROM order_items INNER JOIN orders USING (order_id);

SELECT * FROM order_items INNER JOIN products USING(product_id);

SELECT * FROM order_items INNER JOIN orders ON order_items.order_id <> orders.order_id;

SELECT * FROM products INNER JOIN order_items ON order_items.product_id <> products.product_id;

