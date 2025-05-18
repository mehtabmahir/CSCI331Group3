USE PrestigeCars_3NF
GO

-- Credits: Ashly --

-- REFERENCE TABLES

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

DROP TABLE IF EXISTS Reference.Color;
CREATE TABLE Reference.Color (
    ColorID   dbo.UDT_ColorID   IDENTITY(1,1) PRIMARY KEY,
    Color     dbo.UDT_Color     NOT NULL
);
GO

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

DROP TABLE IF EXISTS Reference.Forex;
CREATE TABLE Reference.Forex (
    ExchangeDate  DATE          NULL,
    ISOCurrency   CHAR(3)       NULL,
    ExchangeRate  MONEY         NULL
);
GO

DROP TABLE IF EXISTS Reference.MarketingCategories;
CREATE TABLE Reference.MarketingCategories (
    MakeName        NVARCHAR(100) NULL,
    MarketingType   NVARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS Reference.MarketingInformation;
CREATE TABLE Reference.MarketingInformation (
    CUST           NVARCHAR(150) NULL,
    Country        NCHAR(10)     NULL,
    SpendCapacity  VARCHAR(25)   NULL
);
GO

DROP TABLE IF EXISTS Reference.SalesBudgets;
CREATE TABLE Reference.SalesBudgets (
    SalesBudgetID   dbo.UDT_SalesID    IDENTITY(1,1) PRIMARY KEY,
    ColorID         dbo.UDT_ColorID    NOT NULL,
    BudgetYear      dbo.UDT_Year       NOT NULL,
    BudgetAmount    dbo.UDT_SalePrice  NOT NULL,
    CONSTRAINT FK_SalesBudgets_Color FOREIGN KEY (ColorID) REFERENCES Reference.Color(ColorID)
);
GO

DROP TABLE IF EXISTS Reference.SalesCategory;
CREATE TABLE Reference.SalesCategory (
    LowerThreshold       INT            NULL,
    UpperThreshold       INT            NULL,
    CategoryDescription  NVARCHAR(50)   NULL
);
GO

DROP TABLE IF EXISTS Reference.Staff;
CREATE TABLE Reference.Staff (
    StaffID     INT             IDENTITY(1,1) PRIMARY KEY,
    StaffName   NVARCHAR(50)    NULL,
    ManagerID   INT             NULL,
    Department  NVARCHAR(50)    NULL
);
GO

DROP TABLE IF EXISTS Reference.StaffHierarchy;
CREATE TABLE Reference.StaffHierarchy (
    HierarchyReference  HIERARCHYID   NULL,
    StaffID             INT           IDENTITY(1,1) PRIMARY KEY,
    StaffName           NVARCHAR(50)  NULL,
    ManagerID           INT           NULL,
    Department          NVARCHAR(50)  NULL
);
GO

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

-- DATA TABLES

DROP TABLE IF EXISTS Data.Make;
CREATE TABLE Data.Make (
    MakeID         dbo.UDT_MakeID      IDENTITY(1,1) PRIMARY KEY,
    MakeName       dbo.UDT_MakeName    NOT NULL,
    CountryID      dbo.UDT_CountryRef  NULL,
    CONSTRAINT FK_Make_Country FOREIGN KEY (CountryID) REFERENCES Reference.Country(CountryID)
);
GO

DROP TABLE IF EXISTS Data.Model;
CREATE TABLE Data.Model (
    ModelID             dbo.UDT_ModelID     IDENTITY(1,1) PRIMARY KEY,
    MakeID              dbo.UDT_MakeID      NOT NULL,
    ModelName           dbo.UDT_ModelName   NOT NULL,
    ModelVariant        dbo.UDT_ModelVariant NULL,
    YearFirstProduced   dbo.UDT_Year        NULL,
    YearLastProduced    dbo.UDT_Year        NULL,
    CONSTRAINT FK_Model_Make FOREIGN KEY (MakeID) REFERENCES Data.Make(MakeID)
);
GO

DROP TABLE IF EXISTS Data.Customer;
CREATE TABLE Data.Customer (
    CustomerID      dbo.UDT_CustomerID    NOT NULL PRIMARY KEY,
    CustomerName    dbo.UDT_CustomerName  NOT NULL  DEFAULT(''),
    Address1        dbo.UDT_Address       NOT NULL  DEFAULT(''),
    Address2        dbo.UDT_Address       NULL      DEFAULT(''),
    Town            dbo.UDT_Address       NOT NULL  DEFAULT('Unknown'),
    PostCode        dbo.UDT_CountryISO2   NOT NULL  DEFAULT(''),
    CountryID       dbo.UDT_CountryRef    NOT NULL,
    IsReseller      dbo.UDT_IsReseller    NOT NULL  DEFAULT(0),
    IsCreditRisk    dbo.UDT_IsCreditRisk  NOT NULL  DEFAULT(0),
    CONSTRAINT FK_Customer_Country FOREIGN KEY (CountryID) REFERENCES Reference.Country(CountryID)
);
GO

DROP TABLE IF EXISTS Data.Stock;
CREATE TABLE Data.Stock (
    StockCode        dbo.UDT_StockCode    NOT NULL PRIMARY KEY,
    ModelID          dbo.UDT_ModelID      NOT NULL, -- CORRECTED: same UDT as Data.Model.ModelID
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

DROP TABLE IF EXISTS Data.Sales;
CREATE TABLE Data.Sales (
    SalesID        dbo.UDT_SalesID       NOT NULL PRIMARY KEY,
    CustomerID     dbo.UDT_CustomerID    NOT NULL,
    InvoiceNumber  dbo.UDT_InvoiceNumber NULL,
    TotalSalePrice dbo.UDT_TotalSalePrice NULL,
    SaleDate       dbo.UDT_SaleDate      NULL,
    CONSTRAINT FK_Sales_Customer FOREIGN KEY (CustomerID) REFERENCES Data.Customer(CustomerID)
);
GO

DROP TABLE IF EXISTS Data.SalesDetails;
CREATE TABLE Data.SalesDetails (
    SalesDetailsID    dbo.UDT_SalesDetailsID  IDENTITY(1,1) PRIMARY KEY,
    SalesID           dbo.UDT_SalesID         NOT NULL,
    LineItemNumber    dbo.UDT_LineItemNumber  NOT NULL,
    StockID           dbo.UDT_StockCode       NOT NULL,
    SalePrice         dbo.UDT_SalePrice       NULL    DEFAULT(0),
    LineItemDiscount  dbo.UDT_LineItemDiscount NULL   DEFAULT(0),
    CONSTRAINT FK_SalesDetails_Sales FOREIGN KEY (SalesID) REFERENCES Data.Sales(SalesID),
    CONSTRAINT FK_SalesDetails_Stock FOREIGN KEY (StockID) REFERENCES Data.Stock(StockCode)
);
GO

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

-- DATATRANSFER TABLES

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

-- SOURCEDATA TABLES

DROP TABLE IF EXISTS SourceData.SalesInPounds;
CREATE TABLE SourceData.SalesInPounds (
    MakeName     NVARCHAR(100) NULL,
    ModelName    NVARCHAR(150) NULL,
    VehicleCost  VARCHAR(51)   NULL
);
GO

DROP TABLE IF EXISTS SourceData.SalesText;
CREATE TABLE SourceData.SalesText (
    CountryName  NVARCHAR(150) NULL,
    MakeName     NVARCHAR(100) NULL,
    Cost         VARCHAR(20)   NULL,
    SalePrice    VARCHAR(20)   NULL
);
GO

DROP TABLE IF EXISTS SourceData.SalesInPounds_Cleaned;
CREATE TABLE SourceData.SalesInPounds_Cleaned (
    SalesInPoundsID  dbo.UDT_SalesID    IDENTITY(1,1) PRIMARY KEY,
    CustomerID       dbo.UDT_CustomerID NULL,
    StockID          dbo.UDT_StockCode  NULL,
    SaleDate         dbo.UDT_SaleDate   NULL,
    SalePriceGBP     dbo.UDT_SalePrice  NULL,
    ConvertedUSD     dbo.UDT_SalePrice  NULL
);
GO

-- OUTPUT TABLES

DROP TABLE IF EXISTS Output.StockPrices;
CREATE TABLE Output.StockPrices (
    MakeName   NVARCHAR(100) NULL,
    ModelName  NVARCHAR(150) NULL,
    Cost       MONEY         NULL
);
GO
