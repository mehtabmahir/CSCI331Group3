USE PrestigeCars_3NF
GO

-- Author: Mehtab Mahir --

-- Reference.Country
INSERT INTO Reference.Country (
    CountryName, CountryISO2, CountryISO3, SalesRegion,
    CountryFlag, FlagFileName, FlagFileType
)
SELECT 
    ISNULL(RTRIM(LTRIM(C.CountryName)), ''),
    ISNULL(UPPER(RTRIM(LTRIM(C.CountryISO2))), ''),
    ISNULL(UPPER(RTRIM(LTRIM(C.CountryISO3))), ''),
    ISNULL(RTRIM(LTRIM(C.SalesRegion)), ''),
    ISNULL(C.CountryFlag, 0x),    -- Always fills with empty binary if NULL
    ISNULL(C.FlagFileName, ''),
    ISNULL(C.FlagFileType, '')
FROM PrestigeCars.Data.Country AS C;
GO

-- Reference.Color
INSERT INTO Reference.Color (Color)
SELECT DISTINCT ISNULL(UPPER(RTRIM(LTRIM(S.Color))), 'UNKNOWN')
FROM PrestigeCars.Data.Stock AS S
WHERE S.Color IS NOT NULL AND LTRIM(RTRIM(S.Color)) <> '';
GO

-- Data.Make
INSERT INTO Data.Make (MakeName, CountryID)
SELECT 
    ISNULL(RTRIM(LTRIM(M.MakeName)), ''),
    ISNULL(CR.CountryID, 1)
FROM PrestigeCars.Data.Make AS M
LEFT JOIN Reference.Country AS CR 
    ON UPPER(RTRIM(LTRIM(M.MakeCountry))) = CR.CountryISO3;
GO

-- Data.Model
INSERT INTO Data.Model (MakeID, ModelName, ModelVariant, YearFirstProduced, YearLastProduced)
SELECT 
    ISNULL(M2.MakeID, 1),
    ISNULL(RTRIM(LTRIM(Old.ModelName)), ''),
    ISNULL(RTRIM(LTRIM(Old.ModelVariant)), ''),
    ISNULL(RTRIM(LTRIM(Old.YearFirstProduced)), ''),
    ISNULL(RTRIM(LTRIM(Old.YearLastProduced)), '')
FROM PrestigeCars.Data.Model AS Old
INNER JOIN Data.Make AS M2 
    ON M2.MakeID = Old.MakeID;
GO

-- Data.Country
INSERT INTO Data.Country (
    CountryName, CountryISO2, CountryISO3, SalesRegion,
    CountryFlag, FlagFileName, FlagFileType
)
SELECT 
    ISNULL(RTRIM(LTRIM(C.CountryName)), ''),
    ISNULL(UPPER(RTRIM(LTRIM(C.CountryISO2))), ''),
    ISNULL(UPPER(RTRIM(LTRIM(C.CountryISO3))), ''),
    ISNULL(RTRIM(LTRIM(C.SalesRegion)), ''),
    ISNULL(C.CountryFlag, 0x),
    ISNULL(C.FlagFileName, ''),
    ISNULL(C.FlagFileType, '')
FROM PrestigeCars.Data.Country AS C;
GO


-- Data.Customer
INSERT INTO Data.Customer (CustomerID, CustomerName, Address1, Address2, Town, PostCode, CountryID, IsReseller, IsCreditRisk)
SELECT 
    ISNULL(UPPER(RTRIM(LTRIM(C.CustomerID))), ''),
    ISNULL(RTRIM(LTRIM(C.CustomerName)), ''),
    ISNULL(RTRIM(LTRIM(C.Address1)), ''),
    ISNULL(RTRIM(LTRIM(C.Address2)), ''),
    ISNULL(NULLIF(RTRIM(LTRIM(C.Town)), ''), 'Unknown'),
    CASE 
        WHEN C.PostCode IS NULL OR LTRIM(RTRIM(C.PostCode)) = '' THEN 'UNKNOWN'
        ELSE UPPER(REPLACE(C.PostCode, ' ', ''))
    END,
    ISNULL(CR.CountryID, 1),
    ISNULL(C.IsReseller, 0),
    ISNULL(C.IsCreditRisk, 0)
FROM PrestigeCars.Data.Customer AS C
LEFT JOIN Reference.Country AS CR 
    ON UPPER(RTRIM(LTRIM(C.Country))) = CR.CountryISO2;
GO

