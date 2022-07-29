select to_char(order_date, 'YYYY-MM') as date,
round(sum(sales),0) as sales,
round(sum(profit),0) as profit
from orders
group by date
order by date