-- Вставка данных в таблицу new_sample.calendar_dim
INSERT INTO 
	new_sample.calendar_dim
SELECT
	DISTINCT o.order_date,
	o.ship_date
FROM
	(SELECT
		order_date,
		ship_date
	FROM
		new_sample.new_sample_joined) AS o;

SELECT 
	*
FROM 
	new_sample.calendar_dim;

-- Вставка данных в таблицу new_sample.customer_dim
INSERT INTO 
	new_sample.customer_dim
SELECT
	p.customer_id,
	p.customer_name,
	p.segment
FROM 
	(SELECT
		DISTINCT customer_id,
		customer_name,
		segment
	FROM 
		new_sample.new_sample_joined) AS p;
		
SELECT 
	*
FROM 
	new_sample.customer_dim;

-- Вставка данных в таблицу new_sample.geo_dim

INSERT INTO new_sample.geo_dim
SELECT
	ROW_NUMBER() over(),
	d.city,
	d.state,
	d.region,
	d.country,
	d.postal_code,
	d.person
FROM 
	(SELECT
		DISTINCT postal_code,
		city,
		state,
		region,
		country,
		person
	FROM 
		new_sample.new_sample_joined) AS d;

SELECT 
	*
FROM 
	new_sample.geo_dim;

-- Вставка данных в таблицу new_sample.product_dim

INSERT INTO new_sample.product_dim
SELECT
	f.product_id,
	f.product_name,
	f.subcategory,
	f.category
FROM 
	(SELECT
		DISTINCT product_id,
		product_name,
		subcategory,
		category
	FROM 
		new_sample.new_sample_joined ORDER BY 1) AS f;

SELECT 
	DISTINCT product_id 
FROM 
	new_sample.product_dim;

-- Вставка данных в таблицу new_sample.ship_dim

INSERT INTO
	new_sample.ship_dim
SELECT
	ROW_NUMBER() over(),
	y.ship_mode
FROM 
	(SELECT
		DISTINCT ship_mode
	FROM 
		new_sample.new_sample_joined) AS y;

SELECT 
	*
FROM 
	new_sample.ship_dim;

-- Вставка данных в таблицу new_sample.sale_fact

INSERT INTO 
	new_sample.sale_fact
SELECT
	ROW_NUMBER() over(),
	j.order_id,
	j.returned,
	j.sales,
	j.quantity,
	j.discount,
	j.profit,
	pd.product_id,
	cd.customer_id,
	cad.order_date,
	cad.ship_date,
	sd.ship_id,
	gd.geo_id
FROM
	new_sample.new_sample_joined AS j
	LEFT JOIN new_sample.product_dim AS pd
		ON j.product_id = pd.product_id 
	LEFT JOIN new_sample.customer_dim AS cd 
		ON j.customer_id = cd.customer_id 
	LEFT JOIN new_sample.calendar_dim AS cad
		ON j.order_date = cad.order_date 
		AND j.ship_date = cad.ship_date 
	LEFT JOIN new_sample.ship_dim AS sd
		ON j.ship_mode = sd.ship_name 
	LEFT JOIN new_sample.geo_dim AS gd
		ON j.postal_code :: varchar(50) = gd.postal_code;

SELECT
	*
FROM 
	new_sample.sale_fact;





	
