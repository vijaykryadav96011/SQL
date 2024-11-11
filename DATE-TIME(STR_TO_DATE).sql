CREATE DATABASE DRESS_DATA;
USE DRESS_DATA;
CREATE TABLE IF NOT exists DRESS(
Dress_ID varchar(30),	
Style varchar(30),		
Price varchar(30),		
Rating varchar(30),	
Size varchar(30),		
Season varchar(30),	
NeckLine varchar(30),		
SleeveLength varchar(30),		
waiseline varchar(30),		
Material varchar(30),		
FabricType varchar(30),		
Decoration varchar(30),		
PatternTYPE varchar(30),		
Recommendation varchar(30));

LOAD DATA INFILE 
'C:/AttributeDataSet.csv'
INTO TABLE DRESS
FIELDS terminated by ','
enclosed by '"'
LINES terminated by '\n'
ignore 1 ROWS

SELECT * FROM DRESS;
SELECT distinct SEASON FROM DRESS;
SELECT distinct PRICE FROM DRESS;
SELECT SIZE , PRICE , NECKLINE FROM DRESS WHERE RATING = (SELECT MAX(RATING) FROM DRESS);
SELECT * FROM DRESS WHERE NECKLINE = 'o-neck';
SELECT * FROM DRESS WHERE NECKLINE = 'v-neck';
SELECT * FROM DRESS WHERE RATING = '0';

create database csvkit;
use csvkit;

CREATE TABLE sales_data_final1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(14) NOT NULL, 
	ship_date VARCHAR(14) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);
select * from sales_data_final1;
LOAD DATA INFILE 
'C:/sales_data_final.csv'
INTO TABLE sales_data_final1
FIELDS terminated by ','
enclosed by '"'
LINES terminated by '\n'
ignore 1 ROWS

SET SESSION SQL_MODE = '';

SELECT str_to_date(order_date, '%m-%d-%y') from sales_data_final1;

ALTER TABLE sales_data_final1
ADD COLUMN ORDER_DATE_NEW  DATE AFTER ORDER_DATE;

UPDATE sales_data_final1
SET ORDER_DATE_NEW = str_to_date(order_date, '%m-%d-%y');
select * from sales_data_final1;

SET SQL_MODE ='TRADITIONAL, ALLOW_INVALID_DATES';

UPDATE sales_data_final1
SET ship_DATE_NEW = str_to_date(ship_date, '%m%d/%Y');


ALTER TABLE sales_data_final1
ADD COLUMN ship_DATE_NEW  DATE AFTER ship_DATE;

SELECT str_to_date(ship_date, '%m-%d-%y') from sales_data_final1;


SELECT * FROM sales_data_final1 WHERE SHIP_DATE_NEW = '2011-01-05' ;

SELECT * FROM sales_data_final1 WHERE SHIP_DATE_NEW > '2011-01-05' ;

SELECT * FROM sales_data_final1 WHERE SHIP_DATE_NEW < '2011-01-05' ;
SELECT * FROM sales_data_final1 WHERE SHIP_DATE_NEW = '2011-01-05' ;

SELECT * FROM sales_data_final1 WHERE SHIP_DATE_NEW BETWEEN '2011-01-05' AND '2011-08-30' ;

SELECT now();
SELECT curdate();
SELECT curtime();

SELECT * FROM sales_data_final1 WHERE SHIP_DATE_NEW < date_sub(now() , interval 1 WEEK)

SELECT date_sub(now() , interval 1 week)
SELECT date_sub(now() , interval 30 day)
SELECT date_sub(now() , interval 30 year)

select year(now())
select dayname('2022-09-20 21:10:30')

select * from sales_data_final1;
ALTER TABLE sales_data_final1
ADD COLUMN month_NEW1 INT;
ALTER TABLE sales_data_final1
ADD COLUMN DAY_NEW1 INT;
ALTER TABLE sales_data_final1
ADD COLUMN YEAR_NEW1 INT;

UPDATE sales_data_final1 SET MONTH_NEW1 = MONTH(ORDER_DATE_NEW);
UPDATE sales_data_final1 SET DAY_NEW1 = DAY(ORDER_DATE_NEW);
UPDATE sales_data_final1 SET YEAR_NEW1 = YEAR(ORDER_DATE_NEW);

select * from sales_data_final1;

alter table sales_data_final1 add column flag1 date after order_id;

update sales_data_final1
set flag1 = now();

SELECT SUM(sales), year FROM sales_data_final1  group by year order by SUM(sales) ASC;

alter table sales_data_final1
add column flag_new12 varchar(10);
update sales_data_final1 set flag_new12 = if(discount > 0 , 'yes' , 'no')

SELECT AVG(QUANTITY), year FROM sales_data_final1  group by year order by AVG(QUANTITY) ASC;























