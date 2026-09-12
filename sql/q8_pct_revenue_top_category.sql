-- Q8: What % of total revenue comes from the top category
WITH category_revenue AS (
    SELECT
        p.product_category_name AS category,
        ROUND(SUM(oi.price), 2) AS category_total
    FROM olist_order_items oi
    INNER JOIN olist_products p
        ON oi.product_id = p.product_id
    INNER JOIN olist_orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status NOT IN ('canceled', 'unavailable')
    GROUP BY category
)
SELECT
    category,
    category_total,
    ROUND(category_total * 100.0 / SUM(category_total) OVER (), 2) AS pct_of_total_revenue
FROM category_revenue
ORDER BY category_total DESC
LIMIT 10;
