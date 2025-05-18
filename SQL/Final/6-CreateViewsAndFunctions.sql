USE PrestigeCars_3NF
GO

--Author: Mehtab Mahir--

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