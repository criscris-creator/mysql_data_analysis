-- Q4: Which product categories generate the most revenue
-- Category names are left in Portuguese (as stored in olist_products)
-- to keep the query within taught JOIN/GROUP BY logic.
SELECT
    p.product_category_name AS category,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS num_orders,
    COUNT(oi.order_item_id)     AS num_items
FROM olist_order_items oi
INNER JOIN olist_products p
    ON oi.product_id = p.product_id
INNER JOIN olist_orders o
    ON oi.order_id = o.order_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 20;
