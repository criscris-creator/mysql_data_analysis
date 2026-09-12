-- Q2: Monthly revenue trend across the dataset
-- Excludes the first and last calendar months since both are partial
-- (data starts 2016-09-04 and ends 2018-10-17), which would otherwise
-- distort the trend.
SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(p.payment_value), 2)                    AS monthly_revenue,
    COUNT(DISTINCT o.order_id)                         AS num_orders
FROM olist_orders o
INNER JOIN olist_order_payments p
    ON o.order_id = p.order_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
    AND o.order_purchase_timestamp >= '2016-10-01'
    AND o.order_purchase_timestamp <  '2018-10-01'
GROUP BY month
ORDER BY month;
