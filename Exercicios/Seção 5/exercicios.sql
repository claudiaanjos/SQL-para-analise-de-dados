# Exercicios da secao 5

# 1
select
  id,
  country,
  state
from e_commerce.customers;

# 2
select distinct
  price
from e_commerce.products 
order by 1 desc;

# 3
select
  date(created_at) as dia
from e_commerce.customers
limit 5;

#4
select
  email
from e_commerce.customers
where state = 'Piauí';

#5
select distinct
  total_price
from e_commerce.items 
group by 1;

#6
select
  *
from e_commerce.orders 
where status = 'cancelado' or status = 'entrega_pendente';

select
  *
from e_commerce.orders 
where status in ('cancelado', 'entrega_pendente');

#7
select
  *
from e_commerce.customers 
where additionals is null;

#8
select 
  o.status as status_do_pedido,
  i.id,
  i.order_id,
  i.product_id,
  i.quantity,
  i.total_price
from e_commerce.orders as o
join e_commerce.items as i on i.order_id = o.id
limit 5;

#9
select 
  o.created_at,
  o.customer_id,
  o.id,
  o.status,
  c.cell_phone,
  c.first_name
from e_commerce.orders as o
join e_commerce.customers as c on o.customer_id = c.id
limit 5;

#10
select
  name
from e_commerce.products 
where name like '____';
