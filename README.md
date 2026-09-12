# Olist SQL Analysis

## Overview

Capstone project for the DataSense Analytics SQL Bootcamp, using the
public Olist Brazilian e-commerce dataset. Nine related tables covering
orders, payments, reviews, products, and sellers, roughly 1.45 million
rows total, spanning October 2016 through September 2018. Source:
[Olist Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).

| Table | Rows |
|---|---|
| olist_customers | — |
| olist_orders | 99,441 |
| olist_order_items | 112,650 |
| olist_order_payments | 103,886 |
| olist_order_reviews | 99,223 |
| olist_products | 32,951 |
| olist_sellers | 3,095 |
| olist_geolocation | 1,000,163 |
| product_category_name_translation | 71 |

## Business Questions

| # | Question | File |
|---|---|---|
| 1 | Top 10 customers by total amount spent | `sql/q1_top_customers.sql` |
| 2 | Monthly revenue trend across the dataset | `sql/q2_monthly_revenue_trend.sql` |
| 3 | Month-over-month change in revenue | `sql/q3_month_over_month_change.sql` |
| 4 | Which product categories generate the most revenue | `sql/q4_revenue_by_category.sql` |
| 5 | Top 3 products within each category by revenue | `sql/q5_top3_products_per_category.sql` |
| 6 | Customer spend tiers (Low / Medium / High) | `sql/q6_customer_spend_tiers.sql` |
| 7 | Repeat vs. one-time buyers | `sql/q7_repeat_vs_onetime_buyers.sql` |
| 8 | % of total revenue from the top category | `sql/q8_pct_revenue_top_category.sql` |

## Key Findings

- Every one of the 98,207 customers who placed a valid order did so
  exactly once — there is zero repeat purchasing in this dataset (Q1, Q7).
- The top 3 product categories (health & beauty, watches/gifts,
  bed/bath/table) account for roughly 26% of total revenue (Q4, Q8).
- Monthly revenue grew over 20x between October 2016 and April 2018, with
  normal month-to-month volatility along the way (Q2, Q3).

Full write-up with the required Data Overview, three business insights,
and two recommendations is in [`insights_summary.md`](insights_summary.md).

## Recommendations

1. **Test a second-purchase incentive.** Since no customer has ever placed
   a repeat order, a targeted post-purchase offer (discount code, free
   shipping) is worth testing before investing further in retention
   infrastructure.
2. **Prioritize the top revenue categories.** Health & beauty, gifts, and
   home goods drive about a quarter of all revenue — inventory and seller
   reliability should be prioritized there first, alongside testing
   promotion of adjacent categories.

## Tools & Skills

MySQL 8.0, MySQL Workbench, Command Line Client. JOINs, CTEs, subqueries,
and window functions (ROW_NUMBER, LAG, OVER/PARTITION BY).

## Files

```
├── README.md
├── insights_summary.md
└── sql/
    ├── q1_top_customers.sql
    ├── q2_monthly_revenue_trend.sql
    ├── q3_month_over_month_change.sql
    ├── q4_revenue_by_category.sql
    ├── q5_top3_products_per_category.sql
    ├── q6_customer_spend_tiers.sql
    ├── q7_repeat_vs_onetime_buyers.sql
    └── q8_pct_revenue_top_category.sql
```

## How to Run

Load the Olist CSVs into a MySQL database named `olist`, then run any
file directly:
```
mysql -u root -p olist < sql/q1_top_customers.sql
```
