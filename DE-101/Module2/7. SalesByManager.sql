select coalesce(person,'Total') as person, round(sum(sales),0), round(sum(profit),0)
from view1
group by rollup(person)
order by person