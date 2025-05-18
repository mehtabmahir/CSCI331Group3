USE PrestigeCars_3NF
GO

-- Credits: Ashly --

-- REFERENCE TABLES

DROP TABLE IF EXISTS Reference.Country;
CREATE TABLE Reference.Country (
    CountryID    dbo.UDT_CountryID     IDENTITY(1,1) PRIMARY KEY,
    CountryName  dbo.UDT_CountryName   NOT NULL DEFAULT(''),
    CountryISO2  dbo.UDT_CountryISO2   NOT NULL DEFAULT(''),
    CountryISO3  dbo.UDT_CountryISO3   NOT NULL DEFAULT(''),
    SalesRegion  dbo.UDT_Region        NOT NULL DEFAULT(''),
    CountryFlag      VARBINARY(MAX)    NULL,
    FlagFileName     NVARCHAR(50)      NOT NULL DEFAULT(''),
    FlagFileType     NCHAR(3)          NOT NULL DEFAULT('')
);
GO

DROP TABLE IF EXISTS Reference.Color;
CREATE TABLE Reference.Color (
    ColorID   dbo.UDT_ColorID   IDENTITY(1,1) PRIMARY KEY,
    Color     dbo.UDT_Color     NOT NULL DEFAULT('')
);
GO

DROP TABLE IF EXISTS Reference.Budget;
CREATE TABLE Reference.Budget (
    BudgetKey      INT               IDENTITY(1,1) PRIMARY KEY,
    BudgetValue    MONEY             NOT NULL DEFAULT(0),
    Year           INT               NOT NULL DEFAULT(0),
    Month          TINYINT           NOT NULL DEFAULT(0),
    BudgetDetail   NVARCHAR(50)      NOT NULL DEFAULT(''),
    BudgetElement  NVARCHAR(50)      NOT NULL DEFAULT('')
);
GO

DROP TABLE IF EXISTS Reference.Forex;
CREATE TABLE Reference.Forex (
    ExchangeDate  DATE          NOT NULL DEFAULT(GETDATE()),
    ISOCurrency   CHAR(3)       NOT NULL DEFAULT(''),
    ExchangeRate  MONEY         NOT NULL DEFAULT(0)
);
GO

DROP TABLE IF EXISTS Reference.MarketingCategories;
CREATE TABLE Reference.MarketingCategories (
    MakeName        NVARCHAR(100) NOT NULL DEFAULT(''),
    MarketingType   NVARCHAR(200) NOT NULL DEFAULT('')
);
GO

DROP TABLE IF EXISTS Reference.MarketingInformation;
CREATE TABLE Reference.MarketingInformation (
    CUST           NVARCHAR(150) NOT NULL DEFAULT(''),
    Country        NCHAR(10)     NOT NULL DEFAULT(''),
    SpendCapacity  VARCHAR(25)   NOT NULL DEFAULT('')
);
GO

DROP TABLE IF EXISTS Reference.SalesBudgets;
CREATE TABLE Reference.SalesBudgets (
    SalesBudgetID   dbo.UDT_SalesID    IDENTITY(1,1) PRIMARY KEY,
    ColorID         dbo.UDT_ColorID    NOT NULL,
    BudgetYear      dbo.UDT_Year       NOT NULL DEFAULT(''),
    BudgetAmount    dbo.UDT_SalePrice  NOT NULL DEFAULT(0),
    -- You might want additional columns here if needed, set as NOT NULL DEFAULT('')
    CONSTRAINT FK_SalesBudgets_Color FOREIGN KEY (ColorID) REFERENCES Reference.Color(ColorID)
);
GO

DROP TABLE IF EXISTS Reference.SalesCategory;
CREATE TABLE Reference.SalesCategory (
    LowerThreshold       INT            NOT NULL DEFAULT(0),
    UpperThreshold       INT            NOT NULL DEFAULT(0),
    CategoryDescription  NVARCHAR(50)   NOT NULL DEFAULT('')
);
GO

DROP TABLE IF EXISTS Reference.Staff;
CREATE TABLE Reference.Staff (
    StaffID     INT             IDENTITY(1,1) PRIMARY KEY,
    StaffName   NVARCHAR(50)    NOT NULL DEFAULT(''),
    ManagerID   INT             NOT NULL DEFAULT(0),
    Department  NVARCHAR(50)    NOT NULL DEFAULT('')
);
GO

