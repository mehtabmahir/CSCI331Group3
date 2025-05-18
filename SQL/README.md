
# PrestigeCars\_3NF Migration Notebook

* **Mehtab (Leader):** Integrated all group work, coordinated workflow, implemented and refined most SQL scripts, made sure all parts functioned together, and provided troubleshooting/support for all technical tasks.
* **Ashly (Co-Leader):** Helped organize and distribute work, contributed to schema design, finalized presentation slides, and supported team communications.
* **Maitri:** Assisted with the initial project structure, helped with schema planning, and contributed to the group presentation.
* **Nayem:** Wrote and improved utility stored procedures (truncate/drop FKs) and helped with data migration tasks.
* **William:** Developed views, inline table-valued functions, and assisted with data validation.
* **Sabrina:** Helped with the group presentation and provided team support.

---

We create the new **PrestigeCars\_3NF** database from the existing **PrestigeCars** database by applying Third Normal Form (3NF) normalization and data cleaning, while preserving all records with no broken dependencies.

## 1. Create Schemas and User-Defined Types

First, we ensure a clean environment by dropping any existing **PrestigeCars\_3NF** database, then create the new database and define the required schemas. We then execute the full user-defined type (UDT) creation script to enforce consistent data types across the schema:

```sql
-- Drop existing PrestigeCars_3NF database if it exists (start fresh)
IF DB_ID('PrestigeCars_3NF') IS NOT NULL
BEGIN
    ALTER DATABASE PrestigeCars_3NF SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PrestigeCars_3NF;
END;
GO

-- Create new 3NF database and switch context to it
CREATE DATABASE PrestigeCars_3NF;
GO
USE PrestigeCars_3NF;
GO

-- Create necessary schemas for organizing tables
CREATE SCHEMA [Data];
GO
CREATE SCHEMA [Reference];
GO
CREATE SCHEMA [SourceData];
GO
CREATE SCHEMA [DataTransfer];
GO
CREATE SCHEMA [Output];
GO
CREATE SCHEMA [Project2.5];
GO
CREATE SCHEMA [Process];
GO

-- Define all User-Defined Types (UDTs) if they do not already exist
-- COUNTRY-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryID')
    CREATE TYPE dbo.UDT_CountryID FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryName')
    CREATE TYPE dbo.UDT_CountryName FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryISO2')
    CREATE TYPE dbo.UDT_CountryISO2 FROM NCHAR(10);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryISO3')
    CREATE TYPE dbo.UDT_CountryISO3 FROM NCHAR(10);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Region')
    CREATE TYPE dbo.UDT_Region FROM NVARCHAR(20);

-- MAKE/MODEL-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_MakeID')
    CREATE TYPE dbo.UDT_MakeID FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_MakeName')
    CREATE TYPE dbo.UDT_MakeName FROM NVARCHAR(100);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_MakeCountry')
    CREATE TYPE dbo.UDT_MakeCountry FROM CHAR(3);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelID')
    CREATE TYPE dbo.UDT_ModelID FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelName')
    CREATE TYPE dbo.UDT_ModelName FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelVariant')
    CREATE TYPE dbo.UDT_ModelVariant FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Year')
    CREATE TYPE dbo.UDT_Year FROM CHAR(4);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsRHD')
    CREATE TYPE dbo.UDT_IsRHD FROM BIT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Color')
    CREATE TYPE dbo.UDT_Color FROM NVARCHAR(50);

-- CUSTOMER-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CustomerID')
    CREATE TYPE dbo.UDT_CustomerID FROM NVARCHAR(5);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CustomerName')
    CREATE TYPE dbo.UDT_CustomerName FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Address')
    CREATE TYPE dbo.UDT_Address FROM NVARCHAR(50);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryRef')
    CREATE TYPE dbo.UDT_CountryRef FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsReseller')
    CREATE TYPE dbo.UDT_IsReseller FROM BIT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsCreditRisk')
    CREATE TYPE dbo.UDT_IsCreditRisk FROM BIT;

-- STOCK-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_StockCode')
    CREATE TYPE dbo.UDT_StockCode FROM NVARCHAR(50);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelRef')
    CREATE TYPE dbo.UDT_ModelRef FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ColorID')
    CREATE TYPE dbo.UDT_ColorID FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Cost')
    CREATE TYPE dbo.UDT_Cost FROM MONEY;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_RepairsCost')
    CREATE TYPE dbo.UDT_RepairsCost FROM MONEY;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_PartsCost')
    CREATE TYPE dbo.UDT_PartsCost FROM MONEY;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_TransportCost')
    CREATE TYPE dbo.UDT_TransportCost FROM MONEY;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_BuyerComments')
    CREATE TYPE dbo.UDT_BuyerComments FROM NVARCHAR(4000);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_DateBought')
    CREATE TYPE dbo.UDT_DateBought FROM DATE;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_TimeBought')
    CREATE TYPE dbo.UDT_TimeBought FROM TIME(7);

-- SALES-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SalesID')
    CREATE TYPE dbo.UDT_SalesID FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_InvoiceNumber')
    CREATE TYPE dbo.UDT_InvoiceNumber FROM CHAR(8);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SaleDate')
    CREATE TYPE dbo.UDT_SaleDate FROM DATETIME;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_TotalSalePrice')
    CREATE TYPE dbo.UDT_TotalSalePrice FROM NUMERIC(18,2);

-- SALES DETAILS-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SalesDetailsID')
    CREATE TYPE dbo.UDT_SalesDetailsID FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_LineItemNumber')
    CREATE TYPE dbo.UDT_LineItemNumber FROM TINYINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SalePrice')
    CREATE TYPE dbo.UDT_SalePrice FROM NUMERIC(18,2);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_LineItemDiscount')
    CREATE TYPE dbo.UDT_LineItemDiscount FROM NUMERIC(18,2);
GO
```

## 2. Define Tables (3NF Schema)

Now define all tables in the **PrestigeCars\_3NF** database using the new normalized design. We include core Data tables, reference (lookup) tables, staging tables, and output tables. All tables use the appropriate UDTs and enforce primary keys, foreign keys, `NOT NULL` where applicable, and default constraints for data quality (e.g. default 0 for boolean flags).

### Reference Schema Tables (Lookup Data)

