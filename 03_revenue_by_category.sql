-- Step 3: Revenue and gross margin by product category, full years only
USE AdventureWorksDW2025;

SELECT
    d.CalendarYear,
    pc.EnglishProductCategoryName                AS Category,
    COUNT(*)                                     AS UnitsSold,
    SUM(f.SalesAmount)                           AS Revenue,
    SUM(f.SalesAmount) - SUM(f.TotalProductCost) AS GrossProfit,
    ROUND((SUM(f.SalesAmount) - SUM(f.TotalProductCost))
          / SUM(f.SalesAmount) * 100, 1)         AS GrossMarginPct
FROM FactInternetSales f
JOIN DimDate d                ON f.OrderDateKey = d.DateKey
JOIN DimProduct p             ON f.ProductKey = p.ProductKey
JOIN DimProductSubcategory ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN DimProductCategory pc    ON ps.ProductCategoryKey = pc.ProductCategoryKey
WHERE d.CalendarYear BETWEEN 2011 AND 2013
GROUP BY d.CalendarYear, pc.EnglishProductCategoryName
ORDER BY d.CalendarYear, Revenue DESC;
