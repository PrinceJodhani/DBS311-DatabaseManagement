CREATE TABLE stud_fees (
    stud_ID NUMBER PRIMARY KEY,
    remarks VARCHAR(20),
    paid_Fees VARCHAR(10),
    payment_Method VARCHAR(20),
    status VARCHAR(20)
);

ALTER TABLE stud_fees
ADD CONSTRAINT fk_fees_id
  FOREIGN KEY (stud_ID)
  REFERENCES students(Stud_ID);
  
INSERT INTO stud_fees values(1,'Sem 1', 10000, 'Card', 'approved');
INSERT INTO stud_fees values(2,'Sem 2', 10000, 'Card', 'approved');
INSERT INTO stud_fees values(3,'Sem 1', 12000, 'Cash', 'approved');
INSERT INTO stud_fees values(4,'Sem 3', 26000, 'Card', 'approved');
INSERT INTO stud_fees values(5,'Sem 4', 31000, 'Card', 'approved');
INSERT INTO stud_fees values(6,'Sem 1', 10000, 'Cash', 'approved');
INSERT INTO stud_fees values(7,'Sem 2', 10000, 'Card', 'approved');
INSERT INTO stud_fees values(8,'Sem 1', 12000, 'Cash', 'approved');
INSERT INTO stud_fees values(9,'Sem 3', 26000, 'Cash', 'approved');
INSERT INTO stud_fees values(10,'Sem 4', 31000, 'Card', 'approved');
SELECT * FROM stud_fees;

CREATE TABLE students (
    Stud_ID INT PRIMARY KEY,
    StudName VARCHAR(20),
    Contact_No VARCHAR(20),
    Address VARCHAR(40),
    Parent_mo_no VARCHAR(20),
    Academic_standing VARCHAR(20),
    CourseID INT,
    Degree VARCHAR(20),
    OverallGPA NUMBER(10,2)
);

INSERT INTO students VALUES(1,'Prince Jodhani', 918780906333,'Kailashdham society', 917567302437, 'excellent', 1, 'CPP', 3.8);
INSERT INTO students VALUES(2,'ecnirp Jodhani', 918780906333,'Kailashdham society', 917567302437, 'excellent', 1, 'CPP', 3.8);
INSERT INTO students VALUES(3,'jaiswal', 937488494,'finch avenue', 4353425345, 'good', 1, 'CPP', 3.6);
INSERT INTO students VALUES(4,'Raytheon', 933458494,'514 Superior St', 443425345, 'good', 1, 'CPA', 3.0);
INSERT INTO students VALUES(5,'AbbVie', 323234494,'33 Dixie Ct', 432425345, 'good', 1, 'CPA', 3.6);
INSERT INTO students VALUES(6,'Fluor', 5780906333,'Kailashdham society', 3545302437, 'good', 1, 'CPP', 3.8);
INSERT INTO students VALUES(7,'AECOM', 433906333,'Kailashdham society', 345347302437, 'excellent', 1, 'CPP', 3.8);
INSERT INTO students VALUES(8,'jaiswal', 435388494,'finch avenue', 43534667, 'good', 1, 'CPP', 3.2);
INSERT INTO students VALUES(9,'Supervalu', 354338494,'514 Superior St', 234275473, 'excellent', 1, 'CPA', 3.0);
INSERT INTO students VALUES(10,'Southern', 6545234494,'33 Dixie Ct', 254365754, 'good', 1, 'CPA', 3.8);
SELECT * FROM students;



CREATE TABLE registration (
    Stud_ID INT PRIMARY KEY,
    Enrolled VARCHAR(20),
    No_Subjects INT,
    Tot_Sub_Credits INT,
    Passed_Subjects INT,
    Failed_Subjects INT,
    Paid_Fees INT,
    Graduated VARCHAR(20),
    Current_Sem INT,
    Start_Date VARCHAR(20)
);
DROP TABLE registration;

ALTER TABLE registration
ADD CONSTRAINT fk_reg_id
  FOREIGN KEY (Stud_ID)
  REFERENCES students(Stud_ID);

