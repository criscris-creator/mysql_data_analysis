-- Q5: Rank top 3 products within each category by revenue
WITH product_revenue AS (
    SELECT
        p.product_category_name AS category,
        oi.product_id,
        ROUND(SUM(oi.price), 2) AS total_revenue
    FROM olist_order_items oi
    INNER JOIN olist_products p
        ON oi.product_id = p.product_id
    INNER JOIN olist_orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status NOT IN ('canceled', 'unavailable')
    GROUP BY category, oi.product_id
),
ranked_products AS (
    SELECT
        category,
        product_id,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_revenue DESC
        ) AS rn
    FROM product_revenue
)
SELECT category, product_id, total_revenue, rn
FROM ranked_products
WHERE rn <= 3
ORDER BY category, rn;
