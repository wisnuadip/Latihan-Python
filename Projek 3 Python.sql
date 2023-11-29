WITH step1 AS
(
SELECT a.*, b.order_item_id, b.product_id, b.price
FROM fast_track_batch_1.orders_data AS a
JOIN fast_track_batch_1.order_items_data AS b
	ON a.order_id = b.order_id
),
step2 AS
(
SELECT a.*, b.customer_city, b.customer_state
	FROM step1 AS a
JOIN fast_track_batch_1.customer_data AS b
	ON a.customer_id =  b.customer_id
),
clean AS
(
SELECT a.order_id, a.order_item_id, a.product_id, a.price, a.order_purchase_timestamp, a.customer_city, 
	a.customer_state, b.product_category_name, a.order_status
FROM step2 AS a
JOIN fast_track_batch_1.product_data AS b
	ON a.product_id =  b.product_id
)
SELECT * FROM clean