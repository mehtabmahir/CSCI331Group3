/* Normalize.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
UPDATE [PrestigeCars].[Data].[SalesDetails]
SET
    SalesID           = UPPER(RTRIM(LTRIM(SalesID))),
    LineItemNumber    = LineItemNumber,  -- Numeric, no normalization needed
    StockID           = UPPER(RTRIM(LTRIM(StockID))),
    SalePrice         = SalePrice,       -- Numeric/money, no normalization needed
    LineItemDiscount  = LineItemDiscount -- Numeric, no normalization needed
;
GO
