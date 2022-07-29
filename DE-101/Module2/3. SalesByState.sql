select coalesce (state, 'zTotal') as state, round(sum(sales),0)
from view1
group by rollup(state)
order by state