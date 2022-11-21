select distinct quantity
from e_commerce.items;

select
  *
from e_commerce.items 
where quantity > 4;

select
  *
from e_commerce.items 
where quantity = 5;

select
  *
from e_commerce.items 
where quantity between 2 and 4;

select
  *
from e_commerce.customers 
where state = 'Acre' and email is not null;

select
  *
from e_commerce.customers 
where state = 'Acre' or state = 'São Paulo' and street is not null;
