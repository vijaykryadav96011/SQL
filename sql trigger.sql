create database trigger_1 ;
use trigger_1;

create table course(
course_id int ,
course_desc varchar(50) ,
course_mentor varchar(60),
course_price int,
course_discount  int,
course_date date,
user_info varchar(50));

select user()
select sysdate()

create table ref_course (
record_insert_date date,
record_insert_user varchar(50))

DELIMITER //
CREATE TRIGGER COURSE_BEFORE_INSERT
BEFORE INSERT
ON COURSE FOR EACH ROW
BEGIN
DECLARE USER_VAL VARCHAR(50);
    SET NEW.course_date=SYSDATE();
    SELECT USER() INTO USER_VAL;
    SET NEW.USER_INFO=USER_VAL;
   
    INSERT INTO REF_COURSE VALUES(SYSDATE(), USER_VAL);
    END; //
    

    insert into course (course_id ,course_desc,course_mentor,
    course_price,course_discount) value (101,"fsda" ,"apla" ,1000,10);
    select * from course;
    
    
    create table test100(
    c1 varchar(50),
    c2 date,
    c3 int);
    

    
    create table test200(
    c1 varchar(50),
    c2 date,
    c3 int);
    
	create table test300(
    c1 varchar(50),
    c2 date,
    c3 int);
    
    
    delimiter // 
    create trigger to_update_others
    before insert on test100 for each row 
    begin 
      insert into test200 values("xyz",sysdate(),123354);
      insert into test300 values("abc",sysdate(),2366);
      
	end ;//
    
    
insert into test100 values("abc",sysdate(),234234);
insert into test100 values("shivam",sysdate(),234234);
insert into test200 values("abc12",sysdate(),34234);
insert into test300 values("mk12",sysdate(),5534234);

select * from test100;
select * from test200;
select * from test300;

delimiter //
create trigger to_update_others_table
after insert on test100 for each row 
begin 
    update test200 set c1 = 'shivam' where c1 = "xyz";
    delete from test300 where c1 = "mk12" ;
end;//

insert into test100 values ("harsh" , sysdate(),977565);


delimiter //
create trigger to_delete_others_table
after delete on test100 for each row 
begin 
    insert into test300 values("after delete", sysdate(), 435457);
end;//


select * from test100;
delete from test100 where c1 = 'harsh' ;
select * from test300 ;


delimiter //
create trigger to_delete_others_before
before delete on test100 for each row 
begin 
    insert into test300 values("before delete", sysdate(), 435457);
end;//



delimiter //
create trigger to_delete_others_before_observation2
before delete on test100 for each row 
begin 
    insert into test200(c1,c2,c3) values(old.c1,old.c2,old.c3);
end;//


select * from test100;
select * from test300;

delimiter //
create trigger to_update_others1
after update on test100 for each row 
begin 
    insert into test300(c1,c2,c3) values("x", sysdate(), 786);
end;//

select * from test100;
insert into test100 values ("sshivam",sysdate(),234234);

update test100 set c1 = "abc@123" where c1 = "sshivam"

select * from test300;

delimiter //
create trigger to_update_others_before1
before update on test100 for each row 
begin 
    insert into test200(c1,c2,c3) values(new.c1,new.c2,new.c3);
end;//

update test100 set c1 = "insert new " where c1 = "shivam"

select * from test100;



create table col1(
name varchar(50) ,
mail_id varchar(60) ,
phone_number int,
address varchar(50),
salary decimal(10,2),
incentive decimal(10,2),
final_salry decimal(10,2));

select * from col1;

delimiter //
create trigger enforce_name_and_calculate_salary
before insert on col1 
for each row
begin
    if left(new.name,1) = "s" then 
    set new.final_salry = new.salary + new.incentive;
    end if;
end;//


insert into col1 (name, mail_id,phone_number,address,salary,incentive)
values ("shivam","shivam@gmail",97010643,"xyssb",500000,100000);

insert into col1 (name, mail_id,phone_number,address,salary,incentive)
values ("bhivam","bhivam@gmail",970565643,"scdb",600000,200000);

select * from col1;