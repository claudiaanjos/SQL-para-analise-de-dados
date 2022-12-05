#valor absoluto
select 1, -12, abs(1), abs(-12), abs(0);

#rand - números entre zero e um
select rand() as zero_um;

select rand() as zero_um, 10*rand() as zero_dez;

select *
from `e_commerce.customers`
order by rand() limit 10;

#raiz quadrada
select sqrt(4), sqrt(5), sqrt(100), sqrt(0);

#potência (base, expoente)
select pow(2,2), pow(2,3), pow(9, 1/2);

#log (base maior que 0 e diferernte de 1; valor maior que zero)
select log(10,10), log(49, 7);

#round (número que quero arredondar, quantas casas decimais)
select round(10.29635, 1), round(0.445694, 2);

select avg(price) as media_preco,
  round(avg(price),2) as media_preco_2,
  round(avg(price),0) as media_preco_3
from e_commerce.products; 

#mod - resto da divisão de um número pelo outro
select mod(10,2), mod(5,2), mod(10,4);

select *,
  case
    when mod(id,2) = 0 then 'par'
    when mod(id,2) != 0 then 'impar'
  end as  paridade
from e_commerce.categories;

#sin (seno - valores em radiano) pi = 3.1416
select sin(0), sin(3.1416/6), sin(3.1416/2);

#concat - concatena uma ou mais string
select 'Hello', 'World', concat('Hello', ' ', 'World') as frase;

select 
  concat(first_name, ' ', last_name) as sobrenome
from e_commerce.customers;

select
  id, 
  concat('Quantidade de itens: ', quantity, ' - ', 'Preço total: ', total_price) as info
from e_commerce.items;

#starts_with - verifica se a string começa com a segunda entrada (onde vamos procurar, qual o valor)
select starts_with('Homem Aranha', 'H'), starts_with('Homem Aranha', 'h'), starts_with('Homem Aranha', 'Homem');

select 
  id,
  first_name
from e_commerce.customers
where starts_with(first_name, 'Ma') is true;

select 
  id,
  first_name
from e_commerce.customers
where starts_with(first_name, 'Ma') is false;

#lower
select count(*)
from e_commerce.exemplo_estados
where lower(estado) = 'são paulo';

select lower(name) as nome_minusculo
from e_commerce.categories;

#upper
select count(*)
from e_commerce.exemplo_estados
where upper(estado) = 'SÃO PAULO';

#split - separa a string em uma ou mais string, baseando-se em um delimitador
select split('Você já está fera em SQL', ' ') as palavras;

select split('Você já está fera em SQL', ' ')[ordinal(1)] as parte_1,
  split('Você já está fera em SQL', ' ')[ordinal(2)] as parte_2,
  split('Você já está fera em SQL', ' ')[ordinal(3)] as parte_3;

select distinct
  split(email, '@')[ordinal(2)]
from e_commerce.customers;

#trim - remove os caracteres iniciais e finais da string correspondentes às segundas entradas
select trim('CPF: 123.456.78-9', 'CPF: '), trim('***(11) 9123456-7896***', '*'), trim(' Sao Paulo   ');

#replace
select 
  'Olá! Tudo bem?',
  replace('Olá! Tudo bem?', 'Olá', 'Oi') as frase;

select *,
  replace(name, ' e ', ' & ') as nome_diferente
from e_commerce.categories;

#char_length - retorna o comprimento da string
select distinct
  status,
  char_length(status)
from `e_commerce.orders`;

select count(id) as quantidade_cancelados
from `e_commerce.orders`
where char_length(status) = 9;
