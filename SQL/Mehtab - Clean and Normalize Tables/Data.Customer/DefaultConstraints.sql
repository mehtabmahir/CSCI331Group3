/* === DEFAULTS for every column that should always have a value === */

-- CustomerName → empty string
IF NOT EXISTS (
    SELECT 1
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]')
      AND name = 'DF_Customer_CustomerName')
BEGIN
    ALTER TABLE [PrestigeCars].[Data].[Customer]
    ADD CONSTRAINT DF_Customer_CustomerName
        DEFAULT(N'') FOR CustomerName;
END;

-- Address1 → empty string
IF NOT EXISTS (
    SELECT 1
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]')
      AND name = 'DF_Customer_Address1')
BEGIN
    ALTER TABLE [PrestigeCars].[Data].[Customer]
    ADD CONSTRAINT DF_Customer_Address1
        DEFAULT(N'') FOR Address1;
END;

-- Address2 → empty string
IF NOT EXISTS (
    SELECT 1
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]')
      AND name = 'DF_Customer_Address2')
BEGIN
    ALTER TABLE [PrestigeCars].[Data].[Customer]
    ADD CONSTRAINT DF_Customer_Address2
        DEFAULT(N'') FOR Address2;
END;

-- Town → 'Unknown'
IF NOT EXISTS (
    SELECT 1
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]')
      AND name = 'DF_Customer_Town')
BEGIN
    ALTER TABLE [PrestigeCars].[Data].[Customer]
    ADD CONSTRAINT DF_Customer_Town
        DEFAULT(N'Unknown') FOR Town;
END;

-- PostCode → 'Unknown'  ← updated
IF NOT EXISTS (
    SELECT 1
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]')
      AND name = 'DF_Customer_PostCode')
BEGIN
    ALTER TABLE [PrestigeCars].[Data].[Customer]
    ADD CONSTRAINT DF_Customer_PostCode
        DEFAULT(N'Unknown') FOR PostCode;
END;

-- Country → empty string
IF NOT EXISTS (
    SELECT 1
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]')
      AND name = 'DF_Customer_Country')
BEGIN
    ALTER TABLE [PrestigeCars].[Data].[Customer]
    ADD CONSTRAINT DF_Customer_Country
        DEFAULT(N'') FOR Country;
END;

-- IsReseller → 0
IF NOT EXISTS (
    SELECT 1
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]')
      AND name = 'DF_Customer_IsReseller')
BEGIN
    ALTER TABLE [PrestigeCars].[Data].[Customer]
    ADD CONSTRAINT DF_Customer_IsReseller
        DEFAULT(0) FOR IsReseller;
END;

-- IsCreditRisk → 0
IF NOT EXISTS (
    SELECT 1
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]')
      AND name = 'DF_Customer_IsCreditRisk')
BEGIN
    ALTER TABLE [PrestigeCars].[Data].[Customer]
    ADD CONSTRAINT DF_Customer_IsCreditRisk
        DEFAULT(0) FOR IsCreditRisk;
END;
GO
