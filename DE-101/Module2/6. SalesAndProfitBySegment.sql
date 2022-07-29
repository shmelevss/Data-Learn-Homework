select coalesce(segment,'Total') as segment, round(sum(sales),0), round(sum(profit),0)
from orders
group by rollup(segment)
order by segment