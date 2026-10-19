-- Step 7: One-time vs repeat customers (uses a CTE)
USE AdventureWorksDW2025;

WITH CustomerSummary AS (
    SELECT
        f.CustomerKey,
        COUNT(DISTINCT f.SalesOrderNumber) AS Orders,
        SUM(f.SalesAmount)                 AS Revenue
    FROM FactInternetSales f
    JOIN DimDate d ON f.OrderDateKey = d.DateKey
    WHERE d.CalendarYear BETWEEN 2011 AND 2013
    GROUP BY f.CustomerKey
)
SELECT
    CASE WHEN Orders = 1 THEN '1 order (one-time)'
         WHEN Orders = 2 THEN '2 orders'
         ELSE '3+ orders' END          AS CustomerSegment,
    COUNT(*)                           AS Customers,
    SUM(Revenue)                       AS Revenue,
    ROUND(AVG(Revenue), 0)             AS AvgRevenuePerCustomer
FROM CustomerSummary
GROUP BY CASE WHEN Orders = 1 THEN '1 order (one-time)'
              WHEN Orders = 2 THEN '2 orders'
              ELSE '3+ orders' END
ORDER BY MIN(Orders);
