USE PrestigeCars_3NF
GO

--Author: Mehtab Mahir--

SELECT
'Sales -> Customer FK broken (count)' AS [Check],
COUNT(*) AS MissingCount
FROM Data.Sales AS s
LEFT JOIN Data.Customer AS c ON s.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL
UNION ALL
SELECT
'SalesDetails -> Sales FK broken (count)',
COUNT(*)
FROM Data.SalesDetails AS sd
LEFT JOIN Data.Sales AS s ON sd.SalesID = s.SalesID
WHERE s.SalesID IS NULL
UNION ALL
SELECT
'SalesDetails -> Stock FK broken (count)',
COUNT(*)
FROM Data.SalesDetails AS sd
LEFT JOIN Data.Stock AS st ON sd.StockID = st.StockCode
WHERE st.StockCode IS NULL