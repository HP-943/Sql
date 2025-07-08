use new;
create table users(
user_id int unique primary key,
name varchar(20) unique not null,
email varchar(20) unique not null,
password varchar(20) not null,
age int check(age >= 13),
country varchar(30) default 'USA');

insert into users(user_id,name,email,password,age,country)
values(1,'anu','anu23@gmail.com',1234,15,'India'),(2,'priya','priya23@gmail.com',6789,21,'india');

insert into users(user_id,name,email,password,age)
values(3,'suriya','suriya23@gmail.com',1739,19),(4,'mano','mano68@gmail.com',6459,26);

select * from users;
