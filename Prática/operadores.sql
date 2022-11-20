# Aritméticos
select 
  1 + 1 as soma,
  5 - 4 as subtracao,
  7 * 2 as multiplicacao,
  10/2  as divisao;

# Comparação
select
  1 = 1,
  3 > 4,
  4 > 4,
  7 < 10,
  11 <= 6;

# Between
select
  2 between 0 and 10,
  -4 between 0 and 15;

select
  * 
from e_commerce.products
where price between 10 and 50;

# Like
select
  first_name
from e_commerce.customers
where first_name like '%m%';

select
  first_name
from e_commerce.customers
where first_name like 'M%';

select
  first_name
from e_commerce.customers
where first_name like '%m%' or first_name like 'M%';
