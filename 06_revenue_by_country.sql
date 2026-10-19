-- Step 6: Orders, revenue, average order value, margin and revenue share by country
USE AdventureWorksDW2025;

SELECT
    t.SalesTerritoryGroup                        AS Region,
    t.SalesTerritoryCountry                      AS Country,
    COUNT(DISTINCT f.SalesOrderNumber)           AS Orders,
    SUM(f.SalesAmount)                           AS Revenue,
    ROUND(SUM(f.SalesAmount)
          / COUNT(DISTINCT f.SalesOrderNumber), 0) AS AvgOrderValue,
    ROUND((SUM(f.SalesAmount) - SUM(f.TotalProductCost))
          / SUM(f.SalesAmount) * 100, 1)         AS GrossMarginPct,
    CAST(SUM(f.SalesAmount) * 100.0
         / SUM(SUM(f.SalesAmount)) OVER ()
         AS DECIMAL(5,1))                        AS RevenueSharePct
FROM FactInternetSales f
JOIN DimDate d           ON f.OrderDateKey = d.DateKey
JOIN DimSalesTerritory t ON f.SalesTerritoryKey = t.SalesTerritoryKey
WHERE d.CalendarYear BETWEEN 2011 AND 2013
GROUP BY t.SalesTerritoryGroup, t.SalesTerritoryCountry
ORDER BY Revenue DESC;