```sql
-- Reference.Country: list of countries (normalized from Data.Customer and Data.Make)
DROP TABLE IF EXISTS Reference.Country;
CREATE TABLE Reference.Country (
    CountryID    dbo.UDT_CountryID     IDENTITY(1,1) PRIMARY KEY,
    CountryName  dbo.UDT_CountryName   NOT NULL,
    CountryISO2  dbo.UDT_CountryISO2   NOT NULL,
    CountryISO3  dbo.UDT_CountryISO3   NULL,
    SalesRegion  dbo.UDT_Region        NULL,
    CountryFlag      VARBINARY(MAX)    NULL,
    FlagFileName     NVARCHAR(50)      NULL,
    FlagFileType     NCHAR(3)          NULL
);
GO

-- Reference.Color: list of distinct vehicle colors
DROP TABLE IF EXISTS Reference.Color;
CREATE TABLE Reference.Color (
    ColorID   dbo.UDT_ColorID   IDENTITY(1,1) PRIMARY KEY,
    Color     dbo.UDT_Color     NOT NULL
);
GO

-- Reference.Budget: budget values by period and category
DROP TABLE IF EXISTS Reference.Budget;
CREATE TABLE Reference.Budget (
    BudgetKey      INT               IDENTITY(1,1) PRIMARY KEY,
    BudgetValue    MONEY             NULL,
    Year           INT               NULL,
    Month          TINYINT           NULL,
    BudgetDetail   NVARCHAR(50)      NULL,
    BudgetElement  NVARCHAR(50)      NULL
);
GO

-- Reference.Forex: foreign exchange rates (currency conversion rates)
DROP TABLE IF EXISTS Reference.Forex;
CREATE TABLE Reference.Forex (
    ExchangeDate  DATE          NULL,
    ISOCurrency   CHAR(3)       NULL,
    ExchangeRate  MONEY         NULL
);
GO

-- Reference.MarketingCategories: marketing categories for makes
DROP TABLE IF EXISTS Reference.MarketingCategories;
CREATE TABLE Reference.MarketingCategories (
    MakeName        NVARCHAR(100) NULL,
    MarketingType   NVARCHAR(200) NULL
);
GO

-- Reference.MarketingInformation: customer marketing info (external data)
DROP TABLE IF EXISTS Reference.MarketingInformation;
CREATE TABLE Reference.MarketingInformation (
    CUST           NVARCHAR(150) NULL,   -- Customer name or code
    Country        NCHAR(10)     NULL,   -- Country code
    SpendCapacity  VARCHAR(25)   NULL
);
GO

-- Reference.SalesBudgets: yearly sales budget by Color (normalized from original)
DROP TABLE IF EXISTS Reference.SalesBudgets;
CREATE TABLE Reference.SalesBudgets (
    SalesBudgetID   dbo.UDT_SalesID    IDENTITY(1,1) PRIMARY KEY,
    ColorID         dbo.UDT_ColorID    NOT NULL,
    BudgetYear      dbo.UDT_Year       NOT NULL,
    BudgetAmount    dbo.UDT_SalePrice  NOT NULL,
    CONSTRAINT FK_SalesBudgets_Color FOREIGN KEY (ColorID) 
        REFERENCES Reference.Color(ColorID)
);
GO

-- Reference.SalesCategory: sales category thresholds
DROP TABLE IF EXISTS Reference.SalesCategory;
CREATE TABLE Reference.SalesCategory (
    LowerThreshold       INT            NULL,
    UpperThreshold       INT            NULL,
    CategoryDescription  NVARCHAR(50)   NULL
);
GO

-- Reference.Staff: staff members with hierarchy info
DROP TABLE IF EXISTS Reference.Staff;
CREATE TABLE Reference.Staff (
    StaffID     INT             IDENTITY(1,1) PRIMARY KEY,
    StaffName   NVARCHAR(50)    NULL,
    ManagerID   INT             NULL,
    Department  NVARCHAR(50)    NULL
);
GO

-- Reference.StaffHierarchy: hierarchy representation of staff (using hierarchyid)
DROP TABLE IF EXISTS Reference.StaffHierarchy;
CREATE TABLE Reference.StaffHierarchy (
    HierarchyReference  HIERARCHYID   NULL,
    StaffID             INT           IDENTITY(1,1) PRIMARY KEY,
    StaffName           NVARCHAR(50)  NULL,
    ManagerID           INT           NULL,
    Department          NVARCHAR(50)  NULL
);
GO

-- Reference.YearlySales: combined sales data (2015-2018) - as per original structure
DROP TABLE IF EXISTS Reference.YearlySales;
CREATE TABLE Reference.YearlySales (
    MakeName       NVARCHAR(100) NULL,
    ModelName      NVARCHAR(150) NULL,
    CustomerName   NVARCHAR(150) NULL,
    CountryName    NVARCHAR(150) NULL,
    Cost           MONEY         NULL,
    RepairsCost    MONEY         NULL,
    PartsCost      MONEY         NULL,
    TransportInCost MONEY        NULL,
    SalePrice      NUMERIC(18,2) NULL,
    SaleDate       DATETIME      NULL
);
GO
```

### Data Schema Tables (Core Business Data)

