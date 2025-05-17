/* DefaultConstraints.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
-- Backfill existing NULLs to default values before applying constraints
UPDATE [PrestigeCars].[Data].[Stock]
SET
    Cost            = ISNULL(Cost, 0.00),
    RepairsCost     = ISNULL(RepairsCost, 0.00),
    PartsCost       = ISNULL(PartsCost, 0.00),
    TransportInCost = ISNULL(TransportInCost, 0.00),
    IsRHD           = ISNULL(IsRHD, 0),
    Color           = ISNULL(Color, N''),
    BuyerComments   = ISNULL(BuyerComments, N''),
    DateBought      = ISNULL(DateBought, '2000-01-01'),
    TimeBought      = ISNULL(TimeBought, '00:00:00');
GO
-- Add default constraints (idempotent)
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_Cost')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_Cost DEFAULT(0.00) FOR Cost;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_RepairsCost')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_RepairsCost DEFAULT(0.00) FOR RepairsCost;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_PartsCost')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_PartsCost DEFAULT(0.00) FOR PartsCost;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_TransportInCost')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_TransportInCost DEFAULT(0.00) FOR TransportInCost;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_IsRHD')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_IsRHD DEFAULT(0) FOR IsRHD;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_Color')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_Color DEFAULT(N'') FOR Color;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_BuyerComments')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_BuyerComments DEFAULT(N'') FOR BuyerComments;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_DateBought')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_DateBought DEFAULT('2000-01-01') FOR DateBought;
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Stock]') AND name='DF_Stock_TimeBought')
    ALTER TABLE [PrestigeCars].[Data].[Stock] ADD CONSTRAINT DF_Stock_TimeBought DEFAULT('00:00:00') FOR TimeBought;
GO
