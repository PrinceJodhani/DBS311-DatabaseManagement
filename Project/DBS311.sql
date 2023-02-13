CREATE TABLE stud_fees (
    Stud_ID INT,
    Remarks VARCHAR(20),
    Paid_Fees VARCHAR(10),
    Payment_Method VARCHAR(20),
    Status VARCHAR(20)
);
DROP TABLE stud_fees;
INSERT INTO stud_fees values(1,'Sem 1', 10000, 'Card', 'approved');
SELECT * FROM stud_fees;