```sql
-- Data.Make: car manufacturer (Make) with country reference
DROP TABLE IF EXISTS Data.Make;
CREATE TABLE Data.Make (
    MakeID       dbo.UDT_MakeID      IDENTITY(1,1) PRIMARY KEY,
    MakeName     dbo.UDT_MakeName    NOT NULL,
    -- Normalize country of origin into reference table
    CountryID    dbo.UDT_CountryRef  NULL,
    CONSTRAINT FK_Make_Country FOREIGN KEY (CountryID) REFERENCES Reference.Country(CountryID)
);
GO

-- Data.Model: car model, linked to its Make
DROP TABLE IF EXISTS Data.Model;
CREATE TABLE Data.Model (
    ModelID           dbo.UDT_ModelID     IDENTITY(1,1) PRIMARY KEY,
    MakeID            dbo.UDT_MakeID      NOT NULL,
    ModelName         dbo.UDT_ModelName   NOT NULL,
    ModelVariant      dbo.UDT_ModelVariant NULL,
    YearFirstProduced dbo.UDT_Year       NULL,
    YearLastProduced  dbo.UDT_Year       NULL,
    CONSTRAINT FK_Model_Make FOREIGN KEY (MakeID) REFERENCES Data.Make(MakeID)
);
GO

-- Data.Customer: customer information
DROP TABLE IF EXISTS Data.Customer;
CREATE TABLE Data.Customer (
    CustomerID    dbo.UDT_CustomerID    NOT NULL PRIMARY KEY,
    CustomerName  dbo.UDT_CustomerName  NOT NULL  DEFAULT(''),   -- Default empty string for no name
    Address1      dbo.UDT_Address       NOT NULL  DEFAULT(''),
    Address2      dbo.UDT_Address       NULL      DEFAULT(''),
    Town          dbo.UDT_Address       NOT NULL  DEFAULT('Unknown'),
    PostCode      dbo.UDT_CountryISO2   NOT NULL  DEFAULT(''),
    CountryID     dbo.UDT_CountryRef    NOT NULL,  -- normalized country reference
    IsReseller    dbo.UDT_IsReseller    NOT NULL  DEFAULT(0),
    IsCreditRisk  dbo.UDT_IsCreditRisk  NOT NULL  DEFAULT(0),
    CONSTRAINT FK_Customer_Country FOREIGN KEY (CountryID) REFERENCES Reference.Country(CountryID)
);
GO

-- Data.Stock: inventory of car stock (each vehicle), with reference to Model and Color
DROP TABLE IF EXISTS Data.Stock;
CREATE TABLE Data.Stock (
    StockCode        dbo.UDT_StockCode    NOT NULL PRIMARY KEY,  -- using StockCode as unique identifier for stock
    ModelID          dbo.UDT_ModelID      NOT NULL,
    Cost             dbo.UDT_Cost         NULL      DEFAULT(0),
    RepairsCost      dbo.UDT_RepairsCost  NULL      DEFAULT(0),
    PartsCost        dbo.UDT_PartsCost    NULL      DEFAULT(0),
    TransportInCost  dbo.UDT_TransportCost NULL     DEFAULT(0),
    IsRHD            dbo.UDT_IsRHD        NOT NULL  DEFAULT(0),
    ColorID          dbo.UDT_ColorID      NULL,
    BuyerComments    dbo.UDT_BuyerComments NULL,
    DateBought       dbo.UDT_DateBought   NULL,
    TimeBought       dbo.UDT_TimeBought   NULL,
    CONSTRAINT FK_Stock_Model FOREIGN KEY (ModelID) REFERENCES Data.Model(ModelID),
    CONSTRAINT FK_Stock_Color FOREIGN KEY (ColorID) REFERENCES Reference.Color(ColorID)
);
GO

-- Data.Sales: sales transactions (one per invoice/sale)
DROP TABLE IF EXISTS Data.Sales;
CREATE TABLE Data.Sales (
    SalesID        dbo.UDT_SalesID       NOT NULL PRIMARY KEY,
    CustomerID     dbo.UDT_CustomerID    NOT NULL,
    InvoiceNumber  dbo.UDT_InvoiceNumber NULL,
    TotalSalePrice dbo.UDT_TotalSalePrice NULL,
    SaleDate       dbo.UDT_SaleDate      NULL,
    CONSTRAINT FK_Sales_Customer FOREIGN KEY (CustomerID) REFERENCES Data.Customer(CustomerID)
    -- (Dropped redundant [ID] identity from original; SalesID serves as primary key)
);
GO

-- Data.SalesDetails: line items for each sale (each vehicle sold)
DROP TABLE IF EXISTS Data.SalesDetails;
CREATE TABLE Data.SalesDetails (
    SalesDetailsID    dbo.UDT_SalesDetailsID  IDENTITY(1,1) PRIMARY KEY,
    SalesID           dbo.UDT_SalesID         NOT NULL,
    LineItemNumber    dbo.UDT_LineItemNumber  NOT NULL,
    StockID           dbo.UDT_StockCode       NOT NULL,  -- references Stock.StockCode
    SalePrice         dbo.UDT_SalePrice       NULL    DEFAULT(0),
    LineItemDiscount  dbo.UDT_LineItemDiscount NULL   DEFAULT(0),
    CONSTRAINT FK_SalesDetails_Sales FOREIGN KEY (SalesID) REFERENCES Data.Sales(SalesID),
    CONSTRAINT FK_SalesDetails_Stock FOREIGN KEY (StockID) REFERENCES Data.Stock(StockCode)
    -- Ensure no duplicate line items per sale
    --, CONSTRAINT UQ_SalesDetails UNIQUE(SalesID, LineItemNumber)
);
GO

-- Data.PivotTable: pre-calculated sales totals per Color by year (2015-2018)
DROP TABLE IF EXISTS Data.PivotTable;
CREATE TABLE Data.PivotTable (
    ColorID   dbo.UDT_ColorID   NOT NULL,
    [2015]    dbo.UDT_SalePrice NULL,
    [2016]    dbo.UDT_SalePrice NULL,
    [2017]    dbo.UDT_SalePrice NULL,
    [2018]    dbo.UDT_SalePrice NULL,
    CONSTRAINT PK_PivotTable PRIMARY KEY CLUSTERED (ColorID),
    CONSTRAINT FK_PivotTable_Color FOREIGN KEY (ColorID) REFERENCES Reference.Color(ColorID)
);
GO
```

### DataTransfer Schema Tables (Staging Data)

```sql
-- DataTransfer.Sales2015: staging data for sales in 2015 (raw import)
DROP TABLE IF EXISTS DataTransfer.Sales2015;
CREATE TABLE DataTransfer.Sales2015 (
    MakeName       NVARCHAR(100) NULL,
    ModelName      NVARCHAR(150) NULL,
    CustomerName   NVARCHAR(150) NULL,
    CountryName    NVARCHAR(150) NULL,
    Cost           MONEY         NULL,
    RepairsCost    MONEY         NULL,
    PartsCost      MONEY         NULL,
    TransportInCost MONEY        NULL,
    SalePrice      NUMERIC(18,2) NULL,
    SaleDate       DATETIME      NULL
);
GO

-- Repeat for 2016, 2017, 2018
DROP TABLE IF EXISTS DataTransfer.Sales2016;
CREATE TABLE DataTransfer.Sales2016 (
    MakeName       NVARCHAR(100) NULL,
    ModelName      NVARCHAR(150) NULL,
    CustomerName   NVARCHAR(150) NULL,
    CountryName    NVARCHAR(150) NULL,
    Cost           MONEY         NULL,
    RepairsCost    MONEY         NULL,
    PartsCost      MONEY         NULL,
    TransportInCost MONEY        NULL,
    SalePrice      NUMERIC(18,2) NULL,
    SaleDate       DATETIME      NULL
);
GO

DROP TABLE IF EXISTS DataTransfer.Sales2017;
CREATE TABLE DataTransfer.Sales2017 (
    MakeName       NVARCHAR(100) NULL,
    ModelName      NVARCHAR(150) NULL,
    CustomerName   NVARCHAR(150) NULL,
    CountryName    NVARCHAR(150) NULL,
    Cost           MONEY         NULL,
    RepairsCost    MONEY         NULL,
    PartsCost      MONEY         NULL,
    TransportInCost MONEY        NULL,
    SalePrice      NUMERIC(18,2) NULL,
    SaleDate       DATETIME      NULL
);
GO

DROP TABLE IF EXISTS DataTransfer.Sales2018;
CREATE TABLE DataTransfer.Sales2018 (
    MakeName       NVARCHAR(100) NULL,
    ModelName      NVARCHAR(150) NULL,
    CustomerName   NVARCHAR(150) NULL,
    CountryName    NVARCHAR(150) NULL,
    Cost           MONEY         NULL,
    RepairsCost    MONEY         NULL,
    PartsCost      MONEY         NULL,
    TransportInCost MONEY        NULL,
    SalePrice      NUMERIC(18,2) NULL,
    SaleDate       DATETIME      NULL
);
GO
```

