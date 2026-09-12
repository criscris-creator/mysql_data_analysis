-- Q6: Segment customers into spend tiers (Low / Medium / High)
-- Customers are ranked by total spend, then split into equal thirds.
WITH customer_spend AS (
    SELECT
        c.customer_id,
        ROUND(SUM(p.payment_value), 2) AS total_spent
    FROM olist_customers c
    INNER JOIN olist_orders o
        ON c.customer_id = o.customer_id
    INNER JOIN olist_order_payments p
        ON o.order_id = p.order_id
    WHERE o.order_status NOT IN ('canceled', 'unavailable')
    GROUP BY c.customer_id
),
ranked_customers AS (
    SELECT
        customer_id,
        total_spent,
        ROW_NUMBER() OVER (ORDER BY total_spent DESC) AS spend_rank,
        COUNT(*) OVER ()                               AS total_customers
    FROM customer_spend
)
SELECT
    customer_id,
    total_spent,
    spend_rank,
    CASE
        WHEN spend_rank <= total_customers / 3       THEN 'High'
        WHEN spend_rank <= 2 * total_customers / 3    THEN 'Medium'
        ELSE 'Low'
    END AS spend_tier
FROM ranked_customers
ORDER BY total_spent DESC;
