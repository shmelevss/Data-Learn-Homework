create view view1 as
select row_id,o.order_id,order_date,ship_date,ship_mode,customer_id,customer_name,
segment,country,city,state,postal_code,o.region,product_id,category,subcategory,
product_name,sales,quantity,discount,profit,person,
coalesce(returned, 'No') as returned
from orders o 
join people p on o.region = p.region
left join (select * from returns group by order_id, returned) as t1
on o.order_id = t1.order_id