DROP TABLE IF EXISTS Reference.StaffHierarchy;
CREATE TABLE Reference.StaffHierarchy (
    HierarchyReference  HIERARCHYID   NULL,
    StaffID             INT           IDENTITY(1,1) PRIMARY KEY,
    StaffName           NVARCHAR(50)  NOT NULL DEFAULT(''),
    ManagerID           INT           NOT NULL DEFAULT(0),
    Department          NVARCHAR(50)  NOT NULL DEFAULT('')
);
GO

DROP TABLE IF EXISTS Reference.YearlySales;
CREATE TABLE Reference.YearlySales (
    MakeName       NVARCHAR(100) NOT NULL DEFAULT(''),
    ModelName      NVARCHAR(150) NOT NULL DEFAULT(''),
    CustomerName   NVARCHAR(150) NOT NULL DEFAULT(''),
    CountryName    NVARCHAR(150) NOT NULL DEFAULT(''),
    Cost           MONEY         NOT NULL DEFAULT(0),
    RepairsCost    MONEY         NOT NULL DEFAULT(0),
    PartsCost      MONEY         NOT NULL DEFAULT(0),
    TransportInCost MONEY        NOT NULL DEFAULT(0),
    SalePrice      NUMERIC(18,2) NOT NULL DEFAULT(0),
    SaleDate       DATETIME      NOT NULL DEFAULT(GETDATE())
);
GO

-- DATA TABLES

DROP TABLE IF EXISTS Data.Make;
CREATE TABLE Data.Make (
    MakeID         dbo.UDT_MakeID      IDENTITY(1,1) PRIMARY KEY,
    MakeName       dbo.UDT_MakeName    NOT NULL DEFAULT(''),
    CountryID      dbo.UDT_CountryRef  NOT NULL DEFAULT(0),
    CONSTRAINT FK_Make_Country FOREIGN KEY (CountryID) REFERENCES Reference.Country(CountryID)
);
GO

DROP TABLE IF EXISTS Data.Model;
CREATE TABLE Data.Model (
    ModelID             dbo.UDT_ModelID     IDENTITY(1,1) PRIMARY KEY,
    MakeID              dbo.UDT_MakeID      NOT NULL DEFAULT(0),
    ModelName           dbo.UDT_ModelName   NOT NULL DEFAULT(''),
    ModelVariant        dbo.UDT_ModelVariant NOT NULL DEFAULT(''),
    YearFirstProduced   dbo.UDT_Year        NOT NULL DEFAULT(''),
    YearLastProduced    dbo.UDT_Year        NOT NULL DEFAULT(''),
    CONSTRAINT FK_Model_Make FOREIGN KEY (MakeID) REFERENCES Data.Make(MakeID)
);
GO

DROP TABLE IF EXISTS Data.Customer;
CREATE TABLE Data.Customer (
    CustomerID      dbo.UDT_CustomerID    NOT NULL PRIMARY KEY,
    CustomerName    dbo.UDT_CustomerName  NOT NULL  DEFAULT(''),
    Address1        dbo.UDT_Address       NOT NULL  DEFAULT(''),
    Address2        dbo.UDT_Address       NOT NULL  DEFAULT(''),
    Town            dbo.UDT_Address       NOT NULL  DEFAULT('Unknown'),
    PostCode        dbo.UDT_CountryISO2   NOT NULL  DEFAULT(''),
    CountryID       dbo.UDT_CountryRef    NOT NULL DEFAULT(0),
    IsReseller      dbo.UDT_IsReseller    NOT NULL  DEFAULT(0),
    IsCreditRisk    dbo.UDT_IsCreditRisk  NOT NULL  DEFAULT(0),
    CONSTRAINT FK_Customer_Country FOREIGN KEY (CountryID) REFERENCES Reference.Country(CountryID)
);
GO

DROP TABLE IF EXISTS Data.Stock;
CREATE TABLE Data.Stock (
    StockCode        dbo.UDT_StockCode    NOT NULL PRIMARY KEY,
    ModelID          dbo.UDT_ModelID      NOT NULL DEFAULT(0),
    Cost             dbo.UDT_Cost         NOT NULL  DEFAULT(0),
    RepairsCost      dbo.UDT_RepairsCost  NOT NULL  DEFAULT(0),
    PartsCost        dbo.UDT_PartsCost    NOT NULL  DEFAULT(0),
    TransportInCost  dbo.UDT_TransportCost NOT NULL DEFAULT(0),
    IsRHD            dbo.UDT_IsRHD        NOT NULL  DEFAULT(0),
    ColorID          dbo.UDT_ColorID      NOT NULL  DEFAULT(0),
    BuyerComments    dbo.UDT_BuyerComments NOT NULL DEFAULT(''),
    DateBought       dbo.UDT_DateBought   NOT NULL DEFAULT(GETDATE()),
    TimeBought       dbo.UDT_TimeBought   NOT NULL DEFAULT('00:00:00'),
    CONSTRAINT FK_Stock_Model FOREIGN KEY (ModelID) REFERENCES Data.Model(ModelID),
    CONSTRAINT FK_Stock_Color FOREIGN KEY (ColorID) REFERENCES Reference.Color(ColorID)
);
GO

