create database if not exists bit_partition;
use bit_partition;

create table bit_course(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_lauch_year int);

SELECT * FROM bit_course ;

insert into bit_course values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);

SELECT * FROM bit_course where course_lauch_year = 2019;

create table bit_course1(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_lauch_year int)
partition by range(course_lauch_year)(
partition P0 values less than (2019),
partition P1 values less than (2020),
partition P2 values less than (2021),
partition P3 values less than (2022),
partition P4 values less than (2023));

insert into bit_course1 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);
SELECT * FROM bit_course1 ;

SELECT PARTITION_NAME , TABLE_NAME , TABLE_ROWS FROM 
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'bit_course1';


create table bit_course2(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_lauch_year int)
partition by hash(course_lauch_year)
partitions 5;

insert into bit_course2 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);
SELECT * FROM bit_course2 ;

SELECT PARTITION_NAME , TABLE_NAME , TABLE_ROWS FROM 
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'bit_course2';

SELECT * FROM bit_course2 partition(P0);

create table bit_course3(
course_name varchar(50),
course_id int(10) primary key,
course_title varchar(60),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_lauch_year int)
partition by key()
partitions 10;
insert into bit_course3 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 111 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 112 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 113 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 114 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 115 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);

SELECT PARTITION_NAME , TABLE_NAME , TABLE_ROWS FROM 
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'bit_course3';


create table bit_course4(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_lauch_year int)
partition by list(course_lauch_year)(
partition P0 values in (2019,2020),
partition P1 values in (2022,2021));

insert into bit_course4 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 111 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 112 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 113 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 114 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 115 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);

SELECT PARTITION_NAME , TABLE_NAME , TABLE_ROWS FROM 
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'bit_course4';

create table bit_course5(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_lauch_year int)
partition by range columns(course_name,course_lauch_year)
(
partition P0 values less than ('aiops',2019),
partition P1 values less than ('fsds',2021),
partition P2 values less than ('mern',2022)
);
insert ignore into bit_course5 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);

SELECT PARTITION_NAME , TABLE_NAME , TABLE_ROWS FROM 
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'bit_course5';

create table bit_course6(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_lauch_year int)
partition by range(course_lauch_year)
subpartition by hash(course_lauch_year)
subpartitions 5 (
partition P0 values less than (2019),
partition P1 values less than (2020),
partition P2 values less than (2021),
partition P3 values less than (2022));

insert ignore into bit_course6 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);

SELECT PARTITION_NAME , TABLE_NAME , TABLE_ROWS FROM 
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'bit_course6';










