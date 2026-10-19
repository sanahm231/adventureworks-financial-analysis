-- Step 1: Revenue, COGS, gross profit and gross margin by year
USE AdventureWorksDW2025;

SELECT
    d.CalendarYear,
    SUM(f.SalesAmount)                           AS Revenue,
    SUM(f.TotalProductCost)                      AS COGS,
    SUM(f.SalesAmount) - SUM(f.TotalProductCost) AS GrossProfit,
    ROUND((SUM(f.SalesAmount) - SUM(f.TotalProductCost))
          / SUM(f.SalesAmount) * 100, 1)         AS GrossMarginPct
FROM FactInternetSales f
JOIN DimDate d ON f.OrderDateKey = d.DateKey
GROUP BY d.CalendarYear
ORDER BY d.CalendarYear;
