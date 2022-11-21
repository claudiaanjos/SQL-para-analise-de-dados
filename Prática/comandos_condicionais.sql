select
  id,
  name,
  case when name = 'Moda e Acessórios' then 'Sim, é moda e acessórios' end as caso1
from e_commerce.categories;