-- Data.Stock
INSERT INTO Data.Stock (StockCode, ModelID, Cost, RepairsCost, PartsCost, TransportInCost, IsRHD, ColorID, BuyerComments, DateBought, TimeBought)
SELECT 
    ISNULL(UPPER(RTRIM(LTRIM(S.StockCode))), ''),
    ISNULL(MD.ModelID, 1),
    ISNULL(S.Cost, 0),
    ISNULL(S.RepairsCost, 0),
    ISNULL(S.PartsCost, 0),
    ISNULL(S.TransportInCost, 0),
    ISNULL(S.IsRHD, 0),
    ISNULL(CO.ColorID, 1),
    ISNULL(RTRIM(LTRIM(S.BuyerComments)), ''),
    ISNULL(S.DateBought, '1900-01-01'), -- use safe default if NOT NULL
    ISNULL(S.TimeBought, '00:00:00')    -- use safe default if NOT NULL
FROM PrestigeCars.Data.Stock AS S
INNER JOIN Data.Model AS MD 
    ON MD.ModelID = S.ModelID
LEFT JOIN Reference.Color AS CO 
    ON UPPER(RTRIM(LTRIM(S.Color))) = CO.Color;
GO

-- Data.Sales
INSERT INTO Data.Sales (SalesID, CustomerID, InvoiceNumber, TotalSalePrice, SaleDate)
SELECT 
    S.SalesID,
    ISNULL(S.CustomerID, ''),
    ISNULL(UPPER(S.InvoiceNumber), ''),
    ISNULL(S.TotalSalePrice, 0.00),
    ISNULL(S.SaleDate, '1900-01-01')
FROM PrestigeCars.Data.Sales AS S
WHERE S.CustomerID IN (SELECT CustomerID FROM Data.Customer);
GO

-- Data.SalesDetails
INSERT INTO Data.SalesDetails (SalesID, LineItemNumber, StockID, SalePrice, LineItemDiscount)
SELECT 
    SD.SalesID,
    SD.LineItemNumber,
    ISNULL(UPPER(RTRIM(LTRIM(SD.StockID))), ''),
    ISNULL(SD.SalePrice, 0.00),
    ISNULL(SD.LineItemDiscount, 0.00)
FROM PrestigeCars.Data.SalesDetails AS SD
INNER JOIN Data.Sales AS S
    ON SD.SalesID = S.SalesID
INNER JOIN Data.Stock AS ST
    ON UPPER(RTRIM(LTRIM(SD.StockID))) = ST.StockCode;
GO

-- Data.PivotTable
INSERT INTO Data.PivotTable (ColorID, [2015], [2016], [2017], [2018])
SELECT 
    CO.ColorID,
    ISNULL(P.[2015], 0), ISNULL(P.[2016], 0), ISNULL(P.[2017], 0), ISNULL(P.[2018], 0)
FROM PrestigeCars.Data.PivotTable AS P
INNER JOIN Reference.Color AS CO 
    ON UPPER(RTRIM(LTRIM(P.Color))) = CO.Color;
GO

