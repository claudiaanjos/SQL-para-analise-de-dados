# Group By
select
  customer_id
from e_commerce.orders 
limit 10;

# Retorna os valores distintos
select
  customer_id
from e_commerce.orders 
group by customer_id;

# 1 quer dizer a primeira posição da coluna no select
select
  customer_id
from e_commerce.orders 
group by 1;

select
  date(created_at) as dia,
  count(id) as quantidade_pedidos
from e_commerce.orders 
group by dia;

select
  count(distinct product_id) as quantidade_produtos,
  order_id as pedido
from e_commerce.items 
group by 2;
