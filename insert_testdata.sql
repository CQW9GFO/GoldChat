/*
 * Script for creating the unit test data for GoldChat
 */

# Modules
INSERT INTO modules(module_name) VALUES('IS52018C: Software Projects / Computing Project 2 (2022-23)');
INSERT INTO modules(module_name) VALUES('IS52045A: Extended Java (2022-23)');
INSERT INTO modules(module_name) VALUES('IS52038B: Algorithms and Data Structures / Algorithms 2 (2022-23)');
INSERT INTO modules(module_name) VALUES('IS52052A: Fundamentals of Computer Science (2022-23)');

# Students
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Mahamed Abdulle','abc',1);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Abdulahi Aden','abc',2);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Sadde Aden','abc',3);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('David Adewale','abc',4);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Muhammad Adil','abc',5);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Faizaan Ahmed','abc',6);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Tahbib Ahmed','abc',7);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Junaid Ahmed','abc',8);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Mohammod Ahmed','abc',9);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Adil Ahmed','abc',10);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Mohamed Ahmed Abdalla','abc',11);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Kevin Ajayi','abc',12);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Akintomide Akinyemi','abc',13);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Nadia Al Saud','abc',14);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Arooj Ali','abc',15);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Alimire Ali','abc',16);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Abul-Hasan Amin','abc',17);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Nazim Amin','abc',18);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Tiya Anderson','abc',19);
INSERT INTO students(student_name,password,goldsmiths_id) VALUES('Frazer Anderson','abc',20);

# Module students
INSERT INTO module_students(module_id, student_id) VALUES(1,1);
INSERT INTO module_students(module_id, student_id) VALUES(1,2);
INSERT INTO module_students(module_id, student_id) VALUES(1,3);
INSERT INTO module_students(module_id, student_id) VALUES(1,4);
INSERT INTO module_students(module_id, student_id) VALUES(1,5);
INSERT INTO module_students(module_id, student_id) VALUES(1,6);
INSERT INTO module_students(module_id, student_id) VALUES(1,7);
INSERT INTO module_students(module_id, student_id) VALUES(1,8);
INSERT INTO module_students(module_id, student_id) VALUES(1,9);
INSERT INTO module_students(module_id, student_id) VALUES(1,10);
INSERT INTO module_students(module_id, student_id) VALUES(1,11);
INSERT INTO module_students(module_id, student_id) VALUES(1,12);
INSERT INTO module_students(module_id, student_id) VALUES(1,13);
INSERT INTO module_students(module_id, student_id) VALUES(1,14);
INSERT INTO module_students(module_id, student_id) VALUES(1,15);
INSERT INTO module_students(module_id, student_id) VALUES(1,16);
INSERT INTO module_students(module_id, student_id) VALUES(1,17);
INSERT INTO module_students(module_id, student_id) VALUES(1,18);
INSERT INTO module_students(module_id, student_id) VALUES(1,19);
INSERT INTO module_students(module_id, student_id) VALUES(1,20);

INSERT INTO module_students(module_id, student_id) VALUES(2,1);
INSERT INTO module_students(module_id, student_id) VALUES(2,2);
INSERT INTO module_students(module_id, student_id) VALUES(2,3);
INSERT INTO module_students(module_id, student_id) VALUES(2,4);
INSERT INTO module_students(module_id, student_id) VALUES(2,5);
INSERT INTO module_students(module_id, student_id) VALUES(2,6);
INSERT INTO module_students(module_id, student_id) VALUES(2,7);
INSERT INTO module_students(module_id, student_id) VALUES(2,8);
INSERT INTO module_students(module_id, student_id) VALUES(2,9);
INSERT INTO module_students(module_id, student_id) VALUES(2,10);

INSERT INTO module_students(module_id, student_id) VALUES(3,11);
INSERT INTO module_students(module_id, student_id) VALUES(3,12);
INSERT INTO module_students(module_id, student_id) VALUES(3,13);
INSERT INTO module_students(module_id, student_id) VALUES(3,14);
INSERT INTO module_students(module_id, student_id) VALUES(3,15);
INSERT INTO module_students(module_id, student_id) VALUES(3,16);
INSERT INTO module_students(module_id, student_id) VALUES(3,17);
INSERT INTO module_students(module_id, student_id) VALUES(3,18);
INSERT INTO module_students(module_id, student_id) VALUES(3,19);
INSERT INTO module_students(module_id, student_id) VALUES(3,20);


INSERT INTO module_students(module_id, student_id) VALUES(4,2);
INSERT INTO module_students(module_id, student_id) VALUES(4,4);
INSERT INTO module_students(module_id, student_id) VALUES(4,6);
INSERT INTO module_students(module_id, student_id) VALUES(4,8);
INSERT INTO module_students(module_id, student_id) VALUES(4,10);
INSERT INTO module_students(module_id, student_id) VALUES(4,12);
INSERT INTO module_students(module_id, student_id) VALUES(4,14);
INSERT INTO module_students(module_id, student_id) VALUES(4,16);
INSERT INTO module_students(module_id, student_id) VALUES(4,18);
INSERT INTO module_students(module_id, student_id) VALUES(4,20);

# Posts
INSERT INTO POSTS(title, content, module_id, student_id, date_and_time)
VALUES ('','Hey, when''s assignment 2 due?', 1, 1, '2023-02-23 11:32');

INSERT INTO POSTS(title, content, module_id, student_id, date_and_time)
VALUES ('','There''s no date yet!', 1, 2, '2023-02-23 11:33');

INSERT INTO POSTS(title, content, module_id, student_id, date_and_time)
VALUES ('','It''s just been added.  It’s due on Friday!', 1, 14, '2023-02-24 12:54');

INSERT INTO POSTS(title, content, module_id, student_id, date_and_time)
VALUES ('','Oh thanks!', 1, 2, '2023-02-24 12:55');