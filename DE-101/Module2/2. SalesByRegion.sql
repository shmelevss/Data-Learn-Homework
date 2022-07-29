select coalesce (region, 'Total') as region, round(sum(sales),0)
from view1
group by rollup (region)