-- DataTransfer tables (repeat pattern)
INSERT INTO DataTransfer.Sales2015 
    (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
SELECT 
    ISNULL(RTRIM(LTRIM(T.MakeName)), ''),
    ISNULL(RTRIM(LTRIM(T.ModelName)), ''),
    ISNULL(RTRIM(LTRIM(T.CustomerName)), ''),
    ISNULL(RTRIM(LTRIM(T.CountryName)), ''),
    ISNULL(T.Cost, 0),
    ISNULL(T.RepairsCost, 0),
    ISNULL(T.PartsCost, 0),
    ISNULL(T.TransportInCost, 0),
    ISNULL(T.SalePrice, 0),
    ISNULL(T.SaleDate, '1900-01-01')
FROM PrestigeCars.DataTransfer.Sales2015 AS T;
GO

-- Repeat exactly the above pattern for Sales2016, 2017, 2018 (just change table names).
-- ... (Omitted for brevity)

-- Reference.Budget
INSERT INTO Reference.Budget (BudgetValue, Year, Month, BudgetDetail, BudgetElement)
SELECT 
    ISNULL(B.BudgetValue, 0),
    ISNULL(B.Year, 0),
    ISNULL(B.Month, 1),
    ISNULL(RTRIM(LTRIM(B.BudgetDetail)), ''),
    ISNULL(RTRIM(LTRIM(B.BudgetElement)), '')
FROM PrestigeCars.Reference.Budget AS B;
GO

-- Reference.Forex
INSERT INTO Reference.Forex (ExchangeDate, ISOCurrency, ExchangeRate)
SELECT 
    ISNULL(F.ExchangeDate, '1900-01-01'), 
    ISNULL(UPPER(F.ISOCurrency), 'USD'),
    ISNULL(F.ExchangeRate, 1)
FROM PrestigeCars.Reference.Forex AS F;
GO

-- Reference.MarketingCategories
INSERT INTO Reference.MarketingCategories (MakeName, MarketingType)
SELECT 
    ISNULL(RTRIM(LTRIM(MC.MakeName)), ''),
    ISNULL(RTRIM(LTRIM(MC.MarketingType)), '')
FROM PrestigeCars.Reference.MarketingCategories AS MC;
GO

-- Reference.MarketingInformation
INSERT INTO Reference.MarketingInformation (CUST, Country, SpendCapacity)
SELECT 
    ISNULL(RTRIM(LTRIM(MI.CUST)), ''),
    ISNULL(UPPER(RTRIM(LTRIM(MI.Country))), ''),
    ISNULL(RTRIM(LTRIM(MI.SpendCapacity)), '')
FROM PrestigeCars.Reference.MarketingInformation AS MI;
GO

-- Reference.SalesCategory
INSERT INTO Reference.SalesCategory (LowerThreshold, UpperThreshold, CategoryDescription)
SELECT 
    ISNULL(SC.LowerThreshold, 0),
    ISNULL(SC.UpperThreshold, 0),
    ISNULL(RTRIM(LTRIM(SC.CategoryDescription)), '')
FROM PrestigeCars.Reference.SalesCategory AS SC;
GO

-- Reference.Staff
INSERT INTO Reference.Staff (StaffName, ManagerID, Department)
SELECT 
    ISNULL(RTRIM(LTRIM(SF.StaffName)), ''),
    ISNULL(SF.ManagerID, 0),
    ISNULL(RTRIM(LTRIM(SF.Department)), '')
FROM PrestigeCars.Reference.Staff AS SF;
GO

-- Reference.StaffHierarchy
INSERT INTO Reference.StaffHierarchy (HierarchyReference, StaffName, ManagerID, Department)
SELECT 
    ISNULL(SH.HierarchyReference, 0x),
    ISNULL(RTRIM(LTRIM(SH.StaffName)), ''),
    ISNULL(SH.ManagerID, 0),
    ISNULL(RTRIM(LTRIM(SH.Department)), '')
FROM PrestigeCars.Reference.StaffHierarchy AS SH;
GO

-- Reference.YearlySales
INSERT INTO Reference.YearlySales (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
SELECT 
    ISNULL(RTRIM(LTRIM(Y.MakeName)), ''),
    ISNULL(RTRIM(LTRIM(Y.ModelName)), ''),
    ISNULL(RTRIM(LTRIM(Y.CustomerName)), ''),
    ISNULL(RTRIM(LTRIM(Y.CountryName)), ''),
    ISNULL(Y.Cost, 0),
    ISNULL(Y.RepairsCost, 0),
    ISNULL(Y.PartsCost, 0),
    ISNULL(Y.TransportInCost, 0),
    ISNULL(Y.SalePrice, 0),
    ISNULL(Y.SaleDate, '1900-01-01')
FROM PrestigeCars.Reference.YearlySales AS Y;
GO

-- SourceData.SalesInPounds
INSERT INTO SourceData.SalesInPounds (MakeName, ModelName, VehicleCost)
SELECT 
    ISNULL(RTRIM(LTRIM(SIP.MakeName)), ''),
    ISNULL(RTRIM(LTRIM(SIP.ModelName)), ''),
    ISNULL(RTRIM(LTRIM(SIP.VehicleCost)), '0')
FROM PrestigeCars.SourceData.SalesInPounds AS SIP;
GO

-- SourceData.SalesText
INSERT INTO SourceData.SalesText (CountryName, MakeName, Cost, SalePrice)
SELECT 
    ISNULL(RTRIM(LTRIM(ST.CountryName)), ''),
    ISNULL(RTRIM(LTRIM(ST.MakeName)), ''),
    ISNULL(RTRIM(LTRIM(ST.Cost)), '0'),
    ISNULL(RTRIM(LTRIM(ST.SalePrice)), '0')
FROM PrestigeCars.SourceData.SalesText AS ST;
GO

-- Output.StockPrices
INSERT INTO Output.StockPrices (MakeName, ModelName, Cost)
SELECT 
    ISNULL(MK.MakeName, ''),
    ISNULL(MD.ModelName, ''),
    ISNULL(ST.Cost, 0)
FROM Data.Stock AS ST
INNER JOIN Data.Model AS MD ON ST.ModelID = MD.ModelID
INNER JOIN Data.Make  AS MK ON MD.MakeID = MK.MakeID;
GO
