# Olist E-Commerce Analysis — Insight Summary

## Data Overview

This analysis uses the Olist Brazilian e-commerce dataset: nine related
tables covering orders, payments, reviews, products, and sellers, totaling
roughly 1.45 million rows. Orders span October 2016 through September
2018. No orders were recorded in November 2016, which slightly distorts
month-over-month figures around that date but doesn't affect the broader
findings below.

## Business Insight 1: There is no repeat purchasing on this platform

The top 10 customers by spend all placed exactly one order each, from
R$13,664.08 down to R$4,681.78 (Q1). That pattern holds across the entire
customer base: of 98,207 customers who placed a valid order, zero placed a
second one (Q7). This isn't a segment behaving differently from
average — repeat purchasing simply doesn't exist in this dataset, making it
a structural trait of the platform rather than a fixable customer habit.

## Business Insight 2: Revenue is concentrated in a few categories

The top category, health and beauty, brings in R$1,255,695.13 alone — 9.31%
of total revenue. Adding the next two, watches/gifts and bed/bath/table,
brings the top three to roughly 26% of all revenue (Q4, Q8). The same
pattern shows up within categories: in agro_industria_e_comercio, the
top product earned R$24,229.03, more than triple the third-ranked
product's R$7,152.00 (Q5). Demand shifts in a small handful of categories
and products could meaningfully move total revenue.

## Business Insight 3: Growth has been strong but uneven

Monthly revenue grew from R$51,657.53 in October 2016 to R$1,156,303.91 by
April 2018 — over 20x growth (Q2). That growth wasn't linear: several
months swung between double-digit gains and pullbacks, including a -26.5%
drop from December 2017 to January 2018 (Q3). Overall, the business scaled
quickly in its first two years, with normal volatility along the way.

## Recommendation 1: Test a second-purchase incentive

Since no customer in the dataset has ever placed a repeat order, a
targeted post-purchase offer — a discount code or free shipping on the
next order — would be new territory worth testing before investing further
in retention infrastructure.

## Recommendation 2: Prioritize the top revenue categories

With health and beauty, gifts, and home goods driving about a quarter of
all revenue, Olist should prioritize inventory and seller reliability
there first, while testing promotion of adjacent categories to reduce
reliance on any single product line.
