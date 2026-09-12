-- Q3: Month-over-month change in revenue
-- Builds on Q2's clean date range, then uses LAG() to compare
-- each month against the one before it.
WITH monthly AS (
    SELECT
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
        ROUND(SUM(p.payment_value), 2)                    AS monthly_revenue
    FROM olist_orders o
    INNER JOIN olist_order_payments p
        ON o.order_id = p.order_id
    WHERE o.order_status NOT IN ('canceled', 'unavailable')
        AND o.order_purchase_timestamp >= '2016-10-01'
        AND o.order_purchase_timestamp <  '2018-10-01'
    GROUP BY month
)
SELECT
    month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY month) AS prev_month_revenue,
    ROUND(
        monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month), 2
    ) AS mom_change,
    ROUND(
        (monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month))
        / LAG(monthly_revenue) OVER (ORDER BY month) * 100, 2
    ) AS mom_pct_change
FROM monthly
ORDER BY month;