INSERT INTO registration VALUES(1,'Y', 5,15, 10, 0, 25000, 'NO', 3, '7 May 2021');
INSERT INTO registration VALUES(2,'Y',5,15,10,0,26000,'NO',3,'6 MAY 2021');
INSERT INTO registration VALUES(3,'N',4,13,15,2,26000,'NO',3,'6 MAY 2020');
INSERT INTO registration VALUES(4,'Y',5,15,15,2,29000,'NO',2,'26 NOV 2020');
INSERT INTO registration VALUES(5,'N',3,9,13,1,16000,'NO',4,'13 MAY 2020');
INSERT INTO registration VALUES(6,'Y', 5,15, 10, 0, 25000, 'NO', 3, '7 APR 2021');
INSERT INTO registration VALUES(7,'Y',5,15,11,0,26000,'YES',3,'6 JAN 2021');
INSERT INTO registration VALUES(8,'N',4,13,12,2,26000,'NO',3,'6 JUL 2020');
INSERT INTO registration VALUES(9,'Y',5,15,11,2,29000,'NO',2,'26 NOV 2020');
INSERT INTO registration VALUES(10,'N',3,9,10,1,16000,'NO',4,'13 MAY 2020');


SELECT * FROM registration;


CREATE TABLE professors (
    ProfID INT PRIMARY KEY,
    ProfName VARCHAR(20),
    CourseID INT,
    StartDate VARCHAR(20)
);

ALTER TABLE professors
ADD CONSTRAINT fk_prof_id
  FOREIGN KEY (CourseID)
  REFERENCES courses(CourseID);
  
INSERT INTO professors VALUES(1,'Rani Gnanolivu', 1, '13 MAY 2021');
INSERT INTO professors VALUES(2,'Alcoa', 2, '21 MAY 2021');
INSERT INTO professors VALUES(3,'Amgen', 3, '11 JAN 2019');
INSERT INTO professors VALUES(4,'Danaher', 4, '07 FEB 2018');
INSERT INTO professors VALUES(5,'Aflac', 5, '11 DEC 2021');
INSERT INTO professors VALUES(6,'Nucor', 6, '21 NOV 2016');
INSERT INTO professors VALUES(7,'Charles',7, '21 MAY 2017');
INSERT INTO professors VALUES(8,'Ryan', 8, '14 MAR 2019');
INSERT INTO professors VALUES(9,'Albert', 9, '07 FEB 2018');
INSERT INTO professors VALUES(10,'Alex', 10, '11 DEC 2021');

SELECT * FROM professors;




CREATE TABLE courses (
    CourseID INT PRIMARY KEY,
    C_name VARCHAR(20)
);
DROP TABLE courses;
INSERT INTO courses VALUES(1,'DBS311');
INSERT INTO courses VALUES(2,'SYD366');
INSERT INTO courses VALUES(3,'IPC144');
INSERT INTO courses VALUES(4,'OOP244');
INSERT INTO courses VALUES(5,'OOP345');
INSERT INTO courses VALUES(6,'COM101');
INSERT INTO courses VALUES(7,'PSY144');
INSERT INTO courses VALUES(8,'PSY345');
INSERT INTO courses VALUES(9,'CPR135');
INSERT INTO courses VALUES(10,'WEB322');

SELECT * FROM courses;



CREATE TABLE advisors (
    AID INT PRIMARY KEY,
    A_name VARCHAR(20),
    CourseID INT
);

ALTER TABLE advisors
ADD CONSTRAINT fk_ad_id
  FOREIGN KEY (CourseID)
  REFERENCES courses(CourseID);
  
INSERT INTO advisors VALUES(1,'Robert Robson', 1);
INSERT INTO advisors VALUES(2,'Assurant', 2);
INSERT INTO advisors VALUES(3,'Paccar', 3);
INSERT INTO advisors VALUES(4,'Cummins', 4);
INSERT INTO advisors VALUES(5,'Lear', 5);
INSERT INTO advisors VALUES(6,'Jaxon', 6);
INSERT INTO advisors VALUES(7,'Liam', 7);
INSERT INTO advisors VALUES(8,'Jackson', 8);
INSERT INTO advisors VALUES(9,'Leon', 9);
INSERT INTO advisors VALUES(10,'Aaron', 10);

SELECT * FROM advisors;


commit;