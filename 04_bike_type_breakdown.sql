-- Step 4: Units, revenue, average price and margin by bike type
USE AdventureWorksDW2025;

SELECT
    d.CalendarYear,
    ps.EnglishProductSubcategoryName                 AS BikeType,
    COUNT(*)                                         AS UnitsSold,
    SUM(f.SalesAmount)                               AS Revenue,
    ROUND(SUM(f.SalesAmount) / COUNT(*), 0)          AS AvgPrice,
    ROUND((SUM(f.SalesAmount) - SUM(f.TotalProductCost))
          / SUM(f.SalesAmount) * 100, 1)             AS GrossMarginPct
FROM FactInternetSales f
JOIN DimDate d                ON f.OrderDateKey = d.DateKey
JOIN DimProduct p             ON f.ProductKey = p.ProductKey
JOIN DimProductSubcategory ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN DimProductCategory pc    ON ps.ProductCategoryKey = pc.ProductCategoryKey
WHERE d.CalendarYear BETWEEN 2011 AND 2013
  AND pc.EnglishProductCategoryName = 'Bikes'
GROUP BY d.CalendarYear, ps.EnglishProductSubcategoryName
ORDER BY d.CalendarYear, Revenue DESC;
