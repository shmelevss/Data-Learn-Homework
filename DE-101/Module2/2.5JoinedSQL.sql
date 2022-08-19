SELECT 
	f.sales_id,
	f.order_date_id,
	f.ship_date_id,
	f.order_id,
	f.sales,
	f.profit,
	f.quantity,
	f.discount,
	rd.returned,
	gd.country,
	gd.city,
	gd.state,
	gd.region,
	gd.postal_code,
	p.person,
	cd.YEAR,
	cd.quarter,
	cd.MONTH,
	cd.week,
	cd.date,
	cud.customer_id,
	cud.customer_name,
	pd.product_id,
	pd.product_name,
	pd.category,
	pd.sub_category,
	pd.segment,
	sd.shipping_mode
FROM 
	dw.sales_fact AS f
	LEFT JOIN dw.returns_dim AS rd
		ON f.order_id = rd.order_id 
	JOIN dw.geo_dim AS gd
		ON f.geo_id = gd.geo_id 
	JOIN stg.people AS p
		ON gd.region = p.region
	JOIN dw.calendar_dim AS cd 
		ON f.order_date_id = cd.dateid
	JOIN dw.customer_dim AS cud 
		ON f.cust_id = cud.cust_id
	JOIN dw.product_dim AS pd 
		ON f.prod_id = pd.prod_id 
	JOIN dw.shipping_dim AS sd
		ON f.ship_id = sd.ship_id;

