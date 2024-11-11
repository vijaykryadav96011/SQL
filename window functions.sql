#WINDOW FUNCTIONS 
CREATE DATABASE WIN1_FUN;
USE WIN1_FUN;
CREATE TABLE BIT_STUDENTS(
STUDENT_ID INT,
STUDENT_BATCH VARCHAR(40),
STUDENT_NAME VARCHAR(40),
STUDENT_STREAM VARCHAR(30),
STUDENS_MARKS INT,
STUDENT_MAIL_ID VARCHAR(50));

INSERT INTO BIT_STUDENTS VALUES(100,'FSDA','SAURABH','CS',80,'SAURABH@GMAIL.COM'),
(102,'FSDA','SANKET','CS',81,'SANKET@GMAIL.COM'),
(103,'FSDA','SHYAM','CS',80,'SHYAM@GMAIL.COM'),
(104,'FSDA','SANKET','CS',82,'SANKET@GMAIL.COM'),
(105,'FSDA','SHYAM','ME',67,'SHYAM@GMAIL.COM'),
(106,'FSDS','AJAY','ME',45,'AJAY@GMAIL.COM'),
(106,'FSDS','AJAY','ME',78,'AJAY12@GMAIL.COM'),
(108,'FSDS','SNEHAL','CI',89,'SNEHAL@GMAIL.COM'),
(109,'FSDS','MANISHA','CI',34,'MANISHA@GMAIL.COM'),
(110,'FSDS','RAKESH','CI',45,'RAKESH@GMAIL.COM'),
(111,'FSDE','ANUJ','CI',43,'ANUJ@GMAIL.COM'),
(112,'FSDE','MOHIT','EE',67,'MOHIT@GMAIL.COM'),
(113,'FSDE','VIVEK','EE',23,'VIVEK@GMAIL.COM'),
(114,'FSDE','GAURAV','EE',45,'GAURAV@GMAIL.COM'),
(115,'FSDE','PRATEEK','EE',89,'PRATEEK@GMAIL.COM'),
(116,'FSDE','MITHUN','ECE',23,'MITHUN@GMAIL.COM'),
(117,'FSBC','CHAITRA','ECE',23,'CHAITRA@GMAIL.COM'),
(118,'FSBC','PRANAY','ECE',45,'PRANAY@GMAIL.COM'),
(119,'FSBC','SANDEEP','ECE',65,'SANDEEP@GMAIL.COM'),
(119,'FSDS','JALPA','EC',60,'JALPA@GMAIL.COM');

SELECT * FROM BIT_STUDENTS;
SELECT * FROM BIT_STUDENTS WHERE STUDENS_MARKS = (SELECT MAX(STUDENS_MARKS) FROM BIT_STUDENTS);

SELECT STUDENT_BATCH, MAX(STUDENS_MARKS) AS HIGHEST_MARKS
FROM BIT_STUDENTS
GROUP BY STUDENT_BATCH;

SELECT student_id , student_batch , student_stream , studens_marks , 
row_number() over(order by studens_marks) as
'row_number' from bit_students;

SELECT student_id , student_batch , student_stream , studens_marks , 
row_number() over(partition by  student_batch order by studens_marks desc) as
'row_number' from bit_students;

select * from (select student_id , student_batch , student_stream , studens_marks ,
row_number() over(partition by  student_batch order by studens_marks desc) as
'row_num' from bit_students) as test where row_num = 3;

select student_id , student_batch , student_stream , studens_marks ,
row_number() over(partition by  student_batch order by studens_marks desc) as
'row_number',
rank() over(partitions by student_batch order by studens_marks desc)
as 'row_rank' 
from bit_students;


select * from (select student_id , student_batch , student_stream , studens_marks ,
row_number() over(partition by  student_batch order by studens_marks desc) as'row_num',
rank() over(partition by  student_batch order by studens_marks desc) as 'row_rank',
dense_rank() over( partition by  student_batch order by studens_marks desc) as 'dense_rank'
from bit_students ) as test where `dense_rank` = 5;


select * from (select student_id , student_batch , student_stream , studens_marks ,
row_number() over(partition by  student_batch order by studens_marks desc) 
as'row_number',
rank() over(partition by  student_batch order by studens_marks desc)
as 'row_rank',
dense_rank() over(partition by  student_batch order by studens_marks desc) 
as 'dense_rank'
from bit_students ) as test where `dense_rank` <  5;


select student_id , student_batch , student_stream , studens_marks ,
rank() over(partition by  student_batch order by studens_marks desc)
as 'row_rank',
percent_rank() over(partition by  student_batch order by studens_marks desc)
as 'percent_rank' 
from bit_students ;




create table student2(
id int primary key,
name varchar(255),
percentage int );

INSERT INTO student2 values
(1,'ATUL',90),
(2,'VISHAL',91),
(3,'SHAILESH',3),
(4,'NIRAJ',92),
(5,'CHETAN',89),
(6,'SANGRAM',87),
(7,'ROHIT',87),
(8,'PRASHANT',93),
(9,'RAVI',91),
(10,'AKANSHA',94);

create table student3(
id int primary key,
name varchar(255),
percentage int );
INSERT INTO student3 values
(1,'ATUL',90),
(2,'VISHAL',91),
(3,'SHAILESH',3),
(4,'NIRAJ',92),
(5,'CHETAN',89),
(6,'SANGRAM',87),
(7,'ROHIT',87),
(8,'PRASHANT',93),
(9,'RAVI',91),
(10,'AKANSHA',94),
(11,'FALAK',86);



create table student4(
id int PRIMARY KEY,
name varchar(255),
SUBJECT VARCHAR(20),
percentage int );

INSERT INTO student4 values
(1,'ATUL','ENGLISH',90),
(2,'VISHAL','ENGLISH',91),
(3,'SHAILESH','ENGLISH',3),
(4,'NIRAJ','ENGLISH',92),
(5,'CHETAN','ENGLISH',89),
(6,'SANGRAM','ENGLISH',87),
(7,'ROHIT','MATH',87),
(8,'PRASHANT','MATH',93),
(9,'RAVI','MATH',91),
(10,'AKANSHA','MATH',94),
(11,'FALAK','MATH',86),
(12,'AVNT','MATH',73);


create table student5(
id int PRIMARY KEY,
name varchar(255),
SUBJECT VARCHAR(20),
percentage int );

INSERT INTO student5 values
(1,'ATUL','ENGLISH',90),
(2,'VISHAL','ENGLISH',91),
(3,'SHAILESH','ENGLISH',3),
(4,'NIRAJ','ENGLISH',92),
(5,'CHETAN','ENGLISH',89),
(6,'SANGRAM','ENGLISH',87),
(7,'ROHIT','MATH',87),
(8,'PRASHANT','MATH',93),
(9,'RAVI','MATH',91),
(10,'AKANSHA','MATH',94),
(11,'FALAK','MATH',86),
(12,'AVNT','MATH',73);

SELECT ID, NAME,SUBJECT,PERCENTAGE, NTILE(2) OVER
(PARTITION BY SUBJECT ORDER BY PERCENTAGE DESC) AS
NTILEGROUP3 FROM student5; 


