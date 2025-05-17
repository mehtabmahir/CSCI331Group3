/* DefaultConstraints.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

-- Backfill existing NULLs to defaults before applying constraints
UPDATE [PrestigeCars].[Data].[SalesDetails]
SET SalesID = ISNULL(SalesID, 0),
    LineItemNumber = ISNULL(LineItemNumber, 1),
    StockID = ISNULL(StockID, N''),
    SalePrice = ISNULL(SalePrice, 0.00),
    LineItemDiscount = ISNULL(LineItemDiscount, 0.00);

-- Add default constraints (idempotent)
IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[SalesDetails]') 
      AND name = 'DF_SalesDetails_SalesID'
)
    ALTER TABLE [PrestigeCars].[Data].[SalesDetails] 
    ADD CONSTRAINT DF_SalesDetails_SalesID DEFAULT(0) FOR SalesID;

IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[SalesDetails]') 
      AND name = 'DF_SalesDetails_LineItemNumber'
)
    ALTER TABLE [PrestigeCars].[Data].[SalesDetails] 
    ADD CONSTRAINT DF_SalesDetails_LineItemNumber DEFAULT(1) FOR LineItemNumber;

IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[SalesDetails]') 
      AND name = 'DF_SalesDetails_StockID'
)
    ALTER TABLE [PrestigeCars].[Data].[SalesDetails] 
    ADD CONSTRAINT DF_SalesDetails_StockID DEFAULT(N'') FOR StockID;

IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[SalesDetails]') 
      AND name = 'DF_SalesDetails_SalePrice'
)
    ALTER TABLE [PrestigeCars].[Data].[SalesDetails] 
    ADD CONSTRAINT DF_SalesDetails_SalePrice DEFAULT(0.00) FOR SalePrice;

IF NOT EXISTS (
    SELECT 1 FROM sys.default_constraints 
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[SalesDetails]') 
      AND name = 'DF_SalesDetails_LineItemDiscount'
)
    ALTER TABLE [PrestigeCars].[Data].[SalesDetails] 
    ADD CONSTRAINT DF_SalesDetails_LineItemDiscount DEFAULT(0.00) FOR LineItemDiscount;

GO
