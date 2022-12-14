# SUBQUERY como coluna
select
  u.id as user_id,
  u.user_name,
  (select
    count(a.id)
   from banco_teste.acessos a
   where a.user_id = u.id) as num_acessos,
from banco_teste.usuarios u
group by 1,2;

select
  u.id as user_id,
  u.user_name,
  count(a.id) as num_acessos,
from banco_teste.usuarios u
left join banco_teste.acessos a on a.user_id = u.id
group by 1,2;

# SUBQUERY como tabela
select
  avg(num_acessos) as media_acessos
from(
  select
    u.id as user_id,
    u.user_name,
    count(a.id) as num_acessos,
  from banco_teste.usuarios u
  left join banco_teste.acessos a on a.user_id = u.id
  group by 1,2);

SELECT 
  count(distinct o.id) as num_pedidos,
  customer_id
FROM e_commerce.orders o
JOIN (
  select distinct
    c.id
  from e_commerce.customers c
  where date(c.created_at) between '2018-01-01' and '2018-01-31') as T on T.id = o.customer_id
where status = 'entregue'
group by 2
order by 1 desc;

# SUBQUERY como filtro
select
  u.id as user_id,
  u.user_name,
  (select
    count(a.id)
   from banco_teste.acessos a
   where a.user_id = u.id) as num_acessos,
from banco_teste.usuarios u
where (select
    count(a.id)
   from banco_teste.acessos a
   where a.user_id = u.id) > 0
group by 1,2;

select
  u.id as user_id,
  u.user_name,
  (select
    count(a.id)
   from banco_teste.acessos a
   where a.user_id = u.id) as num_acessos,
from banco_teste.usuarios u
where (select
    count(a.id)
   from banco_teste.acessos a
   where a.user_id = u.id) = 0
group by 1,2;

