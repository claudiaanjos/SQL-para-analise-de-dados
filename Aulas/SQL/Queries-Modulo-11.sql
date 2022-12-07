# JOIN
SELECT DISTINCT
  a.user_id as user_id_tabela_a,
  c.user_id as user_id_tabela_c,
  a.user_name
FROM banco_teste.acessos a
JOIN banco_teste.compras c on a.user_id = c.user_id

# LEFT JOIN
SELECT DISTINCT
  a.user_id as user_id_tabela_a,
  c.user_id as user_id_tabela_c,
  a.user_name,
  c.price
FROM banco_teste.acessos a
LEFT JOIN banco_teste.compras c on a.user_id = c.user_id

# LEFT JOIN (SOMENTE ESQUERDA)
SELECT DISTINCT
  a.user_id as user_id_tabela_a,
  c.user_id as user_id_tabela_c,
  a.user_name,
  c.price
FROM banco_teste.acessos a
LEFT JOIN banco_teste.compras c on a.user_id = c.user_id
WHERE c.user_id is null

# RIGHT JOIN
SELECT DISTINCT
  a.user_id as user_id_tabela_a,
  c.user_id as user_id_tabela_c,
  c.user_name,
  c.price,
  a.type
FROM banco_teste.acessos a
RIGHT JOIN banco_teste.compras c on a.user_id = c.user_id

# RIGHT JOIN (SOMENTE DIREITA)
SELECT DISTINCT
  a.user_id as user_id_tabela_a,
  c.user_id as user_id_tabela_c,
  c.user_name,
  c.price,
  a.type
FROM banco_teste.acessos a
RIGHT JOIN banco_teste.compras c on a.user_id = c.user_id
WHERE a.user_id IS NULL

# FULL JOIN
SELECT DISTINCT
  a.user_id as user_id_tabela_a,
  c.user_id as user_id_tabela_c,
  c.user_name as nome_tabela_c,
  a.user_name as nome_tabela_a,
  c.price,
  a.type
FROM banco_teste.acessos a
FULL JOIN banco_teste.compras c on a.user_id = c.user_id

# FULL JOIN (SEM INTERSECÇÃO)
SELECT DISTINCT
  a.user_id as user_id_tabela_a,
  c.user_id as user_id_tabela_c,
  c.user_name as nome_tabela_c,
  a.user_name as nome_tabela_a,
  c.price,
  a.type
FROM banco_teste.acessos a
FULL JOIN banco_teste.compras c on a.user_id = c.user_id
WHERE a.user_id IS NULL OR c.user_id IS NULL

# FULL JOIN: EXEMPLO 2
select distinct
  a.user_id as user_id_tabela_a,
  c.user_id as user_id_tabela_c,
  u.id as user_id_tabela_u,
  c.user_name as user_name_tabela_c,
  a.user_name as user_name_tabela_a,
  c.price,
  a.type,
  u.user_name as user_name_tabela_u
from banco_teste.acessos a
full join banco_teste.compras c on a.user_id = c.user_id
full join banco_teste.usuarios u on coalesce(a.user_id, c.user_id) = u.id;