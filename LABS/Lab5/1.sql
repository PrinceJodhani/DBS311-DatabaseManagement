DROP TABLE new_products;
CREATE TABLE new_products AS (SELECT * FROM products);

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE  price_report_149455206 
AS Rows_updated NUMBER; m_low NUMBER(9,2); m_fair NUMBER(9,2); m_high NUMBER(9,2); m_avg NUMBER(9,2); m_price NUMBER(9,2);
BEGIN
   SELECT 
   SELECT AVG(list_price) INTO m_avg FROM new_products; 
   
   IF m_avg <=  THEN
        UPDATE new_products SET list_price = list_price + added2;
     ELSIF average > 1000 THEN
        UPDATE new_products SET list_price = list_price + added1;
    
    END IF;
Rows_updated := sql%rowcount;
DBMS_OUTPUT.PUT_LINE('*** OUTPUT update_low_prices_149455206 STARTED ***');
DBMS_OUTPUT.PUT_LINE ('Number of updates: ' || Rows_updated);
DBMS_OUTPUT.PUT_LINE('----ENDED --------');
EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error!');
END price_report_149455206 ;