-- Step 5: Monthly orders, revenue and gross margin
USE AdventureWorksDW2025;

SELECT
    d.CalendarYear,
    d.MonthNumberOfYear                          AS MonthNum,
    d.EnglishMonthName                           AS MonthName,
    COUNT(DISTINCT f.SalesOrderNumber)           AS Orders,
    SUM(f.SalesAmount)                           AS Revenue,
    ROUND((SUM(f.SalesAmount) - SUM(f.TotalProductCost))
          / SUM(f.SalesAmount) * 100, 1)         AS GrossMarginPct
FROM FactInternetSales f
JOIN DimDate d ON f.OrderDateKey = d.DateKey
WHERE d.CalendarYear BETWEEN 2011 AND 2013
GROUP BY d.CalendarYear, d.MonthNumberOfYear, d.EnglishMonthName
ORDER BY d.CalendarYear, d.MonthNumberOfYear;
