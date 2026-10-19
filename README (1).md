# What Drove AdventureWorks' 180% Revenue Growth?

**A financial analysis of 60,398 online sales records and the company's 2011 budget, using SQL Server and Tableau.**

👉 **[View the interactive Tableau dashboard](https://public.tableau.com/app/profile/sana.husain5685/viz/AdventureWorksRevenueMarginAnalysis/AdventureWorksDashboard)**

---

## The business question

AdventureWorks is a sample bike and gear retailer created by Microsoft. Its online revenue nearly tripled in 2013. This project answers:

- **What drove the growth:** price, volume, products, markets or customers?
- **Did profitability hold up?**
- **How did the company perform against its budget?**

## Key findings

| # | Finding | Evidence |
|---|---|---|
| 1 | **Revenue tripled in 2013** | $5.8M (2012) → $16.4M (2013); gross margin stayed at ~41% every year |
| 2 | **Growth came from volume, not price** | Bike units rose 4.4x (2,216 → 9,706), while the average price fell in every bike type (Road −60%, Mountain −46%) |
| 3 | **Mountain bikes protected the margin** | Mountain bikes earn a 45–46% margin, while Road bike margin slipped from 39.4% to 36.4% |
| 4 | **US & Australia = 63% of revenue** | Australia nearly matches the US with 29% fewer orders, thanks to the highest average order ($1,378) |
| 5 | **Repeat customers = 77% of revenue** | Only 37% of customers ordered more than once, but they spend 5–8x more than one-time buyers |
| 6 | **2011 profit missed budget by 35%** | Revenue beat budget by 4.5%, but costs ran $4.0M (25%) over plan. 89% of the overrun came from unbudgeted taxes ($1.86M) and people costs ($1.71M) |

## Recommendations

1. **Win the second purchase.** Follow-up offers after a first order, since repeat buyers spend 5x more.
2. **Push high-margin products.** Promote Mountain bikes (45% margin) and accessories (63%) to protect margin as prices fall.
3. **Grow order value in Canada.** It has many customers but the lowest average order ($615); bundle bikes with accessories.
4. **Fix the budget process.** Plan for taxes and build headcount budgets from realistic hiring assumptions.

## Data & approach

- **Data:** [AdventureWorksDW2025](https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks), Microsoft's sample data warehouse (`FactInternetSales`, `FactFinance` and related dimension tables)
- **Data check:** the data runs from 2010-12-29 to 2014-01-28, so 2010 (3 days) and 2014 (28 days) were **excluded as partial years**. Trend analysis uses 2011–2013 only.
- **Reconciliation:** the 29 account-level expense variances add up exactly to the $4,023,211 total overrun.
- **KPIs:** revenue, COGS, gross profit, gross margin %, units, orders, average order value, revenue share, budget variance and variance %

## SQL queries

| File | What it does | Techniques |
|---|---|---|
| `01_revenue_margin_by_year.sql` | Revenue, COGS, gross profit and margin by year | Joins, aggregation |
| `02_date_range_check.sql` | First and last order dates; finds the partial years | Data validation |
| `03_revenue_by_category.sql` | Revenue and margin by product category | Multi-table joins, filtering |
| `04_bike_type_breakdown.sql` | Units, average price and margin by bike type | Grouping by subcategory |
| `05_monthly_trend.sql` | Monthly orders, revenue and margin | `COUNT(DISTINCT)` |
| `06_revenue_by_country.sql` | Orders, AOV, margin and revenue share by country | Window function `SUM() OVER ()` |
| `07_customer_segments.sql` | One-time vs. repeat customers | CTE, `CASE WHEN` |
| `08_budget_vs_actual.sql` | Actual vs. budget revenue and expenditures | Joins across finance tables |
| `08b_expense_variance_2011.sql` | Variance by expense account | Conditional aggregation, `NULLIF` |

Query results are saved as CSV files in the [`results`](results/) folder. These CSVs feed the Tableau dashboard.

## Tools

**SQL Server 2025 Express** · **SQL Server Management Studio** · **Tableau Public** · **PowerPoint**

## About me

I'm Sana Husain, an economist (MA Economics) who has tutored economics and statistics for 3+ years using SQL, Excel, Python, R and Tableau. I built this project to show hands-on financial and business analytics skills. I'm open to financial, business and data analyst roles. [Connect with me on LinkedIn](https://www.linkedin.com/in/sana-husain-economist/).
