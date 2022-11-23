## select 

SELECT
  1,
  2,
  'OLÁ',
  "OLÁ",
  1+8,
  2/10;

select
  id,
  created_at
from e_commerce.customers;

select
  order_id,
  quantity, 
  total_price
from e_commerce.items;

select
  order_id,
  quantity, 
  total_price
from e_commerce.items
limit 3;

# Distinct
select distinct
  status
from e_commerce.orders;

select distinct
  state
from e_commerce.customers;

select distinct 
  first_name
from e_commerce.customers;

select distinct 
  extract(year from created_at) as ano
from e_commerce.orders;

## Aritméticos 
select 
  1 + 1 as soma,
  5 - 4 as subtracao,
  7 * 2 as multiplicacao,
  10/2 as divisao;
  
## Comparação
select
  1=1,
  3 > 4,
  4 > 4,
  7 < 10,
  11 <= 6;
  
# between
select 
  2 between 0 and 10,
  -4 between 0 and 25;
  
select
  *
from e_commerce.products
where price between 10 and 50;

# like
select 
  first_name
from e_commerce.customers
where first_name like 'M%';

# like
select 
  *
from e_commerce.customers
where first_name like '%m%' or first_name like 'M%';

# like
select
  *
from e_commerce.customers
where state like '%o';

# in
select
  *
from e_commerce.customers
where state in ('Alagoas', 'Piauí');

select 
  *
from e_commerce.products
where price in (75, 10, 15);

# is null
select 
  *
from e_commerce.customers
where email is null;

# is not null
select 
  *
from e_commerce.customers
where email is not null;

# is true
select
  * 
from `bigquery-public-data`.chicago_crime.crime
where arrest is true;

# is false
select
  * 
from `bigquery-public-data`.chicago_crime.crime
where arrest is false;

# apelidos
select 
  1 + 2 as somaaaaa,
  7 - 1000 as diferenca;
  
select 
  id,
  name as nome_da_categoria
from e_commerce.categories;

select 
  i.id,
  i.order_id,
  i.product_id as produto
from e_commerce.items as i;

# where
select distinct 
  quantity
from e_commerce.items;

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
where (state = 'Acre' or state = 'São Paulo') and street is not null;

select 
  * 
from e_commerce.orders
where status in ('entrega_pendente', 'cancelado');

# case
select 
  id,
  name,
  case when name = 'Moda e Acessórios' then 'Sim, é moda e Acessórios' end as caso1
from e_commerce.categories;

select 
  id,
  name,
  case 
    when name = 'Moda e Acessórios' then 'Sim, é moda e Acessórios' 
    when name = 'Livros' then 'Sim, é Livros' 
    else 'Não encontrado' 
  end as caso1
from e_commerce.categories;

select 
  id,
  case 
    when id between 0 and 5 then 'Primeiro Verdadeiro'
    when id between 3 and 5 then 'Segundo Verdadeiro'
    when id between 3 and 7 then 'Terceiro Verdadeiro'
  end as caso2,
  name
from e_commerce.categories;

select distinct
  state,
  case 
    when state in ('São Paulo','Rio de Janeiro','Minas Gerais','Espírito Santo') then 'Sudeste'
    else 'Demais Regiões'
   end as regiao
from e_commerce.customers
where state is not null;

# if
select
  id,
  name,
  if(name = 'Moda e Acessórios', 'Sim, é moda e Acessórios', 
    if(name = 'Livros', 'Sim, é Livros', 'Não encontrado')) as if2
from e_commerce.categories;

select
  id,
  name,
  if(id between 0 and 5, 'Entre 0 e 5', 'Maior que 5') as if1,
    
  if(name = 'Moda e Acessórios', 'Sim, é moda e Acessórios', 
    if(name = 'Livros', 'Sim, é Livros', 'Não encontrado')) as if2
from e_commerce.categories;

