-- Step 2: Data check - first and last order dates and total rows
-- Result: 2010-12-29 to 2014-01-28, 60,398 rows -> use 2011-2013 (full years) only
USE AdventureWorksDW2025;

SELECT
    MIN(d.FullDateAlternateKey) AS FirstOrderDate,
    MAX(d.FullDateAlternateKey) AS LastOrderDate,
    COUNT(*)                    AS TotalSalesRows
FROM FactInternetSales f
JOIN DimDate d ON f.OrderDateKey = d.DateKey;
