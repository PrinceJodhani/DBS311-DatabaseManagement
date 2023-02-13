select count(*) as "Number of tables" from tab;

SELECT * FROM contacts ORDER BY contact_id DESC;
SELECT * FROM countries ORDER BY country_id DESC;
SELECT * FROM customers ORDER BY customer_id DESC;
SELECT * FROM employees ORDER BY employee_id DESC;
SELECT * FROM inventories ORDER BY product_id DESC;
SELECT * FROM locations ORDER BY location_id DESC;
SELECT * FROM order_items ORDER BY item_id DESC;
SELECT * FROM orders ORDER BY order_id DESC;
SELECT * FROM product_categories ORDER BY category_id DESC;
SELECT * FROM products ORDER BY product_id DESC;
SELECT * FROM regions ORDER BY region_id DESC;
SELECT * FROM warehouses ORDER BY warehouse_id DESC;



SELECT DISTINCT credit_limit FROM customers;


INSERT INTO employees VALUES (121,'Prince','Jodhani','pdjodhani@myseneca.ca','8780906333','16-JAN-22',NULL,'Stock Manager');
INSERT INTO employees VALUES (122,'Rohan','kapadiya','rskapadiya@myseneca.ca','7567302437','15-JAN-22',NULL,'Stock Manager');

SELECT * FROM employees where employee_id IN (121,122);

CREATE TABLE TESTEMPLOYEE AS (SELECT * FROM employees WHERE 1=2);

drop table testemployee;
SELECT * FROM testemployee;

INSERT INTO testemployee SELECT * FROM employees;

