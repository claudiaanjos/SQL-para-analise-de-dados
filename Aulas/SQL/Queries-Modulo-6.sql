# count
select
	count(*) as numero_linhas
from e_commerce.customers;

select 
	count(distinct status) as status_distintos
from e_commerce.orders;

select
	count(id) as numero_pedidos,
	format_timestamp("%Y-%m", created_at) as mes
from e_commerce.orders
group by mes
order by mes ASC;

select
	count(id) as numero_usuarios,
	format_timestamp("%Y", created_at) as ano
from e_commerce.customers
group by 2
order by 2 ASC;

select 
	count(case when state = 'Acre' then id end) as numero_usuarios_acre,
	format_timestamp("%Y", created_at) as ano
from e_commerce.customers
group by 2;

# MAX
select 
  MAX(PRICE) as preco_maximo
from e_commerce.products;

select 
  max(price) as preco_maximo,
  c.name
from e_commerce.products p
join e_commerce.categories c on c.id = p.category_id
group by 2;

select
  MAX(created_at) as ultima_compra_em,
  customer_id
from e_commerce.orders
group by customer_id
order by customer_id;

select 
  MAX(case when c.name = 'Moda e Acessórios' then price end) as preco_maximo
from e_commerce.products p
join e_commerce.categories c on c.id = p.category_id;

# MIN
select 
  MIN(PRICE) as preco_minimo
from e_commerce.products;

select 
  min(price) as preco_minimo,
  max(price) as preco_maximo,
  c.name
from e_commerce.products p
join e_commerce.categories c on c.id = p.category_id
group by 3;

select
  min(created_at) as primeira_compra_em,
  max(created_at) as ultima_compra_em,
  customer_id
from e_commerce.orders
group by customer_id
order by customer_id;

select 
  min(case when c.name = 'Moda e Acessórios' then price end) as preco_minimo
from e_commerce.products p
join e_commerce.categories c on c.id = p.category_id;

# SUM
select
  sum(total_price) as venda_total
from e_commerce.items i;

select
  sum(IF(state = 'Acre', 1, 0)) as usuarios_acre
from e_commerce.customers;

select 
  sum(total_price) as venda_total,
  date(created_at) as dia
from e_commerce.items i 
join e_commerce.orders o on o.id = i.order_id
group by 2
order by 2 asc;

# avg (average)
select 
  avg(total_confirmed_cases) as casos_confirmados
from `bigquery-public-data`.covid19_italy.data_by_region;

select 
  round(avg(total_confirmed_cases), 2) as casos_confirmados,
  region_name
from `bigquery-public-data`.covid19_italy.data_by_region
group by 2
order by 1 desc;

# 1)	Retorne em uma só consulta os valores de média, máximo, mínimo, contagem e soma do campo ‘total_price’ da tabela items.
select 
  avg(total_price) as preco_medio,
  max(total_price) as preco_maximo,
  min(total_price) as preco_minimo,
  count(total_price) as preco_contagem,
  sum(total_price) as preco_soma
from e_commerce.items;

# 2)	Retorne a quantidade de pedidos de cada status por dia, ordenando pelo dia, de forma decrescente.
select 
  count(id) as quantidade_pedidos,
  status,
  date(created_at) as dia
from e_commerce.orders
group by status, dia
order by dia desc;

# 3)	Retorne a quantidade total de itens por pedido.
select 
  sum(quantity) soma_itens,
  order_id
from e_commerce.items
group by 2;

# 4)	Na base de dados ‘covid19_italy’ e tabela ‘data_by_region’ encontre a coluna ‘tests_performed’. Retorne a soma de testes realizados por dia (considerando todas as regiões).
select
  sum(tests_performed) as quantidade_testes,
  date(date) as dia
from `bigquery-public-data`.covid19_italy.data_by_region
group by dia
order by dia asc;

# 5)	DESAFIO: Retorne a diferença da soma de recuperados (coluna recovered) com a soma de mortes (coluna deaths) por dia, apenas para a região Toscana.
select
  sum(recovered) - sum(deaths) as diferenca,
  date(date) as dia
from `bigquery-public-data`.covid19_italy.data_by_region
where region_name = 'Toscana'
group by dia
order by dia asc;