# coalesce
select 
  id,
  first_name,
  email,
  state,
  coalesce(state, null, 'Opa, estado nulo') as state_modificado
from e_commerce.customers;

select 
  id,
  first_name,
  email,
  state,
  coalesce(state, null) as state_modificado
from e_commerce.customers;

select 
  id,
  first_name,
  email,
  state,
  number,
  additionals,
  coalesce(cast(number as string), additionals) as primeiro_nulo,
  coalesce(cast(number as string), additionals, 'Não encontrado') as primeiro_nulo_2
from e_commerce.customers;

# GROUP BY 
select
 customer_id
from e_commerce.orders 
group by customer_id;

select
  CUSTOMER_ID
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

# ORDER BY
select
  *
from e_commerce.categories
order by id desc;

select
  *
from e_commerce.categories
order by id asc;

select 
  *
from e_commerce.orders
order by customer_id asc, status desc;

select
 customer_id
from e_commerce.orders 
group by customer_id
order by 1 desc;

select 
  date(created_at) as dia,
  count(id) as quantidade_pedidos
from e_commerce.orders
group by dia
order by quantidade_pedidos desc;

select 
  date(created_at) as dia,
  count(id) as quantidade_pedidos
from e_commerce.orders
group by dia
order by dia desc;

select
  count(distinct product_id) as quantidade_produtos,
  order_id as pedido
from e_commerce.items
group by 2
order by quantidade_produtos asc;

# JOIN
select 
  i.id as item_id,
  i.order_id,
  i.quantity,
  i.total_price,
  i.product_id,
  p.id,
  p.name
from e_commerce.items as i
join e_commerce.products as p on i.product_id = p.id

# RESOLUÇÃO DOS EXERCÍCIOS

# 1)  Quero como resultado uma tabela que contenha o id, país e estado de todos os nossos clientes.
select 
  id,
  country,
  state
from e_commerce.customers;

# 2)  Selecione os preços distintos de nossos produtos, mas ordenados de forma decrescente, utilizando o DISTINCT e ORDER BY.
select distinct
  price
from e_commerce.products
order by 1 desc;

# 3)  Retorne a data (naquele formato ANO-MÊS-DIA) de criação dos primeiros 5 registros da tabela customers.
select 
  date(created_at) as dia
from e_commerce.customers
limit 5;

# 4)  O time de marketing deseja fazer uma campanha em um estado específico. Para isso, eles te pedem os e-mails de todos os clientes que moram no Piauí.
select
  id,
  email
from e_commerce.customers
where state = 'Piauí';

# 5)  Vá até a tabela items e retorne o campo ‘total_price’ de forma distinta, mas utilizando o GROUP BY.
select 
  total_price
from e_commerce.items
group by total_price;

# 6)  Selecione todos os pedidos em que o status é cancelado OU entrega_pendente. Retorne também o mesmo resultado, mas utilizando o operador IN.
select
  *
from e_commerce.orders
where status = 'entrega_pendente' or status = 'cancelado';

select
  *
from e_commerce.orders
where status in ('entrega_pendente', 'cancelado');

# 7)  Retorne todos os registros em que o campo ‘additionals’ é nulo na tabela customers.
select 
  *
from e_commerce.customers
where additionals is null;

# 8)  Utilize o join para trazer a informação de status do pedido juntamente das informações (colunas) da tabela de itens.
select
  i.*,
  o.status
from e_commerce.items as i
join e_commerce.orders as o on i.order_id = o.id;

# 9)  Na tabela de pedidos, além das colunas existentes, quero também informações de nome do cliente e seu telefone.
select
  o.*,
  c.first_name,
  c.cell_phone
from e_commerce.orders as o 
join e_commerce.customers as c on c.id = o.customer_id;

# 10) DESAFIO: Pesquise sobre o comando like e retorne os nomes dos produtos que tenham somente 4 caracteres.
select
  name
from e_commerce.products
where name like '____';

