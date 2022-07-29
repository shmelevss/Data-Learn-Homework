select coalesce(date_part('year', order_date)::text, 'Total') as order_date, round(sum(sales),0) as sales,
round(sum(profit),0) as profit, round(sum(profit)/sum(sales),2) as profit_ratio,
round(avg(discount),2)
from view1
group by rollup(date_part('year', order_date))
order by date_part('year', order_date)

