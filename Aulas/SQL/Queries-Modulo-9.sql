# date
select
  date(2020, 06, 12) as data,
  current_timestamp,
  date(current_timestamp),
  date(current_timestamp, "America/Sao_Paulo"),
  date(current_datetime) as datetime_,
  #date(current_datetime, "America/Sao_Paulo")
;

select 
  id,
  created_at,
  date(created_at) as data
from e_commerce.customers;

select
  count(distinct id) as num_pedidos,
  date(created_at) as dia
from e_commerce.orders 
group by dia
order by dia;

select
  count(distinct id) as num_pedidos,
  created_at as dia
from e_commerce.orders 
group by dia
order by dia;

# datetime
select
  datetime(2020,06,12,21,05,03) as date_and_time,
  current_timestamp as coluna2,
  datetime(current_timestamp) as coluna3,
  datetime(current_timestamp, "America/Sao_Paulo") as coluna4,
  datetime(current_date);
  
select 
  id,
  created_at,
  datetime(created_at) as date_and_time,
  datetime(created_at, "America/Sao_Paulo") as date_and_time_2
from e_commerce.customers;

# timestamp
select
  timestamp("2008-12-25 15:30:00") as exemplo_1,
  timestamp("2008-12-25 15:30:00 America/Sao_Paulo") as exemplo_2,
  timestamp("2008-12-25 15:30:00", "America/Sao_Paulo") as exemplo_3,
  timestamp(current_datetime) as exemplo_4,
  timestamp(current_date) as exemplo_5,
  current_timestamp,
  timestamp(current_datetime("America/Sao_Paulo")) as exemplo_6,
  timestamp(current_date("America/Sao_Paulo")) as exemplo_7;

# current_date, current_datetime, current_timestamp
select
  current_date as exemplo1,
  current_date() as exemplo2,
  current_date("America/Sao_Paulo") as exemplo3,
  current_date("Asia/Tokyo") as exemplo4,
  current_datetime as exemplo5,
  current_datetime() as exemplo6,
  current_datetime("Asia/Tokyo") as exemplo7,
  current_datetime("America/Sao_Paulo") as exemplo8,
  current_timestamp as exemplo9,
  current_timestamp() as exemplo10,
  #current_timestamp("America/Sao_Paulo") as exemplo11
 ;
 
select 
  * 
from `bigquery-public-data`.covid19_italy.data_by_region
where date(date) = current_date;

# extract
select
  current_date as exemplo1,
  extract(year from current_date) as exemplo_2,
  extract(month from current_date) as exemplo_3,
  extract(dayofweek from current_date) as exemplo_4,
  current_timestamp as exemplo_5,
  extract(hour from current_timestamp) as exemplo_6,
  extract(hour from current_timestamp AT TIME ZONE "America/Sao_Paulo") as exemplo_7,
  extract(second from current_timestamp AT TIME ZONE "America/Sao_Paulo") as exemplo_8,
  extract(date from current_timestamp AT TIME ZONE "America/Sao_Paulo") as exemplo_9,
  extract(time from current_timestamp AT TIME ZONE "America/Sao_Paulo") as exemplo_10,
;

select
  count(distinct id) as num_pedidos,
  extract(dayofweek from created_at) as dia_da_semana,
  case 
    when extract(dayofweek from created_at) = 1 then "Domingo"
    when extract(dayofweek from created_at) = 2 then "Segunda"
    when extract(dayofweek from created_at) = 3 then "Terça"
    when extract(dayofweek from created_at) = 4 then "Quarta"
    when extract(dayofweek from created_at) = 5 then "Quinta"
    when extract(dayofweek from created_at) = 6 then "Sexta"
    when extract(dayofweek from created_at) = 7 then "Sábado"
 end as dia_semana
from e_commerce.orders
group by 2, 3
order by 2;

# DATE_ADD, DATETIME_ADD, TIMESTAMP_ADD
select
  current_date as exemplo1,
  date_add(current_date, interval 2 day) as exemplo2,
  date_add(current_date, interval 1 month) as exemplo3,
  date_add(current_date, interval 1 year) as exemplo4,
  current_timestamp as exemplo5,
  timestamp_add(current_timestamp, interval 3 hour) as exemplo6,
  datetime_add(current_datetime, interval 3 hour) as exemplo7,
  date_add(DATE(2020,01,01), interval 2 day) as exemplo8,
  date_add(DATE '2020-01-01', interval 2 day) as exemplo9,
  ;

SELECT
 *
FROM `bigquery-public-data`.covid19_italy.data_by_region
where date(date) between date(2020,07,05) and date_add(date(2020,07,05), interval 3 day);

# DATE_SUB, DATETIME_SUB, TIMESTAMP_SUB
select
  current_date as exemplo1,
  date_sub(current_date, interval 2 day) as exemplo2,
  date_sub(current_date, interval 1 month) as exemplo3,
  date_sub(current_date, interval 1 year) as exemplo4,
  current_timestamp as exemplo5,
  timestamp_sub(current_timestamp, interval 3 hour) as exemplo6,
  datetime_sub(current_datetime, interval 3 hour) as exemplo7,
  date_sub(DATE(2020,01,01), interval 2 day) as exemplo8,
  date_sub(DATE '2020-01-01', interval 2 day) as exemplo9;
  
select
  *
from e_commerce.orders 
where date(created_at) between date_sub(current_date, interval 365 day) and current_date;

# DATE_DIFF, DATETIME_DIFF, TIMESTAMP_DIFF
SELECT
  date_diff('2020-08-05', '2020-08-01', day) as exemplo1,
  datetime_diff('2020-08-05T17:00:00', '2020-08-05T14:00:00', HOUR) as exemplo2,
  timestamp_diff('2020-08-05T17:30:00', '2020-08-05T17:00:00', minute) as exemplo3
;

select
  c.id,
  min(timestamp_diff(o.created_at, c.created_at, day)) as dias_ate_primeira_compra
from e_commerce.customers c
join e_commerce.orders o on c.id = o.customer_id
group by 1;

# format_date, format_datetime, format_timestamp
select
  current_date() as exemplo1,
  format_date("%b %d", current_date()) as exemplo2,
  format_date("%Y-%m", current_date()) as exemplo3,
  format_date("%b %d, %A", current_date()) as exemplo4,
  format_date("%D", current_date()) as exemplo5,
  CURRENT_DATETIME() AS exemplo6,
  format_datetime('%T', current_datetime()) as exemplo7
;