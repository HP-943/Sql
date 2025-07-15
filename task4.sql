use new2;
delimiter //
create function total_price(price1 int,price2 int,price3 int,discount int)
returns int
deterministic
begin
declare totalprice int;
set totalprice=price1+price2+price3;
set totalprice=totalprice-(totalprice*discount/100);
return totalprice;
end //
delimiter ;

select  total_price( 22,56,98,12) as totalprice;
drop function total_price;