DROP TABLE IF EXISTS Data.Sales;
CREATE TABLE Data.Sales (
    SalesID        dbo.UDT_SalesID       NOT NULL PRIMARY KEY,
    CustomerID     dbo.UDT_CustomerID    NOT NULL,
    InvoiceNumber  dbo.UDT_InvoiceNumber NOT NULL DEFAULT(''),
    TotalSalePrice dbo.UDT_TotalSalePrice NOT NULL DEFAULT(0),
    SaleDate       dbo.UDT_SaleDate      NOT NULL DEFAULT(GETDATE()),
    CONSTRAINT FK_Sales_Customer FOREIGN KEY (CustomerID) REFERENCES Data.Customer(CustomerID)
);
GO

DROP TABLE IF EXISTS Data.SalesDetails;
CREATE TABLE Data.SalesDetails (
    SalesDetailsID    dbo.UDT_SalesDetailsID  IDENTITY(1,1) PRIMARY KEY,
    SalesID           dbo.UDT_SalesID         NOT NULL,
    LineItemNumber    dbo.UDT_LineItemNumber  NOT NULL DEFAULT(0),
    StockID           dbo.UDT_StockCode       NOT NULL DEFAULT(''),
    SalePrice         dbo.UDT_SalePrice       NOT NULL    DEFAULT(0),
    LineItemDiscount  dbo.UDT_LineItemDiscount NOT NULL   DEFAULT(0),
    CONSTRAINT FK_SalesDetails_Sales FOREIGN KEY (SalesID) REFERENCES Data.Sales(SalesID),
    CONSTRAINT FK_SalesDetails_Stock FOREIGN KEY (StockID) REFERENCES Data.Stock(StockCode)
);
GO

DROP TABLE IF EXISTS Data.PivotTable;
CREATE TABLE Data.PivotTable (
    ColorID   dbo.UDT_ColorID   NOT NULL,
    [2015]    dbo.UDT_SalePrice NOT NULL DEFAULT(0),
    [2016]    dbo.UDT_SalePrice NOT NULL DEFAULT(0),
    [2017]    dbo.UDT_SalePrice NOT NULL DEFAULT(0),
    [2018]    dbo.UDT_SalePrice NOT NULL DEFAULT(0),
    CONSTRAINT PK_PivotTable PRIMARY KEY CLUSTERED (ColorID),
    CONSTRAINT FK_PivotTable_Color FOREIGN KEY (ColorID) REFERENCES Reference.Color(ColorID)
);
GO

-- DATATRANSFER TABLES

DROP TABLE IF EXISTS DataTransfer.Sales2015;
CREATE TABLE DataTransfer.Sales2015 (
    MakeName       NVARCHAR(100) NOT NULL DEFAULT(''),
    ModelName      NVARCHAR(150) NOT NULL DEFAULT(''),
    CustomerName   NVARCHAR(150) NOT NULL DEFAULT(''),
    CountryName    NVARCHAR(150) NOT NULL DEFAULT(''),
    Cost           MONEY         NOT NULL DEFAULT(0),
    RepairsCost    MONEY         NOT NULL DEFAULT(0),
    PartsCost      MONEY         NOT NULL DEFAULT(0),
    TransportInCost MONEY        NOT NULL DEFAULT(0),
    SalePrice      NUMERIC(18,2) NOT NULL DEFAULT(0),
    SaleDate       DATETIME      NOT NULL DEFAULT(GETDATE())
);
GO

