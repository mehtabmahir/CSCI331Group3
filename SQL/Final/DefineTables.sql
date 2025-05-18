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