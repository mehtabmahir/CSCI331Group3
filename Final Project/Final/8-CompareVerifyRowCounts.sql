USE PrestigeCars_3NF
GO

--Author: Mehtab Mahir--

SELECT 
    'Data.Customer' AS TableName,
    (SELECT COUNT(*) FROM PrestigeCars.Data.Customer) AS OriginalCount,
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Data.Customer) AS NewCount
UNION ALL
SELECT 
    'Data.Make',
    (SELECT COUNT(*) FROM PrestigeCars.Data.Make),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Data.Make)
UNION ALL
SELECT 
    'Data.Model',
    (SELECT COUNT(*) FROM PrestigeCars.Data.Model),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Data.Model)
UNION ALL
SELECT 
    'Data.Stock',
    (SELECT COUNT(*) FROM PrestigeCars.Data.Stock),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Data.Stock)
UNION ALL
SELECT 
    'Data.Sales',
    (SELECT COUNT(*) FROM PrestigeCars.Data.Sales),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Data.Sales)
UNION ALL
SELECT 
    'Data.SalesDetails',
    (SELECT COUNT(*) FROM PrestigeCars.Data.SalesDetails),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Data.SalesDetails)
UNION ALL
SELECT 
    'Data.PivotTable',
    (SELECT COUNT(*) FROM PrestigeCars.Data.PivotTable),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Data.PivotTable)
UNION ALL
SELECT 
    'Reference.Budget',
    (SELECT COUNT(*) FROM PrestigeCars.Reference.Budget),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Reference.Budget)
UNION ALL
SELECT 
    'Reference.Forex',
    (SELECT COUNT(*) FROM PrestigeCars.Reference.Forex),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Reference.Forex)
UNION ALL
SELECT 
    'Reference.MarketingCategories',
    (SELECT COUNT(*) FROM PrestigeCars.Reference.MarketingCategories),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Reference.MarketingCategories)
UNION ALL
SELECT 
    'Reference.MarketingInformation',
    (SELECT COUNT(*) FROM PrestigeCars.Reference.MarketingInformation),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Reference.MarketingInformation)
UNION ALL
SELECT 
    'SourceData.SalesInPounds',
    (SELECT COUNT(*) FROM PrestigeCars.SourceData.SalesInPounds),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.SourceData.SalesInPounds)
UNION ALL
SELECT 
    'SourceData.SalesText',
    (SELECT COUNT(*) FROM PrestigeCars.SourceData.SalesText),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.SourceData.SalesText)
UNION ALL
SELECT 
    'Output.StockPrices',
    0,
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Output.StockPrices);
