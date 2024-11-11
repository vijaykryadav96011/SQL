CREATE DATABASE N1;
USE N1;
/* SQUARE_ROOT OF ANY NUMBER */

delimiter $$
create procedure Sqrt_Root(a int, out b float)
begin 
	set b = Sqrt(a);
end $$
delimiter ;

call Sqrt_Root(64, @b);
select @b;

select SQRT(4)

delimiter $$
create procedure POWER_1(a int, b int, out c int)
begin 
	set c = power(a,b);
end $$
delimiter ;

call power_1(3,2,@c);
select @c;
# input procedure
delimiter $$
create procedure setcounter(INOUT COUNTER INT, IN INC INT)
begin 
	set COUNTER = COUNTER + INC;
end $$
delimiter ;

SET @COUNTER = 2;

CALL setcounter(@counter , 6);
select @counter;

# use variables
delimiter //
create procedure user_var2()
begin
     set @x = 15;
     set @y = 10;
     select @x,@y,@x-@y,@x+@y;
end //

call user_var2();




