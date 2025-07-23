use new2;
create table emp(
emp_id int auto_increment primary key,
first_name varchar(20),
last_name varchar(20),
address varchar(30),
phn_no bigint);

select * from emp;
drop table emp;

insert into emp(first_name,last_name,address,phn_no)
values('hari','priya','trichy abc',7708274431),
('kavi','priya','chennai def',82256743125),
('anu','vinu','madurai hij',9856421738);

select concat(first_name,' ',last_name)as full_name from emp;
select left(first_name,3) from emp;
select replace(address,' ','-')from emp;
select right(phn_no,5) from emp;
alter table emp add full_name varchar(60);
update emp set full_name=concat(first_name,' ',last_name);
select upper(full_name)as customer_name from emp;