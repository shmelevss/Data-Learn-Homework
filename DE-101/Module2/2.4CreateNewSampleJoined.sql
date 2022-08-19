SELECT
	*
INTO
	new_sample.new_sample_joined
FROM
	(SELECT o.row_id,
	    o.order_id,
	    o.order_date,
	    o.ship_date,
	    o.ship_mode,
	    o.customer_id,
	    o.customer_name,
	    o.segment,
	    o.country,
	    o.city,
	    o.state,
	    o.postal_code,
	    o.region,
	    o.product_id,
	    o.category,
	    o.subcategory,
	    o.product_name,
	    o.sales,
	    o.quantity,
	    o.discount,
	    o.profit,
	    p.person,
	    COALESCE(t1.returned, 'No'::character varying) AS returned
	   FROM orders o
	     JOIN people p ON o.region::text = p.region::text
	     LEFT JOIN ( SELECT returns.returned,
	            returns.order_id
	           FROM returns
	          GROUP BY returns.order_id, returns.returned) t1 ON o.order_id::text = t1.order_id::TEXT) AS p;