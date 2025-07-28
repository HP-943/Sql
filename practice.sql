create database workout;
use workout;

create table work1(
id int auto_increment primary key,
name varchar(20),
age int check(age>=18),
dept_id int,
foreign key(dept_id) references department (dept_id));

create table department(
dept_id int  primary key,
dept char(10));

alter table work1 add salary bigint;
update work1 set salary=100000 where id in(1,3);
update work1 set salary=300000 where id in(2);


insert into work1(name,age,dept_id)
values('anu',20,101),('siva',21,102),('kavi',22,103),('moni',36,null);

insert into department(dept_id)
values(101),(102),(103),(104);
update department set dept='hr' where dept_id in  (101,103);
update department set dept='Fn' where dept_id in(102);
alter table department add salary bigint;
update department set salary =100000 where dept_id in(101,103);
update department set salary =200000 where dept_id in(102,104);


select * from work1;
select * from department;
drop table department;
drop table work1;

select w.name, w.salary,d.dept,d.salary
from work1 as w right join department as d
on w.dept_id=d.dept_id;

select w.name, w.salary as emp_salary ,d.dept,d.salary as staff_salary
from work1 as w inner join department as d
on w.dept_id=d.dept_id;

select w.name, w.salary as emp_salary,d.dept,d.salary as staff_salary
from work1 as w left join department as d
on w.dept_id=d.dept_id;

select w.name, w.salary,d.dept,d.salary
from work1 as w cross join department as d;

select w.name, w.salary,d.dept,d.salary
from work1 as w right join department as d
on w.dept_id=d.dept_id
union 
select w.name, w.salary as emp_salary,d.dept,d.salary as staff_salary
from work1 as w left join department as d
on w.dept_id=d.dept_id;

select w.name, w.salary,d.dept,d.salary
from work1 as w right join department as d
on w.dept_id=d.dept_id
union all
select w.name, w.salary as emp_salary,d.dept,d.salary as staff_salary
from work1 as w left join department as d
on w.dept_id=d.dept_id;

select name from work1 where id=1 and salary=100000;
select name from work1 where id =1 or salary =300000;
select name from work1 where id != 2;
select dept from department where salary between 100000 and 200000;
select avg(salary),dept from department group by dept;
select sum(salary) from work1;
select name from work1  limit  2;
select max(salary) from work1;
select salary from work1  
group by salary 
having count(id) > 2;
#TASK

select * from work1
where salary >(select avg(salary) from work1) ;

select name from work1
where salary > (select max(salary) from work1 where dept_id=101);;

select p.*
from products p
where p.product_id not in (
    select distinct o.product_id
    from order_details o
)
and p.category_id in (
    select category_id
    from products
    where product_id in (
        select distinct product_id
        from order_details
    )
    group by category_id
    having count(distinct product_id) >= 3
);

select c.customer_id
from customers c
join orders o on c.customer_id = o.customer_id
where year(o.order_date) = 2024
group by c.customer_id
having count(distinct month(o.order_date)) = 12;

select e.*
from employees e
where salary = (
    select max(salary)
    from employees e2
    where e2.department_id = e.department_id
      and e2.salary < (
          select max(salary)
          from employees e3
          where e3.department_id = e.department_id
      )
);

select o.order_id, sum(od.quantity * od.unit_price) as total_amount
from orders o
join order_details od on o.order_id = od.order_id
group by o.order_id
having sum(od.quantity * od.unit_price) > (
    select avg(monthly_total)
    from (
        select o2.order_id, month(o2.order_date) as order_month,
               sum(od2.quantity * od2.unit_price) as monthly_total
        from orders o2
        join order_details od2 on o2.order_id = od2.order_id
        group by o2.order_id, month(o2.order_date)
        having month(o.order_date) = month(o2.order_date)
    ) t
);

select department_id
from employees
group by department_id
having count(*) > 5
   and avg(salary) = (
       select max(avg_salary)
       from (
           select department_id, avg(salary) as avg_salary
           from employees
           group by department_id
           having count(*) > 5
       ) t
   );

select distinct e1.*
from employees e1
join employees e2
  on e1.salary = e2.salary
 and e1.department_id <> e2.department_id;

select c.customer_id
from customers c
where not exists (
    select p.product_id
    from products p
    join categories cat on p.category_id = cat.category_id
    where cat.name = 'electronics'
    except
    select od.product_id
    from orders o
    join order_details od on o.order_id = od.order_id
    where o.customer_id = c.customer_id
);


select *
from (
    select e.*, 
           percentile_cont(0.5) within group (order by salary) over (partition by department_id) as dept_median
    from employees e
) sub
where salary > dept_median;

select department_id
from employees
group by department_id
having min(salary) > 50000;
select department_id
from employees
group by department_id
having max(salary) - min(salary) > 30000;

select *
from employees e
where (
    select count(*)
    from employees
    where department_id = e.department_id
) = 1;

select department_id
from employees
group by department_id
having avg(salary) > (
    select avg(salary)
    from employees
);


delimiter $$
create function pixie(mark1 int ,mark2 int )
returns int
deterministic
begin
return mark1 + mark2 ;
end $$
delimiter ;

select pixie(12,13)as total;
drop function pixie;

delimiter $$
create  procedure pixie1(in  mark1 int,in mark2 int,out total int)
begin
 set total=mark1+mark2;
 update department set total=total;
end $$
delimiter $$

call pixie1(12,13,total);3
select total as result;

CALL pixie1(12, 13, @total);      -- Use @total for OUT param
SELECT @total AS result;  
       -- View the output
drop procedure pixie1;


#task
