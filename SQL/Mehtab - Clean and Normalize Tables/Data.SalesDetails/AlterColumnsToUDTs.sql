/* AlterColumnsToUDTs.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN SalesID           dbo.UDT_SalesID           NOT NULL;

ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN LineItemNumber    dbo.UDT_LineItemNumber    NOT NULL;

ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN StockID           dbo.UDT_StockCode         NOT NULL;

ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN SalePrice         dbo.UDT_SalePrice         NOT NULL;

ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN LineItemDiscount  dbo.UDT_LineItemDiscount  NOT NULL;

ALTER TABLE [PrestigeCars].[Data].[SalesDetails]
    ALTER COLUMN SalesDetailsID dbo.UDT_SalesDetailsID NOT NULL;
GO