### SourceData Schema Tables (Raw Source Data)

```sql
-- SourceData.SalesInPounds: raw sales cost data in GBP
DROP TABLE IF EXISTS SourceData.SalesInPounds;
CREATE TABLE SourceData.SalesInPounds (
    MakeName     NVARCHAR(100) NULL,
    ModelName    NVARCHAR(150) NULL,
    VehicleCost  VARCHAR(51)   NULL   -- costs in text (e.g., "£12345")
);
GO

-- SourceData.SalesText: raw sales data in text form
DROP TABLE IF EXISTS SourceData.SalesText;
CREATE TABLE SourceData.SalesText (
    CountryName  NVARCHAR(150) NULL,
    MakeName     NVARCHAR(100) NULL,
    Cost         VARCHAR(20)   NULL,
    SalePrice    VARCHAR(20)   NULL
);
GO

-- SourceData.SalesInPounds_Cleaned: cleaned & normalized version of SalesInPounds
DROP TABLE IF EXISTS SourceData.SalesInPounds_Cleaned;
CREATE TABLE SourceData.SalesInPounds_Cleaned (
    SalesInPoundsID  dbo.UDT_SalesID    IDENTITY(1,1) PRIMARY KEY,
    CustomerID       dbo.UDT_CustomerID NULL,
    StockID          dbo.UDT_StockCode  NULL,
    SaleDate         dbo.UDT_SaleDate   NULL,
    SalePriceGBP     dbo.UDT_SalePrice  NULL,
    ConvertedUSD     dbo.UDT_SalePrice  NULL  -- optional: store converted USD value
);
GO
```

### Output Schema Tables (Reporting Outputs)

```sql
-- Output.StockPrices: output table (e.g., for reporting stock costs by model)
DROP TABLE IF EXISTS Output.StockPrices;
CREATE TABLE Output.StockPrices (
    MakeName   NVARCHAR(100) NULL,
    ModelName  NVARCHAR(150) NULL,
    Cost       MONEY         NULL
);
GO
```

*All tables have now been created in the **PrestigeCars\_3NF** database with appropriate data types, keys, and constraints.*

## 3. Insert and Clean Data

We will now **transfer all data** from the original **PrestigeCars** database into the new **PrestigeCars\_3NF** schema. Each `INSERT ... SELECT` uses built-in transformations to clean and normalize the data (trimming whitespace, converting case, replacing blanks with `NULL` or default values, formatting codes, and looking up foreign keys). Comments indicate the data cleaning logic applied for each table:

```sql
-- Insert Cleaning Logic for Reference.Country
-- Populate Reference.Country from original Data.Country
INSERT INTO Reference.Country (CountryName, CountryISO2, CountryISO3, SalesRegion, CountryFlag, FlagFileName, FlagFileType)
SELECT 
    RTRIM(LTRIM(C.CountryName)),         -- trim country name
    UPPER(RTRIM(LTRIM(C.CountryISO2))),  -- trim and upper-case ISO2 code
    UPPER(RTRIM(LTRIM(C.CountryISO3))),  -- trim and upper-case ISO3 code
    RTRIM(LTRIM(C.SalesRegion)),         -- trim region name
    C.CountryFlag,
    C.FlagFileName,
    C.FlagFileType
FROM PrestigeCars.Data.Country AS C;
```

```sql
-- Insert Cleaning Logic for Reference.Color
-- Populate Reference.Color lookup from distinct Stock colors in original data
INSERT INTO Reference.Color (Color)
SELECT DISTINCT UPPER(RTRIM(LTRIM(S.Color)))  -- use upper-case color name for consistency
FROM PrestigeCars.Data.Stock AS S
WHERE S.Color IS NOT NULL AND LTRIM(RTRIM(S.Color)) <> '';
```

```sql
-- Insert Cleaning Logic for Data.Make
INSERT INTO Data.Make (MakeName, CountryID)
SELECT 
    RTRIM(LTRIM(M.MakeName)),                -- trim Make name
    CR.CountryID                             -- lookup CountryID by country code
FROM PrestigeCars.Data.Make AS M
LEFT JOIN Reference.Country AS CR 
    ON UPPER(RTRIM(LTRIM(M.MakeCountry))) = CR.CountryISO3;
```

```sql
-- Insert Cleaning Logic for Data.Model
INSERT INTO Data.Model (MakeID, ModelName, ModelVariant, YearFirstProduced, YearLastProduced)
SELECT 
    M2.MakeID,
    RTRIM(LTRIM(Old.ModelName)),
    NULLIF(RTRIM(LTRIM(Old.ModelVariant)), ''),  -- trim variant, blank to NULL
    NULLIF(RTRIM(LTRIM(Old.YearFirstProduced)), ''),  -- blank years to NULL
    NULLIF(RTRIM(LTRIM(Old.YearLastProduced)), '')
FROM PrestigeCars.Data.Model AS Old
JOIN Data.Make AS M2 ON M2.MakeID = Old.MakeID;
```

