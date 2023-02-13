select first_name, TO_CHAR(hire_date, 'dd-mon-yy') AS "HIRE DATE"  from employees;

SELECT first_name||' '||last_name AS FULLNAME, TO_NUMBER(SYSDATE
- hire_date) / 7 AS WEEKS
FROM employees;



SELECT order_id, order_date + 30 AS "Next Order Date", order_date AS "Previous Order Date"  FROM orders;


SELECT country_name 
FROM countries 
WHERE 
UPPER(COUNTRY_NAME) LIKE 'I%';

SELECT ROUND(unit_price), TRUNC(unit_price), FLOOR(unit_price) 
FROM order_items;


SELECT LPAD(region_name,4) FROM regions;

SELECT SUBSTR(first_name,3) AS FirstName, SUBSTR(last_name,3) AS LatsName FROM employees;

SELECT NEXT_DAY(order_date,'SUNDAY') AS SUNDAYS, LAST_DAY(order_date) AS LASTDATE 
FROM orders;

SELECT email, hire_date, ADD_MONTHS(hire_date,3) FROM employees;

SELECT email, hire_date, MONTHS_BETWEEN
(TO_DATE(sysdate,'YY-MM-DD'),
TO_DATE(hire_date,'YY-MM-DD')) AS "MONTHS" 
FROM employees;

SELECT LOWER(job_title) AS "Lower",
UPPER(first_name) AS "upper",
INITCAP(email) AS "Initcap"
FROM employees
WHERE manager_id = 2;



