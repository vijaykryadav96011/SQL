SHOW DATABASES;
USE SAKILA;
SELECT * FROM CUSTOMER;
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER;
select * from city;
select ADDRESS_ID,FIRST_NAME,LAST_NAME FROM CUSTOMER;
SELECT * FROM customer WHERE FIRST_NAME = 'MARY';
SELECT first_name , last_name FROM customer WHERE
FIRST_NAME = 'MARY' ;
SELECT * FROM customer WHERE FIRST_NAME = 'RUTH' ;
SELECT * FROM CUSTOMER WHERE STORE_ID = 1 ;
SELECT * FROM CUSTOMER WHERE ADDRESS_ID  > 10 ;
SELECT * FROM CUSTOMER WHERE ADDRESS_ID <20 LIMIT 3 ;
SELECT CUSTOMER_ID , FIRST_NAME , LAST_NAME FROM CUSTOMER 
WHERE CUSTOMER_ID BETWEEN 20 AND 25;
SELECT FIRST_NAME ,  EMAIL FROM CUSTOMER WHERE 
FIRST_NAME  = 'JOAN' AND  LAST_NAME = 'COOPER' ;
SELECT FIRST_NAME, LAST_NAME, EMAIL, ADDRESS_ID FROM CUSTOMER
WHERE  FIRST_NAME = 'JOAN' OR LAST_NAME =   'COOPER' ;

SELECT * FROM CUSTOMER;
UPDATE CUSTOMER SET FIRST_NAME = 'SHIVAM' WHERE LAST_NAME = 'SMITH' ;
SELECT * FROM CUSTOMER WHERE NOT STORE_ID = 2;
SELECT FIRST_NAME, LAST_NAME, EMAIL FROM CUSTOMER ORDER BY FIRST_NAME DESC;
SELECT FIRST_NAME, LAST_NAME, EMAIL FROM CUSTOMER ORDER BY FIRST_NAME ASC;
SELECT FIRST_NAME, LAST_NAME, EMAIL FROM CUSTOMER ORDER BY FIRST_NAME ASC LIMIT 10;
SELECT * FROM CUSTOMER LIMIT 10;
SELECT ADDRESS_ID FROM CUSTOMER WHERE STORE_ID = 1
ORDER BY ADDRESS_ID DESC LIMIT 3;
SELECT MIN(ADDRESS_ID) FROM CUSTOMER; /* MINIMUM FUNCTION*/
SELECT MAX(ADDRESS_ID) FROM CUSTOMER;
SELECT SUM(ADDRESS_ID) FROM CUSTOMER;
SELECT AVG(ADDRESS_ID) FROM CUSTOMER;
SELECT COUNT(*) FROM CITY;
SELECT FIRST_NAME , LAST_NAME,EMAIL FROM CUSTOMER WHERE ADDRESS_ID = (SELECT MIN(ADDRESS_ID) FROM CUSTOMER);

SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'R%' ;
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE '%A' ;
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE '%OR%' ;
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE '%PR%' ;
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'A______%' ;
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'A%O' ;
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'A_____' ;
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'A%' AND LENGTH(FIRST_NAME) = 6 ;
SELECT STORE_ID,COUNT(STORE_ID) FROM CUSTOMER GROUP BY STORE_ID;

SHOW DATABASES;
USE WORLD;

SELECT * FROM COUNTRY;
SELECT COUNT(*) FROM COUNTRY;
SELECT * FROM COUNTRY WHERE POPULATION = '0' ; 
SELECT MIN(POPULATION) FROM COUNTRY;
SELECT MAX(POPULATION) FROM COUNTRY;
SELECT SUM(POPULATION), CONTINENT FROM COUNTRY group by CONTINENT;
SELECT * FROM COUNTRY WHERE NAME = 'ARMENIA' ;
SELECT  NAME, CONTINENT, REGION FROM COUNTRY WHERE POPULATION = (SELECT MIN(POPULATION) FROM COUNTRY) ;
SELECT CONTINENT, SUM(POPULATION) FROM COUNTRY group by CONTINENT order by SUM(POPULATION) ASC;



SHOW DATABASES;
CREATE DATABASE TEST2;
USE TEST2;
CREATE TABLE IF NOT EXISTS TEST2(
test_id int auto_increment,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30)
);
SELECT * FROM TEST2;


SHOW DATABASES;
CREATE DATABASE TEST3;
USE TEST3;
CREATE TABLE IF NOT EXISTS TEST3(
test_id int auto_increment,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30),
primary key (test_id)
);
SELECT * FROM test3;
insert into TEST value
(1,'jalpa','jalpa@gmail','abad'),
(2,'shivam','shivam@gmail','abad'),
(3,'anjana','anjana@gmail','abad'),
(4,'parth','parth@gmail','abad')

insert into test3(test_name , test_mailid , test_adress)
value ('jal','jalpa@gmail.com','baroda'),
('jal','jalpa@gmail.com','baroda'),
('jal','jalpa@gmail.com','baroda'),
('jal','jalpa@gmail.com','baroda')

SELECT * FROM TEST3;

SHOW DATABASES;
CREATE DATABASE TEST4;
USE TEST4;
create table if not exists TEST4(
test_id int ,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30),
test_salary int check(test_salary < 10000))

INSERT INTO test4 VALUES
(1,'jalpa','jalpa@gmail','anand',5000),
(2,'alpa','alpa@gmail','baroda',6000),
(3,'megha','megha@gmail','ahmedabad',7000),
(4,'awni','awni@gmail','banglore',8000);

SELECT * FROM TEST4;


SHOW DATABASES;
CREATE DATABASE TEST5;
USE TEST5;
create table if not exists TEST5(
test_id int ,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30) check (test_adress = 'bengalore'),
test_salary int);
insert into test5(test_id, test_name, test_mailid, test_adress, test_salary)
values (100, 'jal' , 'jalpa@gmail.com', 'bengalore' , 5000);
insert into test5(test_id, test_name, test_mailid, test_adress, test_salary)
values (110, 'abc' , 'jalpa@gmail.com', 'baroda' , 6000);
SELECT * FROM TEST5;



SHOW DATABASES;
CREATE DATABASE TEST6;
USE TEST6;
create table if not exists TEST6(
test_id int NOT NULL auto_increment ,
test_name varchar(30) NOT NULL default 'unknown' ,
test_mailid varchar(30) unique NOT NULL ,
test_adress varchar(30) check (test_adress = 'bengalore') NOT NULL ,
test_salary int check(test_salary > 10000) NOT NULL, 
primary key (test_id));

insert into test6(test_name, test_mailid, test_adress, test_salary)values
( 'jalpa' , 'jalpa1@gmail.com', 'bengalore' , 20000);
SELECT * FROM TEST6;





























