create database demo2;
use demo2;
create table employees(
emp_id int auto_increment primary key,
emp_name varchar(20),
dept_id int,
foreign key(dept_id) references department(dept_id),
salary decimal(10,2),
manager_id int);

insert into employees(emp_name,dept_id,salary,manager_id)
values('anu',101,40000.00,201),('alice',102,45000.00,201),('john',102,55000.00,203),('siva',104,56000.00,204),('sekar',105,45000.00,205);
 
 select * from employees;
 drop table employees;
 
 create table department(
 dept_id int primary key,
dept_name varchar(10),
location varchar(12) default 'trichy');

insert into department(dept_id ,dept_name,location)
values(101,'hr','chennai'),(102,'DA','madurai'),(102, 'hr','cbe');
insert into department(dept_id,dept_name)
values(104,'DA'),(105,'hr');

select * from department;
drop table department;

create table project(
proj_id int auto_increment primary key,
proj_name varchar(20),
dept_id int,
foreign key(dept_id) references department(dept_id),
budget bigint);

insert into project(proj_name,dept_id,budget)
values('app',101,120000),('app',102,120000),('app2',102, 200000),('app2',104,200000),('app3',105,3000000);

select * from project;
drop table project;

select emp_name from employees
where dept_id=(select dept_id from employees where emp_name ='john' );

select dept_name   from  department
where dept_id in (select dept_id  from employees where salary > 50000 );

select emp_name from employees
where salary = ( select min(salary) from employees);

select emp_name from employees
where manager_id =( select manager_id  from employees where emp_name ='alice');