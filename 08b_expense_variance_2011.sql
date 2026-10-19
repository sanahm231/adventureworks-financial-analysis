-- Step 8 (part 2): Which expense accounts went over budget in 2011?
-- Uses conditional aggregation (SUM + CASE WHEN) to put Budget and Actual side by side
USE AdventureWorksDW2025;

WITH ExpenseByAccount AS (
    SELECT
        a.AccountDescription                                          AS Account,
        SUM(CASE WHEN s.ScenarioName = 'Budget' THEN f.Amount ELSE 0 END) AS Budget,
        SUM(CASE WHEN s.ScenarioName = 'Actual' THEN f.Amount ELSE 0 END) AS Actual
    FROM FactFinance f
    JOIN DimScenario s ON f.ScenarioKey = s.ScenarioKey
    JOIN DimAccount  a ON f.AccountKey  = a.AccountKey
    JOIN DimDate     d ON f.DateKey     = d.DateKey
    WHERE d.CalendarYear = 2011
      AND a.AccountType  = 'Expenditures'
    GROUP BY a.AccountDescription
)
SELECT
    Account,
    Budget,
    Actual,
    Actual - Budget                                        AS Variance,
    CAST((Actual - Budget) * 100.0 / NULLIF(Budget, 0)
         AS DECIMAL(6,1))                                  AS VariancePct
FROM ExpenseByAccount
WHERE Budget <> 0 OR Actual <> 0
ORDER BY Variance DESC;