DROP TABLE IF EXISTS DataTransfer.Sales2016;
CREATE TABLE DataTransfer.Sales2016 (
    MakeName       NVARCHAR(100) NOT NULL DEFAULT(''),
    ModelName      NVARCHAR(150) NOT NULL DEFAULT(''),
    CustomerName   NVARCHAR(150) NOT NULL DEFAULT(''),
    CountryName    NVARCHAR(150) NOT NULL DEFAULT(''),
    Cost           MONEY         NOT NULL DEFAULT(0),
    RepairsCost    MONEY         NOT NULL DEFAULT(0),
    PartsCost      MONEY         NOT NULL DEFAULT(0),
    TransportInCost MONEY        NOT NULL DEFAULT(0),
    SalePrice      NUMERIC(18,2) NOT NULL DEFAULT(0),
    SaleDate       DATETIME      NOT NULL DEFAULT(GETDATE())
);
GO

DROP TABLE IF EXISTS DataTransfer.Sales2017;
CREATE TABLE DataTransfer.Sales2017 (
    MakeName       NVARCHAR(100) NOT NULL DEFAULT(''),
    ModelName      NVARCHAR(150) NOT NULL DEFAULT(''),
    CustomerName   NVARCHAR(150) NOT NULL DEFAULT(''),
    CountryName    NVARCHAR(150) NOT NULL DEFAULT(''),
    Cost           MONEY         NOT NULL DEFAULT(0),
    RepairsCost    MONEY         NOT NULL DEFAULT(0),
    PartsCost      MONEY         NOT NULL DEFAULT(0),
    TransportInCost MONEY        NOT NULL DEFAULT(0),
    SalePrice      NUMERIC(18,2) NOT NULL DEFAULT(0),
    SaleDate       DATETIME      NOT NULL DEFAULT(GETDATE())
);
GO

DROP TABLE IF EXISTS DataTransfer.Sales2018;
CREATE TABLE DataTransfer.Sales2018 (
    MakeName       NVARCHAR(100) NOT NULL DEFAULT(''),
    ModelName      NVARCHAR(150) NOT NULL DEFAULT(''),
    CustomerName   NVARCHAR(150) NOT NULL DEFAULT(''),
    CountryName    NVARCHAR(150) NOT NULL DEFAULT(''),
    Cost           MONEY         NOT NULL DEFAULT(0),
    RepairsCost    MONEY         NOT NULL DEFAULT(0),
    PartsCost      MONEY         NOT NULL DEFAULT(0),
    TransportInCost MONEY        NOT NULL DEFAULT(0),
    SalePrice      NUMERIC(18,2) NOT NULL DEFAULT(0),
    SaleDate       DATETIME      NOT NULL DEFAULT(GETDATE())
);
GO

-- SOURCEDATA TABLES

DROP TABLE IF EXISTS SourceData.SalesInPounds;
CREATE TABLE SourceData.SalesInPounds (
    MakeName     NVARCHAR(100) NOT NULL DEFAULT(''),
    ModelName    NVARCHAR(150) NOT NULL DEFAULT(''),
    VehicleCost  VARCHAR(51)   NOT NULL DEFAULT('')
);
GO

DROP TABLE IF EXISTS SourceData.SalesText;
CREATE TABLE SourceData.SalesText (
    CountryName  NVARCHAR(150) NOT NULL DEFAULT(''),
    MakeName     NVARCHAR(100) NOT NULL DEFAULT(''),
    Cost         VARCHAR(20)   NOT NULL DEFAULT(''),
    SalePrice    VARCHAR(20)   NOT NULL DEFAULT('')
);
GO

DROP TABLE IF EXISTS SourceData.SalesInPounds_Cleaned;
CREATE TABLE SourceData.SalesInPounds_Cleaned (
    SalesInPoundsID  dbo.UDT_SalesID    IDENTITY(1,1) PRIMARY KEY,
    CustomerID       dbo.UDT_CustomerID NOT NULL DEFAULT(''),
    StockID          dbo.UDT_StockCode  NOT NULL DEFAULT(''),
    SaleDate         dbo.UDT_SaleDate   NOT NULL DEFAULT(GETDATE()),
    SalePriceGBP     dbo.UDT_SalePrice  NOT NULL DEFAULT(0),
    ConvertedUSD     dbo.UDT_SalePrice  NOT NULL DEFAULT(0)
);
GO

-- OUTPUT TABLES

DROP TABLE IF EXISTS Output.StockPrices;
CREATE TABLE Output.StockPrices (
    MakeName   NVARCHAR(100) NOT NULL DEFAULT(''),
    ModelName  NVARCHAR(150) NOT NULL DEFAULT(''),
    Cost       MONEY         NOT NULL DEFAULT(0)
);
GO
