select coalesce(category, 'Total') as category, round(sum(sales),0), round(sum(profit),2)
from orders
group by rollup(category)
order by category