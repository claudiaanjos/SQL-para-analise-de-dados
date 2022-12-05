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
