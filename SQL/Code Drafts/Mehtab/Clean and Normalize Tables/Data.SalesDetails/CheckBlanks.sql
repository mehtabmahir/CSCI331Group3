/* CheckBlanks.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

SELECT
    SUM(CASE WHEN SalesID IS NULL OR SalesID = 0 THEN 1 ELSE 0 END)                 AS blank_salesid,
    SUM(CASE WHEN LineItemNumber IS NULL OR LineItemNumber = 0 THEN 1 ELSE 0 END)   AS blank_lineitemnumber,
    SUM(CASE WHEN StockID IS NULL OR StockID = N'' THEN 1 ELSE 0 END)               AS blank_stockid,
    SUM(CASE WHEN SalePrice IS NULL OR SalePrice = 0 THEN 1 ELSE 0 END)             AS blank_saleprice,
    SUM(CASE WHEN LineItemDiscount IS NULL THEN 1 ELSE 0 END)                       AS blank_discount
FROM [PrestigeCars].[Data].[SalesDetails];