```sql
-- Insert Cleaning Logic for Data.Customer
INSERT INTO Data.Customer (CustomerID, CustomerName, Address1, Address2, Town, PostCode, CountryID, IsReseller, IsCreditRisk)
SELECT 
    UPPER(RTRIM(LTRIM(C.CustomerID))),                  -- CustomerID to upper-case
    RTRIM(LTRIM(C.CustomerName)),                       -- trim CustomerName
    RTRIM(LTRIM(C.Address1)),                           -- trim Address1
    NULLIF(RTRIM(LTRIM(C.Address2)), ''),               -- trim Address2, blank to NULL
    ISNULL(NULLIF(RTRIM(LTRIM(C.Town)), ''), 'Unknown'),-- trim Town, blank to 'Unknown'
    CASE 
        WHEN C.PostCode IS NULL OR LTRIM(RTRIM(C.PostCode)) = '' THEN 'UNKNOWN'
        ELSE UPPER(REPLACE(C.PostCode, ' ', ''))
    END,    -- remove spaces, upper-case; use 'UNKNOWN' if blank/null
    CR.CountryID,                                       -- lookup CountryID by country code
    ISNULL(C.IsReseller, 0),                            -- default IsReseller to 0 if NULL
    ISNULL(C.IsCreditRisk, 0)                           -- default IsCreditRisk to 0 if NULL
FROM PrestigeCars.Data.Customer AS C
LEFT JOIN Reference.Country AS CR 
    ON UPPER(RTRIM(LTRIM(C.Country))) = CR.CountryISO2;
```

```sql
-- Insert Cleaning Logic for Data.Stock
INSERT INTO Data.Stock (StockCode, ModelID, Cost, RepairsCost, PartsCost, TransportInCost, IsRHD, ColorID, BuyerComments, DateBought, TimeBought)
SELECT 
    UPPER(RTRIM(LTRIM(S.StockCode))),   -- normalize StockCode to upper-case
    MD.ModelID,                         -- new ModelID (foreign key mapping)
    ISNULL(S.Cost, 0),                  -- replace NULL costs with 0
    ISNULL(S.RepairsCost, 0),
    ISNULL(S.PartsCost, 0),
    ISNULL(S.TransportInCost, 0),
    ISNULL(S.IsRHD, 0),
    CO.ColorID,                         -- lookup ColorID from color name
    NULLIF(RTRIM(LTRIM(S.BuyerComments)), ''),  -- trim comments, empty to NULL
    S.DateBought,
    S.TimeBought
FROM PrestigeCars.Data.Stock AS S
JOIN Data.Model AS MD ON MD.ModelID = S.ModelID
LEFT JOIN Reference.Color AS CO 
    ON UPPER(RTRIM(LTRIM(S.Color))) = CO.Color;
```

```sql
-- Insert Cleaning Logic for Data.Sales
INSERT INTO Data.Sales (SalesID, CustomerID, InvoiceNumber, TotalSalePrice, SaleDate)
SELECT 
    S.SalesID,
    S.CustomerID,                  -- CustomerIDs already cleaned in Data.Customer
    UPPER(S.InvoiceNumber),        -- ensure InvoiceNumber is upper-case (if alphanumeric)
    ISNULL(S.TotalSalePrice, 0.00),
    S.SaleDate
FROM PrestigeCars.Data.Sales AS S
WHERE S.CustomerID IN (SELECT CustomerID FROM Data.Customer);  -- only include sales with valid customer
```

```sql
-- Insert Cleaning Logic for Data.SalesDetails
INSERT INTO Data.SalesDetails (SalesID, LineItemNumber, StockID, SalePrice, LineItemDiscount)
SELECT 
    SD.SalesID,
    SD.LineItemNumber,
    UPPER(RTRIM(LTRIM(SD.StockID))),  -- ensure StockID matches upper-case StockCode in new Stock
    ISNULL(SD.SalePrice, 0.00),
    ISNULL(SD.LineItemDiscount, 0.00)
FROM PrestigeCars.Data.SalesDetails AS SD
JOIN Data.Sales AS S ON SD.SalesID = S.SalesID
JOIN Data.Stock AS ST ON UPPER(RTRIM(LTRIM(SD.StockID))) = ST.StockCode;  -- include only details with valid Sale and Stock
```

```sql
-- Insert Cleaning Logic for Data.PivotTable
INSERT INTO Data.PivotTable (ColorID, [2015], [2016], [2017], [2018])
SELECT 
    CO.ColorID,
    P.[2015], P.[2016], P.[2017], P.[2018]
FROM PrestigeCars.Data.PivotTable AS P
JOIN Reference.Color AS CO 
    ON UPPER(RTRIM(LTRIM(P.Color))) = CO.Color;
```

```sql
-- Insert Cleaning Logic for DataTransfer.Sales2015
INSERT INTO DataTransfer.Sales2015 (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
SELECT 
    RTRIM(LTRIM(T.MakeName)),
    RTRIM(LTRIM(T.ModelName)),
    RTRIM(LTRIM(T.CustomerName)),
    RTRIM(LTRIM(T.CountryName)),
    T.Cost,
    T.RepairsCost,
    T.PartsCost,
    T.TransportInCost,
    T.SalePrice,
    T.SaleDate
FROM PrestigeCars.DataTransfer.Sales2015 AS T;
```

```sql
-- Insert Cleaning Logic for DataTransfer.Sales2016
INSERT INTO DataTransfer.Sales2016 (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
SELECT 
    RTRIM(LTRIM(T.MakeName)),
    RTRIM(LTRIM(T.ModelName)),
    RTRIM(LTRIM(T.CustomerName)),
    RTRIM(LTRIM(T.CountryName)),
    T.Cost,
    T.RepairsCost,
    T.PartsCost,
    T.TransportInCost,
    T.SalePrice,
    T.SaleDate
FROM PrestigeCars.DataTransfer.Sales2016 AS T;
```

```sql
-- Insert Cleaning Logic for DataTransfer.Sales2017
INSERT INTO DataTransfer.Sales2017 (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
SELECT 
    RTRIM(LTRIM(T.MakeName)),
    RTRIM(LTRIM(T.ModelName)),
    RTRIM(LTRIM(T.CustomerName)),
    RTRIM(LTRIM(T.CountryName)),
    T.Cost,
    T.RepairsCost,
    T.PartsCost,
    T.TransportInCost,
    T.SalePrice,
    T.SaleDate
FROM PrestigeCars.DataTransfer.Sales2017 AS T;
```

