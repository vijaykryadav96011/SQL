use bit_partition;

SELECT * FROM bit_course ;

SELECT * FROM bit_partition.bit_course ;
SELECT SYSTEM_USER();
SELECT SYSDATE();

SELECT * ,
case 
     when course_name = 'j' then sysdate()
     when course_name = 'fsds' then system_user()
     when course_name = ' fsbc' then 'jalpa'
     else " this is not your batch "
end as statement
from bit_course;

SELECT * ,
case 
     when length(course_name) = 4 then "len 4"
     when length(course_name) = 2 then "len 2"
     else "other length"
end as statement
from bit_course;

update bit_course
set course_title = 
case 
     when course_title = 'ML' then 'machine learing'
     else course_title
end ;

update bit_course
set course_mentor = 
case 
     when course_mentor = 'jalpa' then 'shivam'
     else course_mentor
end ;

SELECT * FROM sales_data_final1;
SELECT MIN(SALES) FROM sales_data_final1;
SELECT MAX(SALES) FROM sales_data_final1;

SELECT * ,
CASE 
WHEN SALES < 100 THEN '0 TO 100'
WHEN SALES < 200 THEN '100 TO 200'
WHEN SALES < 300 THEN '200 TO 300'
WHEN SALES < 400 THEN '300 TO 400'
WHEN SALES < 500 THEN '400 TO 500'
WHEN SALES < 600 THEN '500 TO 600'
WHEN SALES < 700 THEN '600 TO 700'
WHEN SALES < 800 THEN '700 TO 800'
WHEN SALES < 900 THEN '800 TO 900'
ELSE " THE SALES ABOVE 900"
END AS STATEMENT 
FROM sales_data_final1;






