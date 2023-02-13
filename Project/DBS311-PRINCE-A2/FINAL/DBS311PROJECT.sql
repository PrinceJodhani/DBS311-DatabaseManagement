-- College Registration System 
-- Group 5 
-- Prince Jodhani 
-- StudentID: 149455206
-- Tables: students, registration


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
delete from students where stud_id = 12;


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