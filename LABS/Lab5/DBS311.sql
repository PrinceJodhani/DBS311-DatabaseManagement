DROP TABLE new_products;
CREATE TABLE new_products AS (SELECT * FROM products);

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE  price_report_149455206 
AS Rows_updated NUMBER;m_price1 NUMBER(9,2); m_low NUMBER(9,2); m_fair NUMBER(9,2); m_high NUMBER(9,2); m_avg NUMBER(9,2); m_price NUMBER(9,2);
BEGIN
   
   SELECT AVG(list_price), MIN(list_price), MAX(list_price) INTO m_avg,m_low,m_high FROM new_products; 
   
   m_price := (m_avg - m_low) / 2;
   IF m_avg <= m_price THEN
         DBMS_OUTPUT.PUT_LINE('Low: ' || m_price);
     ELSIF m_avg > m_high THEN
        DBMS_OUTPUT.PUT_LINE('High: ' || m_price);
    ELSIF m_avg - m_low / 2 AND m_high - m_avg  / 2 THEN
        DBMS_OUTPUT.PUT_LINE('Fair: ' || m_price);
    END IF;

EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error!');
END price_report_149455206 ;