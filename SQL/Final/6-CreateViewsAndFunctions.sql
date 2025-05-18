USE PrestigeCars_3NF;
GO

-- Author: William Wang --

-- View: Stock with Color Name
CREATE OR ALTER VIEW vw_StockWithColor AS
SELECT s.StockCode, s.ModelID, s.Cost, s.RepairsCost, s.PartsCost, s.TransportInCost, s.IsRHD,
       c.Color AS ColorName, s.BuyerComments, s.DateBought, s.TimeBought
FROM Data.Stock s
LEFT JOIN Reference.Color c ON s.ColorID = c.ColorID;
GO

-- View: Sales By Year and Color
CREATE OR ALTER VIEW vw_SalesByYearAndColor AS
SELECT YEAR(s.SaleDate) AS SaleYear, c.Color, COUNT(sd.SalesDetailsID) AS CarsSold, SUM(sd.SalePrice) AS TotalRevenue
FROM Data.Sales s
JOIN Data.SalesDetails sd ON s.SalesID = sd.SalesID
LEFT JOIN Data.Stock st ON sd.StockID = st.StockCode
LEFT JOIN Reference.Color c ON st.ColorID = c.ColorID
GROUP BY YEAR(s.SaleDate), c.Color;
GO

-- View: Models With Stock
CREATE OR ALTER VIEW vw_ModelsWithStock AS
SELECT m.ModelID, m.ModelName, m.ModelVariant, mk.MakeName, COUNT(s.StockCode) AS StockCount
FROM Data.Model m
LEFT JOIN Data.Make mk ON m.MakeID = mk.MakeID
LEFT JOIN Data.Stock s ON m.ModelID = s.ModelID
GROUP BY m.ModelID, m.ModelName, m.ModelVariant, mk.MakeName;
GO

-- View: Customers With Sales
CREATE OR ALTER VIEW vw_CustomersWithSales AS
SELECT c.CustomerID, c.CustomerName, c.CountryID, COUNT(s.SalesID) AS SalesCount, SUM(s.TotalSalePrice) AS TotalSales
FROM Data.Customer c
LEFT JOIN Data.Sales s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID, c.CustomerName, c.CountryID;
GO

-- View: Country Sales Summary
CREATE OR ALTER VIEW vw_CountrySales AS
SELECT rc.CountryName, COUNT(s.SalesID) AS SalesCount, SUM(s.TotalSalePrice) AS TotalRevenue
FROM Reference.Country rc
LEFT JOIN Data.Customer c ON rc.CountryID = c.CountryID
LEFT JOIN Data.Sales s ON c.CustomerID = s.CustomerID
GROUP BY rc.CountryName;
GO

-- View: Yearly Sales Summary
CREATE OR ALTER VIEW vw_YearlySalesSummary AS
SELECT YEAR(s.SaleDate) AS SaleYear, SUM(s.TotalSalePrice) AS TotalRevenue, COUNT(s.SalesID) AS NumberOfSales
FROM Data.Sales s
GROUP BY YEAR(s.SaleDate);
GO

-- View: Budget with Details
CREATE OR ALTER VIEW vw_BudgetWithDetails AS
SELECT b.BudgetKey, b.BudgetValue, b.Year, b.Month, b.BudgetDetail, b.BudgetElement, c.Color
FROM Reference.Budget b
LEFT JOIN Reference.Color c ON b.BudgetDetail = c.Color
GO

-- Inline Table-Valued Function: Customer Sales Summary
CREATE OR ALTER FUNCTION fn_CustomerSalesSummary (@CustomerID NVARCHAR(5))
RETURNS TABLE
AS
RETURN
    SELECT s.SalesID, s.SaleDate, s.TotalSalePrice
    FROM Data.Sales s
    WHERE s.CustomerID = @CustomerID;
GO

-- Inline Table-Valued Function: Model Sales By Year
CREATE OR ALTER FUNCTION fn_ModelSalesByYear (@ModelID INT)
RETURNS TABLE
AS
RETURN
    SELECT YEAR(s.SaleDate) AS SaleYear, SUM(sd.SalePrice) AS TotalSales
    FROM Data.SalesDetails sd
    JOIN Data.Sales s ON sd.SalesID = s.SalesID
    JOIN Data.Stock st ON sd.StockID = st.StockCode
    WHERE st.ModelID = @ModelID
    GROUP BY YEAR(s.SaleDate);
GO

-- (You can also re-add the passthrough views if needed)
