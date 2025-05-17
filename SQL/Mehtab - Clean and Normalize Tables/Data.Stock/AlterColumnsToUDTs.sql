/* AlterColumnsToUDTs.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

-- Backfill NULLs in all NOT NULL columns before altering types
UPDATE [PrestigeCars].[Data].[Stock] SET ModelID           = 0        WHERE ModelID IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET Cost              = 0.00     WHERE Cost IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET RepairsCost       = 0.00     WHERE RepairsCost IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET PartsCost         = 0.00     WHERE PartsCost IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET TransportInCost   = 0.00     WHERE TransportInCost IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET IsRHD             = 0        WHERE IsRHD IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET Color             = N''      WHERE Color IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET DateBought        = '2000-01-01' WHERE DateBought IS NULL;
UPDATE [PrestigeCars].[Data].[Stock] SET TimeBought        = '00:00:00'   WHERE TimeBought IS NULL;

ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN StockCode         dbo.UDT_StockCode       NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN ModelID           dbo.UDT_ModelID         NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN Cost              dbo.UDT_Cost            NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN RepairsCost       dbo.UDT_RepairsCost     NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN PartsCost         dbo.UDT_PartsCost       NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN TransportInCost   dbo.UDT_TransportCost   NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN IsRHD             dbo.UDT_IsRHD           NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN Color             dbo.UDT_Color           NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN BuyerComments     dbo.UDT_BuyerComments   NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN DateBought        dbo.UDT_DateBought      NOT NULL;
ALTER TABLE [PrestigeCars].[Data].[Stock]
    ALTER COLUMN TimeBought        dbo.UDT_TimeBought      NOT NULL;
GO
