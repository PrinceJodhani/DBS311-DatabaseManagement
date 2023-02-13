set serveroutput on;

---------------------------- Registration Select ----------------------------------
CREATE OR REPLACE PROCEDURE spRegistrationSelect (sid in INTEGER, c1 out STRING, c2 out NUMBER, c3 out NUMBER, c4 out NUMBER, c5 out NUMBER, c6 out NUMBER, c7 out STRING, c8 out INTEGER, c9 out STRING)
AS
enrol VARCHAR2(50);
sub NUMBER;
totcred NUMBER;
passsub NUMBER;
failsub NUMBER;
feespaid NUMBER;
graduate VARCHAR2(10);
csem NUMBER;
sdate VARCHAR2(40);
BEGIN


SELECT enrolled,no_subjects,tot_sub_credits,passed_subjects,failed_subjects,paid_fees,graduated,current_sem,start_date 
 INTO enrol,sub,totcred,passsub,failsub,feespaid,graduate,csem,sdate FROM registration WHERE stud_id = sid;

   IF sql%rowcount = 0
     THEN
        c1 := 'No any row found for delete';
     ELSE    

    c1 := enrol;
    c2 := sub;
    c3 := totcred;
    c4 := passsub;
    c5 := failsub;
    c6 := feespaid;
    c7 := graduate;
    c8 := csem;
    c9 := sdate;
END IF;

EXCEPTION
    WHEN OTHERS
    THEN
        c1 := 'error in SP';

END spRegistrationSelect;


---------------------------- Registration Insert ----------------------------------
CREATE OR REPLACE PROCEDURE spRegistrationInsert (sid in INTEGER, result out string)
as
BEGIN

INSERT INTO registration VALUES (sid,'Y',5,15,15,2,29000,'NO',2,'26 NOV 2020');

   IF sql%rowcount = 0
     THEN
        result := 'stud: '|| sid ||' is already exist';
     ELSE    
    result := 'Reg for: '|| sid ||': inserted!';
END IF;

EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error in SP');

END;

----------------------------- Registration Update ----------------------------------
CREATE OR REPLACE PROCEDURE spRegistrationUpdate (sid in INTEGER, result out STRING)
AS
BEGIN

UPDATE registration SET enrolled = 'N' WHERE stud_id = sid;


   IF sql%rowcount = 0
     THEN
        result := 'This student id is not exist to update';
     ELSE    
    result := 'stud: '|| sid ||': updated!';
END IF;

EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error in SP');

END;

--------------------------------- Registration Delete -------------------------------
CREATE OR REPLACE PROCEDURE spRegistrationDelete (sid in INTEGER, result out string)
as
BEGIN

DELETE FROM registration
WHERE stud_id = sid;

   IF sql%rowcount = 0
     THEN
        result := 'No any row found for delete';
     ELSE    
    result := 'registration stud_id: '|| sid ||' deleted';
END IF;

EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error in SP');

END;







------------------------------- Students ---------------------------
--------------------------- Student Insert ---------------------------
CREATE OR REPLACE PROCEDURE spStudentsInsert (sid in INTEGER, result out string)
as
BEGIN

INSERT INTO students 
VALUES(sid,'Southern', 6545234494,'33 Dixie Ct', 254365754, 'good', 1, 'CPA', 3.8);


   IF sql%rowcount = 0
     THEN
        result := 'stud: '|| sid ||' is already exist';
     ELSE    
    result := 'stud: '|| sid ||': inserted successfully';
END IF;

EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error in SP');

END;

----------------------------------- Update --------------------------------------

CREATE OR REPLACE PROCEDURE spStudentsUpdate (sid in INTEGER, result out STRING)
AS
BEGIN

UPDATE students SET address = 'new@myseneca.ca' WHERE stud_id = sid;


   IF sql%rowcount = 0
     THEN
        result := 'This student id is not exist to update';
     ELSE    
    result := 'stud: '|| sid ||': email updated';
END IF;

EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error in SP');

END;

--------------------------------- Delete Student ----------------------------------

CREATE OR REPLACE PROCEDURE spStudentsDelete (sid in INTEGER, result out string)
as
BEGIN

DELETE FROM students
WHERE stud_id = sid;

   IF sql%rowcount = 0
     THEN
        result := 'No any row found for delete';
     ELSE    
    result := 'stud_id: '|| sid ||' deleted successfully';
END IF;

EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error in SP');

END;

-------------------------------- Select Student ----------------------------------------------

CREATE OR REPLACE PROCEDURE spStudentsSelect (sid in INTEGER, c1 out STRING, c2 out STRING, c3 out STRING, c4 out STRING, c5 out STRING, c6 out INTEGER, c7 out STRING, c8 out INTEGER)
AS
stud_name VARCHAR2(50);
contact VARCHAR2(50);
saddress VARCHAR2(50);
parentmo VARCHAR2(50);
academic VARCHAR2(15);
cid NUMBER;
sdegree VARCHAR2(10);
gpa NUMBER(10,3);
BEGIN


SELECT studname,contact_no,address,parent_mo_no,academic_standing,courseid,degree,overallgpa 
INTO stud_name,contact,saddress,parentmo,academic,cid,sdegree,gpa FROM students WHERE stud_id = sid;

   IF sql%rowcount = 0
     THEN
        c1 := 'No any row found for delete';
     ELSE    

    c1 := stud_name;
    c2 := contact;
    c3 := saddress;
    c4 := parentmo;
    c5 := academic;
    c6 := cid;
    c7 := sdegree;
    c8 := gpa;
END IF;

EXCEPTION
    WHEN OTHERS
    THEN
        c1 := 'error in SP';

END spStudentsSelect;