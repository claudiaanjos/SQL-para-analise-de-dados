select
  id,
  name,
  case when name = 'Moda e Acessórios' then 'Sim, é moda e acessórios' end as caso1
from e_commerce.categories;

select
  id,
  name,
  case 
    when name = 'Moda e Acessórios' then 'Sim, é moda e acessórios' 
    when name = 'Livros' then 'Sim, é livro' 
    else 'Não encontrado' 
  end as caso1
from e_commerce.categories;

# Retorna a ação do Primeiro Verdadeiro
select
  id,
  case
    when id between 0 and 5 then 'Primeiro Verdadeiro'
    when id between 3 and 5 then 'Segundo Verdadeiro'
  end as caso2,
  name
from e_commerce.categories;

select distinct
  state,
  case
    when state in ('São Paulo', 'Rio de Janeiro', 'Minas Gerais') then 'Sudeste'
    else 'Não encontrado'
  end as regiao
from e_commerce.customers 
where state is not null;

# If
select
  id,
  name,
  if (name = 'Moda e Acessórios','Sim, é moda e acessórios', null) as if1
from e_commerce.categories;

select
  id,
  name,
  if (name = 'Moda e Acessórios','Sim, é moda e acessórios', 'Não encontrado') as if2
from e_commerce.categories;

select
  id,
  name,
  if (name = 'Moda e Acessórios','Sim, é moda e acessórios', 
    if (name = 'Livros', 'Sim, é Livro', 'Não encontrado')) as if3
from e_commerce.categories;

select
  id,
  name,
  if (id between 0 and 5, 'Entre 0 e 5', 'Maior que 5') as if4,
  if (name = 'Moda e Acessórios','Sim, é moda e acessórios', 
    if (name = 'Livros', 'Sim, é Livro', 'Não encontrado')) as if5
from e_commerce.categories;

# Coalesce busca a primeira expressão não nula
select 
  id,
  first_name,
  email,
  state,
  coalesce(state, 'Opa, estado nulo') as state_modificado,
from e_commerce.customers;

# Exemplo de associação com Coalesce
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
