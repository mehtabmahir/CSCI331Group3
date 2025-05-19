/* DefaultConstraints.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

-- Backfill existing NULLs to default values before applying constraints
UPDATE [PrestigeCars].[Data].[Customer]
SET
    CustomerName = ISNULL(CustomerName, N''),
    Address1     = ISNULL(Address1, N''),
    Address2     = ISNULL(Address2, N''),
    Town         = ISNULL(Town, N'Unknown'),
    PostCode     = ISNULL(PostCode, N'Unknown'),
    Country      = ISNULL(Country, N''),
    IsReseller   = ISNULL(IsReseller, 0),
    IsCreditRisk = ISNULL(IsCreditRisk, 0);
GO

-- Add default constraints (idempotent)
IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_CustomerName')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_CustomerName DEFAULT(N'')         FOR CustomerName;

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Address1')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Address1     DEFAULT(N'')         FOR Address1;

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Address2')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Address2     DEFAULT(N'')         FOR Address2;

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Town')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Town         DEFAULT(N'Unknown')  FOR Town;

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_PostCode')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_PostCode     DEFAULT(N'Unknown')  FOR PostCode;

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_Country')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_Country      DEFAULT(N'')         FOR Country;

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_IsReseller')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_IsReseller   DEFAULT(0)           FOR IsReseller;

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='DF_Customer_IsCreditRisk')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT DF_Customer_IsCreditRisk DEFAULT(0)           FOR IsCreditRisk;

IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]') AND name='CK_Customer_PostCodeLen')
    ALTER TABLE [PrestigeCars].[Data].[Customer] ADD CONSTRAINT CK_Customer_PostCodeLen CHECK (LEN(PostCode) <= 8 OR PostCode IS NULL);
GO
