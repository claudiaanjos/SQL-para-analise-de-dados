# Join
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
limit 5;
