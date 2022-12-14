# FIRST_VALUE
select
  customer_id,
  created_at,
  first_value(created_at) over(partition by customer_id order by created_at asc) as primeira_compra,
  timestamp_diff(created_at, first_value(created_at) over(partition by customer_id order by created_at asc), day) as dias_desde_primeira_compra
from e_commerce.orders
where status = 'entregue'
order by 1,2;

# LAST_VALUE
select
  customer_id,
  created_at,
  last_value(created_at) over(partition by customer_id order by created_at 
  		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as ultima_compra
from e_commerce.orders
where status = 'entregue'
order by 1,2;

# LEAD
select
  customer_id,
  created_at,
  lead(created_at) over(partition by customer_id order by created_at) as data_proxima_compra
from e_commerce.orders
where status = 'entregue'
order by 1,2;

# LAG
select
  customer_id,
  round(avg(dias_desde_compra_anterior), 2) as tempo_medio_entre_uma_compra_e_outra
from(
  select
    customer_id,
    created_at,
    LAG(created_at) over(partition by customer_id order by created_at) as data_compra_anterior,
    TIMESTAMP_DIFF(created_at, LAG(created_at) over(partition by customer_id order by created_at), DAY) as dias_desde_compra_anterior 
  from e_commerce.orders
  where status = 'entregue'
  order by 1,2)
group by 1;

# RANK
select
  customer_id,
  created_at,
  RANK() over(partition by customer_id order by created_at asc) as rank
from e_commerce.orders
where status = 'entregue'
order by 1,2;

# ROW_NUMBER
select
  CATEGORY_ID,
  RANK() over(order by CATEGORY_ID asc) as rank,
  ROW_NUMBER() over(order by CATEGORY_ID asc) as numero_linha
from e_commerce.products;

# FUNÇÕES DE AGREGAÇÃO
select
  customer_id,
  created_at,
  min(created_at) over(partition by customer_id) as primeira_compra,
  max(created_at) over(partition by customer_id) as ultima_compra,
  count(created_at) over(partition by customer_id) as numero_compras
from e_commerce.orders
where status = 'entregue'
order by 1,2;
