Question 1:
ALTER SESSION SET NLS_TERRITORY = 'Australia';
create or replace PROCEDURE calculate_salary (empid NUMBER)
IS
firstname  employees.first_name%type;
lastname  employees.last_name%type;
finalsal varchar(50);
base_salary NUMBER := 10000;
emp_c NUMBER := 0;
yr NUMBER := 0;
 
BEGIN
SELECT COUNT(*) INTO emp_c FROM EMPLOYEES WHERE EMPLOYEE_ID = empid;
IF emp_c > 0  THEN
    SELECT EXTRACT(YEAR FROM SYSDATE)- EXTRACT(YEAR FROM HIRE_DATE),  first_name, last_name INTO yr, firstname, lastname   
    FROM EMPLOYEES WHERE EMPLOYEE_ID = empid;

LOOP
   yr := yr - 1;
    EXIT WHEN yr = 0;
    base_salary  := base_salary + (base_salary*.05);
    END LOOP;

    SELECT TO_CHAR(base_salary , 'fmU99G999D00') INTO finalsal FROM DUAL;
   dbms_output.put_line( 'FirstName: ' || firstname );
   dbms_output.put_line( 'LastName: ' || lastname );
   dbms_output.put_line( 'Salary: ' || finalsal );

ELSE 
   dbms_output.put_line( 'Employee not found!' );
END IF;

EXCEPTION
WHEN INVALID_NUMBER THEN 
   DBMS_OUTPUT.PUT_LINE('Error!');
    ROLLBACK;
WHEN NO_DATA_FOUND THEN 
   DBMS_OUTPUT.PUT_LINE('Error!');
    ROLLBACK;
END calculate_salary;

Question 2:

create or replace PROCEDURE employee_works_here
IS
empno employees.employee_id%type;
firstname  employees.first_name%type;
lastname  employees.last_name%type;

emp_c NUMBER := 0;
yr NUMBER := 0;

BEGIN

SELECT COUNT(*) INTO emp_c FROM EMPLOYEES;
IF emp_c > 0  THEN
   dbms_output.put_line( 'Employee # ' || chr(9) || chr(9)||'Last Name: ' ||chr(9)||  'Department Name ');

LOOP
    SELECT EXTRACT(YEAR FROM SYSDATE)- EXTRACT(YEAR FROM HIRE_DATE),  first_name, last_name, EMPLOYEE_ID INTO yr, firstname, lastname ,empno 
    FROM EMPLOYEES WHERE employee_id = emp_c
    ORDER BY EMPLOYEE_ID ASC;

    EXIT WHEN emp_c = 0;

   dbms_output.put_line( empno ||chr(9)||chr(9)||chr(9)||chr(9)|| lastname ||chr(9)||chr(9)|| 'no department name ');
    emp_c := emp_c - 1;

    END LOOP;
ELSE
   dbms_output.put_line( 'Employee not found!' );
END IF;

EXCEPTION
WHEN INVALID_NUMBER THEN 
   DBMS_OUTPUT.PUT_LINE('Error!');
    ROLLBACK;
WHEN NO_DATA_FOUND THEN 
   DBMS_OUTPUT.PUT_LINE('Error!');
    ROLLBACK;
END employee_works_here;

 
Question 3
DECLARE
cname customers.name%type;
credit customers.credit_limit%type;
cat varchar(50);

CURSOR cus_rows IS 
SELECT name, credit_limit FROM customers;
BEGIN 
   OPEN cus_rows;
   
 LOOP
   FETCH cus_rows INTO cname, credit;
   EXIT WHEN cus_rows%NOTFOUND;
   if credit < 1000 then
      cat := 'new customer';
      
    elsif credit >= 1000 AND credit <= 4000 then
      cat := 'existing customers';
      
    else 
      cat := 'credit approved for new increase';

   end if;

   DBMS_OUTPUT.PUT_LINE(cname || chr(9)|| credit || chr(9)||  cat) ;

    END LOOP;
   CLOSE cus_rows;

END;


Question 4

DECLARE
  n_counter NUMBER := 0;
  ordid NUMBER := 0;
  cust NUMBER := 0;
  stats varchar(50) := 0;
  salsman varchar(50) := 0;
  orderdate date;

BEGIN

  SELECT COUNT(*) cnt INTO n_counter FROM ORDERS ;
  WHILE n_counter > 0
  LOOP
  
  SELECT  ORDER_ID, CUSTOMER_ID , STATUS , SALESMAN_ID , ORDER_DATE INTO ordid, cust, stats, salsman, orderdate
  FROM ORDERS WHERE ORDER_ID = n_counter;

DBMS_OUTPUT.PUT_LINE (ordid || ' ' || cust || ' '|| stats || ' '  || salsman || ' ' || orderdate);
    n_counter := n_counter - 1;
  END LOOP;

END;

 

Question 5

Add new_price column
ALTER TABLE PRODUCTS 
ADD new_price number;
 
DECLARE

pid products.product_id%type;
plistprice products.list_price%type;
nprice products.list_price%type;
cat varchar(50);

CURSOR cur_rows IS 
SELECT product_id, list_price FROM products
FOR UPDATE OF new_price;

BEGIN 
   OPEN cur_rows;

 LOOP

   FETCH cur_rows INTO pid, plistprice;
   EXIT WHEN cur_rows%NOTFOUND;

    Case 
    when  plistprice < 50 then
      nprice := plistprice + 30;

    when plistprice >= 50 AND  plistprice <= 100 then
      nprice := plistprice + 50;

    when plistprice >= 200 AND  plistprice <= 500 then
      nprice := plistprice + 150;

   --  when plistprice > 500 then
    else   nprice := plistprice + 200;
   end case;

   DBMS_OUTPUT.PUT_LINE('product_id: ' || pid|| ' list_price: ' || plistprice ||  ' new_price: ' || nprice) ;

   

    --UPDATE--

    UPDATE PRODUCTS SET new_price = nprice  WHERE product_id = pid;

    END LOOP;
   CLOSE cur_rows;

END;