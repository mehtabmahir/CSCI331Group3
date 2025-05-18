USE PrestigeCars_3NF
GO

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
-- The following Data.Model table definition is based on `data.model.sql`, contributed by Ashly.*

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
    ModelID          dbo.UDT_ModelRef     NOT NULL,
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

-- Output.StockPrices: output table (e.g., for reporting stock costs by model)
DROP TABLE IF EXISTS Output.StockPrices;
CREATE TABLE Output.StockPrices (
    MakeName   NVARCHAR(100) NULL,
    ModelName  NVARCHAR(150) NULL,
    Cost       MONEY         NULL
);
GO