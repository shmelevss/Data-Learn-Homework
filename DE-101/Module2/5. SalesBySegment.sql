select coalesce(segment, 'Total') as segment,
round(sum(case when date_part('year', order_date) = 2016 then sales else 0 end),0) "2016",
round(sum(case when date_part('year', order_date) = 2017 then sales else 0 end),0) "2017",
round(sum(case when date_part('year', order_date) = 2018 then sales else 0 end),0) "2018",
round(sum(case when date_part('year', order_date) = 2019 then sales else 0 end),0) "2019"
from orders
group by rollup(segment)
order by segment
