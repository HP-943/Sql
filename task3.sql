create database new2;
use new2;


create table shop1(
vegname varchar(20),
price decimal(10,2));

create table shop2(
vegname varchar(30),
price decimal(10,2));

insert into shop1 values('potato',12.5),('tomato',14.5),('brinj',22.4),('mango',34.2);
insert into shop2 values('brinj',13.5),('mango',11.5),('carrot',22.2),('guard',55.1);

select shop1.vegname, shop1.price as amount, shop2.vegname, shop2.price as amount
from shop1 inner join shop2
on shop1.vegname=shop2.vegname;

select * from shop1;
select *from shop2;

select shop1.vegname, shop1.price, shop2.vegname, shop2.price
from shop1 left join shop2
on shop1.vegname=shop2.vegname;

select shop1.vegname, shop1.price as amount, shop2.vegname, shop2.price as amount
from shop1 right join shop2
on shop1.vegname=shop2.vegname;

truncate table shop1;
truncate table shop2;




create table customer(
c_Id int,
c_name varchar(20),
c_address varchar(100));

create table orders(
o_Id int,
c_Id int,
product varchar(40));


insert into customer values(1,'alice','newyork'),(2,'bob','chicago'),(3,'charlie','miami');
insert into orders values(101,1,'laptop'),(102,1,'mouse'),(103,2,'keyboard'),(104,4,'monitor');

truncate table customer;
truncate table orders;

drop table orders;
drop table customer;

select * from orders;
select * from customer;

select c.c_id,c.c_name,o.o_id,o.c_id
from customer as c left join orders as o
on c.c_id=o.c_id;


select c.c_name,o.product
from customer as c left join orders as o
on c.c_id=o.c_id;

select c.c_name,o.product
from customer as c inner join orders as o
on c.c_id=o.c_id;

select c.c_name,o.product 
from customer  as c left join orders as o 
on c.c_id=o.c_id;

select c.c_name,o.product
from customer as c inner join orders as o
on c.c_id=o.c_id where product ='mouse';


