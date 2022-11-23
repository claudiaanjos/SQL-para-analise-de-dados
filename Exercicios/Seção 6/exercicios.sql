# 1
select 
  avg(total_price) as media,
  max(total_price) as preco_max,
  min(total_price) as preco_min,
  count(total_price) as contagem,
  sum(total_price) as soma
from e_commerce.items;

# 2
select
  count(id) as quantidade_pedidos,
  status,
  date(created_at) as dia
from e_commerce.orders
group by 2, 3
order by 3 desc;

# 3
select 
  sum(quantity) soma_itens,
  order_id
from e_commerce.items
group by 2;

# 4
select 
  sum(tests_performed) as soma_testes,
  date(date) as dia
from `bigquery-public-data`.covid19_italy.data_by_region
group by 2
order by 2;

# 5
select
  sum(recovered) - sum(deaths) as diferenca,
  date(date) as dia
from `bigquery-public-data`.covid19_italy.data_by_region
where region_name = 'Toscana'
group by dia
order by dia asc;
