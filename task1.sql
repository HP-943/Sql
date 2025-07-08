create database new;
use new;
create table employees(
sno int,
name varchar(20),
station varchar(30));

select * from employees;
select sno,name,station from employees;

insert into  employees(sno,name,station)
values(1,'mano','R1'),(2,'vinoth','R2');

alter table employees add phn_no varchar(15);

alter table employees modify phn_no varchar (20);

alter table employees change phn_no contact_no varchar(20);
alter table employees change contact_no phn_no varchar(20);

alter table employees drop column phn_no;

rename table employees to staff;
select * from staff;
