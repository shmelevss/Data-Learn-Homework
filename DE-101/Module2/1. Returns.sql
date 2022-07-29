select coalesce (returned, 'Total') as returned, count(*)
from view1
group by rollup (returned)
order by count