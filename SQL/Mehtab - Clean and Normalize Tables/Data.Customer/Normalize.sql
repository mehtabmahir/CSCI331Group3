USE PrestigeCars;
GO
/* ================================================================
   0.  CREATE OR VERIFY USER-DEFINED TYPES (UDTs)
   ================================================================ */
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CustomerID')
    CREATE TYPE dbo.UDT_CustomerID      FROM NVARCHAR(5)   NOT NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CustomerName')
    CREATE TYPE dbo.UDT_CustomerName    FROM NVARCHAR(150) NOT NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Address')
    CREATE TYPE dbo.UDT_Address         FROM NVARCHAR(50)  NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsReseller')
    CREATE TYPE dbo.UDT_IsReseller      FROM BIT           NOT NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsCreditRisk')
    CREATE TYPE dbo.UDT_IsCreditRisk    FROM BIT           NOT NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryISO2')
    CREATE TYPE dbo.UDT_CountryISO2     FROM NCHAR(10)     NULL; -- change to CHAR(2) if you prefer
GO
/* ================================================================
   1.  NORMALISE EXISTING DATA (trim, upper-case, fill NULLs)
   ================================================================ */
UPDATE [PrestigeCars].[Data].[Customer]
SET CustomerID   = UPPER(RTRIM(LTRIM(CustomerID))),
    CustomerName = RTRIM(LTRIM(CustomerName)),
    Address1     = RTRIM(LTRIM(Address1)),
    Address2     = NULLIF(RTRIM(LTRIM(Address2)), ''),
    Town         = RTRIM(LTRIM(Town)),
    PostCode     = UPPER(REPLACE(PostCode,' ','')),
    Country      = UPPER(RTRIM(LTRIM(Country))),
    IsReseller   = ISNULL(IsReseller,0),
    IsCreditRisk = ISNULL(IsCreditRisk,0);
GO
/* ================================================================
   2.  SWITCH ALL COLUMNS TO THEIR UDTs
   ================================================================ */
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN CustomerID   dbo.UDT_CustomerID   NOT NULL;
GO
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN CustomerName dbo.UDT_CustomerName NOT NULL;
GO
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN Address1     dbo.UDT_Address      NULL;
GO
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN Address2     dbo.UDT_Address      NULL;
GO
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN Town         dbo.UDT_Address      NULL;
GO
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN PostCode     dbo.UDT_Address      NULL;
GO
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN Country      dbo.UDT_CountryISO2  NULL;
GO
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN IsReseller   dbo.UDT_IsReseller   NOT NULL;
GO
ALTER TABLE [PrestigeCars].[Data].[Customer]
    ALTER COLUMN IsCreditRisk dbo.UDT_IsCreditRisk NOT NULL;
GO
/* ================================================================
   3.  ADD DEFAULTS (ONLY IF MISSING) & CHECK CONSTRAINT
   ================================================================ */
DECLARE @tbl SYSNAME = '[PrestigeCars].[Data].[Customer]';

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID(@tbl) AND name = 'DF_Customer_CustomerName')
    EXEC('ALTER TABLE ' + @tbl + ' ADD CONSTRAINT DF_Customer_CustomerName DEFAULT(N'''') FOR CustomerName');

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID(@tbl) AND name = 'DF_Customer_Address1')
    EXEC('ALTER TABLE ' + @tbl + ' ADD CONSTRAINT DF_Customer_Address1 DEFAULT(N'''') FOR Address1');

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID(@tbl) AND name = 'DF_Customer_Address2')
    EXEC('ALTER TABLE ' + @tbl + ' ADD CONSTRAINT DF_Customer_Address2 DEFAULT(N'''') FOR Address2');

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID(@tbl) AND name = 'DF_Customer_Town')
    EXEC('ALTER TABLE ' + @tbl + ' ADD CONSTRAINT DF_Customer_Town DEFAULT(N''Unknown'') FOR Town');

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID(@tbl) AND name = 'DF_Customer_PostCode')
    EXEC('ALTER TABLE ' + @tbl + ' ADD CONSTRAINT DF_Customer_PostCode DEFAULT(N'''') FOR PostCode');

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID(@tbl) AND name = 'DF_Customer_Country')
    EXEC('ALTER TABLE ' + @tbl + ' ADD CONSTRAINT DF_Customer_Country DEFAULT(N'''') FOR Country');

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID(@tbl) AND name = 'DF_Customer_IsReseller')
    EXEC('ALTER TABLE ' + @tbl + ' ADD CONSTRAINT DF_Customer_IsReseller DEFAULT(0) FOR IsReseller');

IF NOT EXISTS (SELECT 1 FROM sys.default_constraints WHERE parent_object_id = OBJECT_ID(@tbl) AND name = 'DF_Customer_IsCreditRisk')
    EXEC('ALTER TABLE ' + @tbl + ' ADD CONSTRAINT DF_Customer_IsCreditRisk DEFAULT(0) FOR IsCreditRisk');

IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE parent_object_id = OBJECT_ID(@tbl) AND name = 'CK_Customer_PostCodeLen')
    EXEC('ALTER TABLE ' + @tbl + ' ADD CONSTRAINT CK_Customer_PostCodeLen CHECK (LEN(PostCode) <= 8 OR PostCode IS NULL)');
GO
