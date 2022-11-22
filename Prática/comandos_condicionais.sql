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
