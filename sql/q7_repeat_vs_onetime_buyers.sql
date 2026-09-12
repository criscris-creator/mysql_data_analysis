-- Q7: How many customers are repeat vs one-time buyers
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS num_orders
    FROM olist_orders
    WHERE order_status NOT IN ('canceled', 'unavailable')
    GROUP BY customer_id
)
SELECT
    CASE WHEN num_orders = 1 THEN 'One-time' ELSE 'Repeat' END AS buyer_type,
    COUNT(*) AS num_customers
FROM customer_orders
GROUP BY buyer_type;