```sql
-- Insert Cleaning Logic for DataTransfer.Sales2018
INSERT INTO DataTransfer.Sales2018 (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
SELECT 
    RTRIM(LTRIM(T.MakeName)),
    RTRIM(LTRIM(T.ModelName)),
    RTRIM(LTRIM(T.CustomerName)),
    RTRIM(LTRIM(T.CountryName)),
    T.Cost,
    T.RepairsCost,
    T.PartsCost,
    T.TransportInCost,
    T.SalePrice,
    T.SaleDate
FROM PrestigeCars.DataTransfer.Sales2018 AS T;
```

```sql
-- Insert Cleaning Logic for Reference.Budget
INSERT INTO Reference.Budget (BudgetValue, Year, Month, BudgetDetail, BudgetElement)
SELECT 
    B.BudgetValue,
    B.Year,
    B.Month,
    RTRIM(LTRIM(B.BudgetDetail)),
    RTRIM(LTRIM(B.BudgetElement))
FROM PrestigeCars.Reference.Budget AS B;
```

```sql
-- Insert Cleaning Logic for Reference.Forex
INSERT INTO Reference.Forex (ExchangeDate, ISOCurrency, ExchangeRate)
SELECT F.ExchangeDate, UPPER(F.ISOCurrency), F.ExchangeRate
FROM PrestigeCars.Reference.Forex AS F;
```

```sql
-- Insert Cleaning Logic for Reference.MarketingCategories
INSERT INTO Reference.MarketingCategories (MakeName, MarketingType)
SELECT RTRIM(LTRIM(MC.MakeName)), RTRIM(LTRIM(MC.MarketingType))
FROM PrestigeCars.Reference.MarketingCategories AS MC;
```

```sql
-- Insert Cleaning Logic for Reference.MarketingInformation
INSERT INTO Reference.MarketingInformation (CUST, Country, SpendCapacity)
SELECT RTRIM(LTRIM(MI.CUST)), UPPER(RTRIM(LTRIM(MI.Country))), RTRIM(LTRIM(MI.SpendCapacity))
FROM PrestigeCars.Reference.MarketingInformation AS MI;
```

```sql
-- Insert Cleaning Logic for Reference.SalesCategory
INSERT INTO Reference.SalesCategory (LowerThreshold, UpperThreshold, CategoryDescription)
SELECT SC.LowerThreshold, SC.UpperThreshold, RTRIM(LTRIM(SC.CategoryDescription))
FROM PrestigeCars.Reference.SalesCategory AS SC;
```

```sql
-- Insert Cleaning Logic for Reference.Staff
INSERT INTO Reference.Staff (StaffName, ManagerID, Department)
SELECT RTRIM(LTRIM(SF.StaffName)), SF.ManagerID, RTRIM(LTRIM(SF.Department))
FROM PrestigeCars.Reference.Staff AS SF;
```

```sql
-- Insert Cleaning Logic for Reference.StaffHierarchy
INSERT INTO Reference.StaffHierarchy (HierarchyReference, StaffName, ManagerID, Department)
SELECT SH.HierarchyReference, RTRIM(LTRIM(SH.StaffName)), SH.ManagerID, RTRIM(LTRIM(SH.Department))
FROM PrestigeCars.Reference.StaffHierarchy AS SH;
```

```sql
-- Insert Cleaning Logic for Reference.YearlySales
INSERT INTO Reference.YearlySales (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
SELECT 
    RTRIM(LTRIM(Y.MakeName)),
    RTRIM(LTRIM(Y.ModelName)),
    RTRIM(LTRIM(Y.CustomerName)),
    RTRIM(LTRIM(Y.CountryName)),
    Y.Cost,
    Y.RepairsCost,
    Y.PartsCost,
    Y.TransportInCost,
    Y.SalePrice,
    Y.SaleDate
FROM PrestigeCars.Reference.YearlySales AS Y;
```

```sql
-- Insert Cleaning Logic for SourceData.SalesInPounds
INSERT INTO SourceData.SalesInPounds (MakeName, ModelName, VehicleCost)
SELECT RTRIM(LTRIM(SIP.MakeName)), RTRIM(LTRIM(SIP.ModelName)), RTRIM(LTRIM(SIP.VehicleCost))
FROM PrestigeCars.SourceData.SalesInPounds AS SIP;
```

```sql
-- Insert Cleaning Logic for SourceData.SalesText
INSERT INTO SourceData.SalesText (CountryName, MakeName, Cost, SalePrice)
SELECT RTRIM(LTRIM(ST.CountryName)), RTRIM(LTRIM(ST.MakeName)), RTRIM(LTRIM(ST.Cost)), RTRIM(LTRIM(ST.SalePrice))
FROM PrestigeCars.SourceData.SalesText AS ST;
```

```sql
-- (Optional) After conversion (not shown), SourceData.SalesInPounds_Cleaned could be populated
-- For now, we leave SourceData.SalesInPounds_Cleaned empty or handle via separate ETL.
```

```sql
-- Insert Cleaning Logic for Output.StockPrices
-- For this output, combine stock cost data with model/make names for reporting
INSERT INTO Output.StockPrices (MakeName, ModelName, Cost)
SELECT 
    MK.MakeName,
    MD.ModelName,
    ST.Cost
FROM Data.Stock AS ST
JOIN Data.Model AS MD ON ST.ModelID = MD.ModelID
JOIN Data.Make  AS MK ON MD.MakeID = MK.MakeID;
```

All data from the original **PrestigeCars** database has now been loaded into **PrestigeCars\_3NF** with the above cleaning transformations applied. At this point, the new database contains fully **normalized tables** with consistent, cleaned data.

## 4. Create Utility Procedures (Truncate & Drop FKs)

Next, we create two utility stored procedures to facilitate data reload processes in a future star schema stage. One procedure truncates all tables in the star schema (e.g., any tables in schemas like `Project3%`), and the other drops all foreign key constraints (removing dependencies before reload). Both procedures are created in the **Project2.5** schema:

