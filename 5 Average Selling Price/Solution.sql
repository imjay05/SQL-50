select 
 u.product_id,
 round(sum(u.units * p.price)/sum(u.units), 2) as average_price
from
 UnitsSold u
Join 
 Prices p
 on u.product_id = p.product_id
 and u.purchase_date between p.start_date and p.end_date
group by
 u.product_id

union 

select
 p.product_id,
 0 as average_price
from
 Prices p
where
 p.product_id not in (
    select distinct product_id from UnitsSold
 )
 group by
  p.product_id;
