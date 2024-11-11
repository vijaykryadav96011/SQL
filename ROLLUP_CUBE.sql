CREATE DATABASE COMPANY1;
USE COMPANY1;

CREATE TABLE IF  NOT EXISTS EMPLOYEE100(
ID INT ,
`NAME` VARCHAR(50) NOT NULL,
GENDER VARCHAR(50) NOT NULL,
SALARY INT NOT NULL,
DEPARTMENT VARCHAR(50) NOT NULL 
);

INSERT INTO employee100 VALUES
  (1, 'jalpesh', 'Male', 5000, 'Sales'),
  (2, 'sneha', 'Female', 6000, 'HR'),
  (3, 'Karti', 'Female', 7500, 'IT'),
  (4, 'suman', 'Male', 6500, 'Marketing'),
  (5, 'viha', 'Female', 5500, 'Finance'),
  (6, 'vishal', 'Male', 8000, 'Sales'),
  (7, 'Viki', 'Male', 7200, 'HR'),
  (8, 'Viysni', 'Female', 6600, 'IT'),
  (9, 'alpa', 'Female', 5400, 'Marketing'),
  (10, 'aesha', 'Female', 6300, 'Finance'),
  (11, 'vishal', 'Male', 5700, 'Sales'),
  (12, 'Pratik', 'Male', 7000, 'HR'),
  (13, 'janvi', 'Female', 7100, 'IT'),
  (14, 'prapti', 'Female', 6800,'Marketing'),
  (15, 'axil', 'Male', 5000, 'Finance');
  
  SELECT * FROM EMPLOYEE100 ;
  
SELECT DEPARTMENT, SUM(SALARY) FROM employee100 group by DEPARTMENT order by SUM(SALARY) ASC;

SELECT DEPARTMENT , SUM(SALARY) AS SALARY FROM EMPLOYEE100 group by DEPARTMENT WITH ROLLUP ;
##ROLLUP 
SELECT coalesce(DEPARTMENT , 'TOTAL' ) AS DEPARTMENT , SUM(SALARY)
FROM EMPLOYEE100 GROUP BY DEPARTMENT WITH ROLLUP;

SELECT 
coalesce(DEPARTMENT, 'TOTAL' ) AS DEPARTMENT,
coalesce(GENDER ,' ALL GENDER' ) AS GENDER ,
SUM(SALARY) AS SALARY
FROM EMPLOYEE100 GROUP BY DEPARTMENT , GENDER WITH ROLLUP ;

# CUBE 

# CUBE IN NOT WORK IN SQL 
SELECT 
coalesce(DEPARTMENT, 'TOTAL' ) AS DEPARTMENT,
coalesce(GENDER ,' ALL GENDER' ) AS GENDER ,
SUM(SALARY) AS SALARY
FROM EMPLOYEE100 GROUP BY CUBE (DEPARTMENT , GENDER);