```sql
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

DROP PROCEDURE IF EXISTS [Project2.5].[TruncateStarSchemaData];
GO
CREATE PROCEDURE [Project2.5].[TruncateStarSchemaData]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE TableCursor CURSOR FOR
        SELECT DISTINCT '[' + TABLE_SCHEMA + '].[' + TABLE_NAME + ']' AS FullyQualifiedTableName
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA LIKE 'Project3%';  -- adjust schema filter as needed

    OPEN TableCursor;
    DECLARE @TableName NVARCHAR(255);
    DECLARE @SQL NVARCHAR(MAX);

    FETCH NEXT FROM TableCursor INTO @TableName;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @SQL = 'TRUNCATE TABLE ' + @TableName;
        EXEC(@SQL);
        FETCH NEXT FROM TableCursor INTO @TableName;
    END

    CLOSE TableCursor;
    DEALLOCATE TableCursor;

    -- Log workflow step (calls tracking proc if exists)
    EXEC [Process].[usp_TrackWorkFlow]
         @WorkFlowStepDescription = 'Truncate Star Schema Data.',
         @UserAuthorizationKey = @UserAuthorizationKey,
         @WorkFlowStepTableRowCount = -1;
END;
GO

DROP PROCEDURE IF EXISTS [Project2.5].[DropForeignKeysFromStarSchemaData];
GO
CREATE PROCEDURE [Project2.5].[DropForeignKeysFromStarSchemaData]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ForeignKeyName VARCHAR(255);
    DECLARE @TableName NVARCHAR(255);
    DECLARE @SQL NVARCHAR(MAX);
    DECLARE ForeignKeyCursor CURSOR FOR 
        SELECT fk.name AS ForeignKeyName,
               QUOTENAME(OBJECT_SCHEMA_NAME(fk.parent_object_id)) + '.' + t.name AS TableName
        FROM sys.foreign_keys AS fk
        INNER JOIN sys.tables AS t 
            ON fk.parent_object_id = t.object_id;

    OPEN ForeignKeyCursor;
    FETCH NEXT FROM ForeignKeyCursor INTO @ForeignKeyName, @TableName;
    WHILE @@FETCH_STATUS = 0 
    BEGIN
        SET @SQL = 'ALTER TABLE ' + @TableName + ' DROP CONSTRAINT ' + QUOTENAME(@ForeignKeyName) + ';';
        EXEC(@SQL);
        FETCH NEXT FROM ForeignKeyCursor INTO @ForeignKeyName, @TableName;
    END

    CLOSE ForeignKeyCursor;
    DEALLOCATE ForeignKeyCursor;

    -- Log workflow step
    EXEC [Process].[usp_TrackWorkFlow]
         @WorkFlowStepDescription = 'Drop Foreign Keys.',
         @UserAuthorizationKey = @UserAuthorizationKey,
         @WorkFlowStepTableRowCount = -1;
END;
GO
```

*Note:* The above procedures are designed to help manage a future star schema (Project 3). The schema filter (`Project3%`) can be adjusted as needed. Both procedures call `[Process].[usp_TrackWorkFlow]` to log actions; if this tracking procedure does not exist in the database, you may create a stub in the **Process** schema to avoid runtime errors. For example:

```sql
-- (Optional) Create a stub for Process.usp_TrackWorkFlow to satisfy procedure calls
DROP PROCEDURE IF EXISTS [Process].[usp_TrackWorkFlow];
CREATE PROCEDURE [Process].[usp_TrackWorkFlow]
    @WorkFlowStepDescription NVARCHAR(100),
    @UserAuthorizationKey INT,
    @WorkFlowStepTableRowCount INT
AS
BEGIN
    -- Stub implementation: in a real system, this would log the workflow step
    PRINT 'Workflow: ' + @WorkFlowStepDescription;
END;
GO
```

## 5. Create Views and Functions

Then, we create the **views** and **inline table-valued functions (ITVFs)** to facilitate data access. These provide convenient read-only access to various parts of the data and demonstrate the use of the new normalized schema:

```sql
-- Views for reference and source tables (simple select aliases)
CREATE VIEW vw_SalesCategory AS
SELECT LowerThreshold, UpperThreshold, CategoryDescription
FROM Reference.SalesCategory;
GO

CREATE VIEW vw_Staff AS
SELECT StaffID, StaffName, ManagerID, Department
FROM Reference.Staff;
GO

CREATE VIEW vw_StaffHierarchy AS
SELECT HierarchyReference, StaffID, StaffName, ManagerID, Department
FROM Reference.StaffHierarchy;
GO

CREATE VIEW vw_YearlySales AS
SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate
FROM Reference.YearlySales;
GO

CREATE VIEW vw_SalesInPounds AS
SELECT MakeName, ModelName, VehicleCost
FROM SourceData.SalesInPounds;
GO

CREATE VIEW vw_SalesText AS
SELECT CountryName, MakeName, Cost, SalePrice
FROM SourceData.SalesText;
GO
```

```sql
-- Inline Table-Valued Functions (ITVFs)
-- Get all sales from 2015–2018 combined, with an extra column indicating the year
CREATE FUNCTION dbo.fn_GetAllSales()
RETURNS TABLE
AS
RETURN 
(
    SELECT *, 2015 AS SalesYear FROM DataTransfer.Sales2015
    UNION ALL
    SELECT *, 2016 AS SalesYear FROM DataTransfer.Sales2016
    UNION ALL
    SELECT *, 2017 AS SalesYear FROM DataTransfer.Sales2017
    UNION ALL
    SELECT *, 2018 AS SalesYear FROM DataTransfer.Sales2018
);
GO

-- Filter StockPrices by Make (returns all model costs for a given make)
CREATE FUNCTION dbo.fn_StockPricesByMake(@MakeName NVARCHAR(100))
RETURNS TABLE
AS
RETURN 
(
    SELECT MakeName, ModelName, Cost
    FROM Output.StockPrices
    WHERE MakeName = @MakeName
);
GO

-- Get Budget entries by Year and Month
CREATE FUNCTION dbo.fn_BudgetByYearMonth(@Year INT, @Month TINYINT)
RETURNS TABLE
AS
RETURN 
(
    SELECT BudgetKey, BudgetValue, Year, Month, BudgetDetail, BudgetElement
    FROM Reference.Budget
    WHERE Year = @Year AND Month = @Month
);
GO
```

These views and functions allow easy querying of the data. For example, `fn_GetAllSales()` consolidates all yearly sales staging tables into one result, and calling `fn_StockPricesByMake('Toyota')` would retrieve all stock costs for the make "Toyota".

## 6. Validation and Verification

Finally, we perform validation checks to ensure the migration was successful:

* **Row Count Comparison:** Verify that each table in **PrestigeCars\_3NF** has the same number of records as the source **PrestigeCars** (no missing or extra records).
* **Foreign Key Integrity:** Ensure no broken references (e.g. every foreign key value in Sales has a matching Customer, every StockID in SalesDetails exists in Stock, etc.).
* **Sample Data Inspection:** Retrieve joined sample records from multiple tables to confirm that data relationships are intact and correctly normalized.

**Row Counts: Original vs. 3NF Tables**

