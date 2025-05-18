USE PrestigeCars_3NF
GO

-- Credits: William & Mehtab

-- Views
-- Combines all yearly sales into one
CREATE OR ALTER VIEW vw_AllSales AS
SELECT *, 2015 AS SalesYear FROM DataTransfer.Sales2015
UNION ALL
SELECT *, 2016 AS SalesYear FROM DataTransfer.Sales2016
UNION ALL
SELECT *, 2017 AS SalesYear FROM DataTransfer.Sales2017
UNION ALL
SELECT *, 2018 AS SalesYear FROM DataTransfer.Sales2018;
GO

-- Show car models, costs, and their marketing types
CREATE OR ALTER VIEW vw_StockWithMarketing AS
SELECT
    s.MakeName,
    s.ModelName,
    s.Cost,
    m.MarketingType
FROM Output.StockPrices s
LEFT JOIN Reference.MarketingCategories m ON s.MakeName = m.MakeName;
GO

-- Show budget details (fixed to use new Reference.Budget structure)
CREATE OR ALTER VIEW vw_SalesBudgets AS
SELECT
    BudgetValue,
    Year AS BudgetYear,
    Month AS BudgetMonth,
    BudgetDetail,
    BudgetElement
FROM Reference.Budget;
GO

-- Reference table views (simple)
CREATE OR ALTER VIEW vw_Forex AS
SELECT ExchangeDate, ISOCurrency, ExchangeRate
FROM Reference.Forex;
GO

CREATE OR ALTER VIEW vw_MarketingCategories AS
SELECT MakeName, MarketingType
FROM Reference.MarketingCategories;
GO

CREATE OR ALTER VIEW vw_MarketingInformation AS
SELECT CUST, Country, SpendCapacity
FROM Reference.MarketingInformation;
GO

CREATE OR ALTER VIEW vw_SalesCategory AS
SELECT LowerThreshold, UpperThreshold, CategoryDescription
FROM Reference.SalesCategory;
GO

CREATE OR ALTER VIEW vw_Staff AS
SELECT StaffID, StaffName, ManagerID, Department
FROM Reference.Staff;
GO

CREATE OR ALTER VIEW vw_StaffHierarchy AS
SELECT HierarchyReference, StaffID, StaffName, ManagerID, Department
FROM Reference.StaffHierarchy;
GO

CREATE OR ALTER VIEW vw_YearlySales AS
SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate
FROM Reference.YearlySales;
GO

CREATE OR ALTER VIEW vw_SalesInPounds AS
SELECT MakeName, ModelName, VehicleCost
FROM SourceData.SalesInPounds;
GO

CREATE OR ALTER VIEW vw_SalesText AS
SELECT CountryName, MakeName, Cost, SalePrice
FROM SourceData.SalesText;
GO

-- ITVFs (inline table-valued functions)
-- Get all sales from 2015 to 2018
CREATE OR ALTER FUNCTION dbo.fn_GetAllSales()
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

-- Function to filter StockPrices by Make
CREATE OR ALTER FUNCTION fn_StockPricesByMake (@MakeName NVARCHAR(100))
RETURNS TABLE
AS
RETURN (
    SELECT MakeName, ModelName, Cost
    FROM Output.StockPrices
    WHERE MakeName = @MakeName
);
GO

-- Function to get Budget entries by Year (fixed)
CREATE OR ALTER FUNCTION fn_SalesBudgetsByYear (@BudgetYear INT)
RETURNS TABLE
AS
RETURN (
    SELECT
        BudgetValue,
        Year AS BudgetYear,
        Month AS BudgetMonth,
        BudgetDetail,
        BudgetElement
    FROM Reference.Budget
    WHERE Year = @BudgetYear
);
GO

-- Function to filter Forex by currency code
CREATE OR ALTER FUNCTION fn_ForexByCurrency (@ISOCurrency CHAR(3))
RETURNS TABLE
AS
RETURN (
    SELECT ExchangeDate, ISOCurrency, ExchangeRate
    FROM Reference.Forex
    WHERE ISOCurrency = @ISOCurrency
);
GO

-- Filter MarketingCategories by make name
CREATE OR ALTER FUNCTION fn_MarketingCategoriesByMake (@MakeName NVARCHAR(100))
RETURNS TABLE
AS
RETURN (
    SELECT MakeName, MarketingType
    FROM Reference.MarketingCategories
    WHERE MakeName = @MakeName
);
GO

-- Filter MarketingInfo by country code
CREATE OR ALTER FUNCTION fn_MarketingInfoByCountry (@Country NCHAR(10))
RETURNS TABLE
AS
RETURN (
    SELECT CUST, Country, SpendCapacity
    FROM Reference.MarketingInformation
    WHERE Country = @Country
);
GO

-- Find SalesCategory by value threshold
CREATE OR ALTER FUNCTION fn_SalesCategoryByValue (@Value INT)
RETURNS TABLE
AS
RETURN (
    SELECT LowerThreshold, UpperThreshold, CategoryDescription
    FROM Reference.SalesCategory
    WHERE @Value BETWEEN LowerThreshold AND UpperThreshold
);
GO

-- Filter Staff by Department
CREATE OR ALTER FUNCTION fn_StaffByDepartment (@Department NVARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT StaffID, StaffName, ManagerID, Department
    FROM Reference.Staff
    WHERE Department = @Department
);
GO

-- Filter StaffHierarchy by Manager
CREATE OR ALTER FUNCTION fn_StaffHierarchyByManager (@ManagerID INT)
RETURNS TABLE
AS
RETURN (
    SELECT HierarchyReference, StaffID, StaffName, ManagerID, Department
    FROM Reference.StaffHierarchy
    WHERE ManagerID = @ManagerID
);
GO

-- Filter YearlySales by date range
CREATE OR ALTER FUNCTION fn_YearlySalesByDateRange (
    @StartDate DATETIME,
    @EndDate DATETIME
)
RETURNS TABLE
AS
RETURN (
    SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate
    FROM Reference.YearlySales
    WHERE SaleDate BETWEEN @StartDate AND @EndDate
);
GO

-- Filter SalesInPounds by Make/Model
CREATE OR ALTER FUNCTION fn_SalesInPoundsByMakeModel (
    @MakeName NVARCHAR(100),
    @ModelName NVARCHAR(150)
)
RETURNS TABLE
AS
RETURN (
    SELECT MakeName, ModelName, VehicleCost
    FROM SourceData.SalesInPounds
    WHERE MakeName = @MakeName
      AND ModelName = @ModelName
);
GO

-- Filter SalesText by Country and Make
CREATE OR ALTER FUNCTION fn_SalesTextByCountryMake (
    @CountryName NVARCHAR(150),
    @MakeName NVARCHAR(100)
)
RETURNS TABLE
AS
RETURN (
    SELECT CountryName, MakeName, Cost, SalePrice
    FROM SourceData.SalesText
    WHERE CountryName = @CountryName
      AND MakeName = @MakeName
);
GO
