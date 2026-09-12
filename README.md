Olist Brazilian E-Commerce — SQL Analysis
Capstone project for the DataSense Analytics SQL Bootcamp. Uses the public
Olist Brazilian e-commerce dataset to answer eight business questions using
JOINs, subqueries, CTEs, and window functions.
Dataset
Nine tables imported into MySQL, covering orders placed between
September 2016 and October 2018:
Table	Rows
olist_customers	—
olist_orders	99,441
olist_order_items	112,650
olist_order_payments	103,886
olist_order_reviews	99,223
olist_products	32,951
olist_sellers	3,095
olist_geolocation	1,000,163
product_category_name_translation	71
Source: Olist Brazilian E-Commerce Public Dataset
Note: the first (Sep 2016) and last (Oct 2018) calendar months in the raw
data are partial, so monthly trend queries (Q2, Q3) exclude them to avoid
skewed numbers.
Questions Answered
#	File	Question
1	`sql/q1_top_customers.sql`	Top 10 customers by total amount spent
2	`sql/q2_monthly_revenue_trend.sql`	Monthly revenue trend across the dataset
3	`sql/q3_month_over_month_change.sql`	Month-over-month change in revenue
4	`sql/q4_revenue_by_category.sql`	Which product categories generate the most revenue
5	`sql/q5_top3_products_per_category.sql`	Top 3 products within each category by revenue
6	`sql/q6_customer_spend_tiers.sql`	Customer spend tiers (Low / Medium / High)
7	`sql/q7_repeat_vs_onetime_buyers.sql`	Repeat vs. one-time buyers
8	`sql/q8_pct_revenue_top_category.sql`	% of total revenue from the top category
Tools
MySQL 8.0, MySQL Workbench, Command Line Client.
Key Findings
Full write-up with the required Data Overview, three business insights, and
two recommendations is in `insights_summary.md`.
Short version: every one of the 98,207 customers in the dataset placed
exactly one order — there is no repeat purchasing at all — and revenue is
concentrated in a small number of product categories. Together these
point to a business built on one-time transactions rather than customer
loyalty.
How to Run
Load the Olist CSVs into a MySQL database named `olist` (see table names
above).
Run any file in `/sql` directly in MySQL Workbench or the command line:
```
   mysql -u root -p olist < sql/q1_top_customers.sql

   ```
   ```