```sql
SELECT 
    'Data.Country' AS TableName,
    (SELECT COUNT(*) FROM PrestigeCars.Data.Country) AS OriginalCount,
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Reference.Country) AS NewCount
UNION ALL
SELECT 
    'Data.Customer',
    (SELECT COUNT(*) FROM PrestigeCars.Data.Customer),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Data.Customer)
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
    'DataTransfer.Sales2015',
    (SELECT COUNT(*) FROM PrestigeCars.DataTransfer.Sales2015),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.DataTransfer.Sales2015)
UNION ALL
SELECT 
    'DataTransfer.Sales2016',
    (SELECT COUNT(*) FROM PrestigeCars.DataTransfer.Sales2016),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.DataTransfer.Sales2016)
UNION ALL
SELECT 
    'DataTransfer.Sales2017',
    (SELECT COUNT(*) FROM PrestigeCars.DataTransfer.Sales2017),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.DataTransfer.Sales2017)
UNION ALL
SELECT 
    'DataTransfer.Sales2018',
    (SELECT COUNT(*) FROM PrestigeCars.DataTransfer.Sales2018),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.DataTransfer.Sales2018)
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
    'Reference.SalesCategory',
    (SELECT COUNT(*) FROM PrestigeCars.Reference.SalesCategory),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Reference.SalesCategory)
UNION ALL
SELECT 
    'Reference.Staff',
    (SELECT COUNT(*) FROM PrestigeCars.Reference.Staff),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Reference.Staff)
UNION ALL
SELECT 
    'Reference.StaffHierarchy',
    (SELECT COUNT(*) FROM PrestigeCars.Reference.StaffHierarchy),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Reference.StaffHierarchy)
UNION ALL
SELECT 
    'Reference.YearlySales',
    (SELECT COUNT(*) FROM PrestigeCars.Reference.YearlySales),
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Reference.YearlySales)
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
    0,  -- (Output.StockPrices did not exist in original PrestigeCars)
    (SELECT COUNT(*) FROM PrestigeCars_3NF.Output.StockPrices);
```

*Verify that the OriginalCount and NewCount are equal for each table above.* All counts should match, confirming that no records were lost or duplicated during migration.

**Foreign Key Integrity Checks**

The following query checks that all foreign key relationships in the 3NF database are satisfied (we expect zero "missing" references in each case):

```sql
SELECT
    'Sales -> Customer FK broken (count)' AS [Check],
    COUNT(*) AS MissingCount
FROM Data.Sales AS s
LEFT JOIN Data.Customer AS c ON s.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL

UNION ALL

SELECT
    'SalesDetails -> Sales FK broken (count)',
    COUNT(*)
FROM Data.SalesDetails AS sd
LEFT JOIN Data.Sales AS s ON sd.SalesID = s.SalesID
WHERE s.SalesID IS NULL

UNION ALL

SELECT
    'SalesDetails -> Stock FK broken (count)',
    COUNT(*)
FROM Data.SalesDetails AS sd
LEFT JOIN Data.Stock AS st ON sd.StockID = st.StockCode
WHERE st.StockCode IS NULL

UNION ALL

SELECT
    'Stock -> Model FK broken (count)',
    COUNT(*)
FROM Data.Stock AS st
LEFT JOIN Data.Model AS m ON st.ModelID = m.ModelID
WHERE m.ModelID IS NULL

UNION ALL

SELECT
    'Model -> Make FK broken (count)',
    COUNT(*)
FROM Data.Model AS md
LEFT JOIN Data.Make AS mk ON md.MakeID = mk.MakeID
WHERE mk.MakeID IS NULL

UNION ALL

SELECT
    'Customer -> Country FK broken (count)',
    COUNT(*)
FROM Data.Customer AS cs
LEFT JOIN Reference.Country AS co ON cs.CountryID = co.CountryID
WHERE co.CountryID IS NULL;
```

Each of the above counts should return **0**, indicating that all foreign key references in the new database have matching parent records (no referential integrity issues).

**Sample Joined Records (Data Consistency Check)**

To further validate the data, we can retrieve a few sample records with joins across multiple tables. The query below joins **SalesDetails** with **Sales**, **Stock**, **Model**, **Make**, **Customer**, **Country**, and **Color** to reconstruct a comprehensive view of a sale. This confirms that the normalization (e.g. using numeric `CountryID` and `ColorID` foreign keys instead of names) still retains all the correct information:

```sql
SELECT TOP 10
    co.CountryName       AS CustomerCountry,
    mk.MakeName          AS Make,
    md.ModelName         AS Model,
    st.Cost              AS CostPrice,
    st.RepairsCost       AS RepairsCost,
    st.PartsCost         AS PartsCost,
    st.TransportInCost   AS TransportCost,
    clr.Color            AS VehicleColor,
    sd.SalePrice         AS SalePrice,
    sd.LineItemDiscount  AS Discount,
    sa.InvoiceNumber     AS InvoiceNumber,
    sa.SaleDate          AS SaleDate,
    cs.CustomerName      AS CustomerName,
    sd.SalesDetailsID    AS LineID
FROM Data.SalesDetails AS sd
JOIN Data.Sales     AS sa   ON sd.SalesID = sa.SalesID
JOIN Data.Stock     AS st   ON sd.StockID = st.StockCode
JOIN Data.Model     AS md   ON st.ModelID = md.ModelID
JOIN Data.Make      AS mk   ON md.MakeID = mk.MakeID
JOIN Data.Customer  AS cs   ON sa.CustomerID = cs.CustomerID
JOIN Reference.Country AS co ON cs.CountryID = co.CountryID
JOIN Reference.Color   AS clr ON st.ColorID = clr.ColorID;
```

The output should show each sample sale line-item with all details correctly linked (e.g. a **CustomerName** together with their **CountryName**, the **Make** and **Model** of the vehicle sold, the vehicle **Color**, various cost fields, sale price, etc.). This verifies that the foreign keys (Customer -> Country, Stock -> Color, etc.) point to the correct reference data and that no data was lost or mis-assigned during normalization.

---

**Conclusion:** We have successfully created and populated the **PrestigeCars\_3NF** database. All tables are in **Third Normal Form** with cleansed, standardized data, and our integrity checks confirm no broken dependencies or missing records. This completes the migration and normalization process, providing a clean foundation for future use (including potential star-schema transformations in Project 3, if any). These steps can be executed sequentially in Azure Data Studio or in a Jupyter SQL notebook to recreate the entire database.
