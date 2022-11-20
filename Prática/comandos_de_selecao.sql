select 
  1,
  2,
  'Olá!',
  "Oi!",
  1+8;

select
  id,
  created_at
from e_commerce.customers;

select
  order_id,
  quantity,
  total_price
from e_commerce.items
limit 3;

select distinct
  status
from e_commerce.orders;

select distinct
  state
from e_commerce.customers;

select distinct
  first_name
from `e_commerce.customers`;

select distinct
  extract(year from created_at) as ano
from e_commerce.orders;


  
