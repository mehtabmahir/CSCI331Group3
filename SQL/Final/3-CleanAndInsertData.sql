USE PrestigeCars_3NF
GO

-- Reference.Country
INSERT INTO Reference.Country (CountryName, CountryISO2, CountryISO3, SalesRegion, CountryFlag, FlagFileName, FlagFileType)
SELECT 
    RTRIM(LTRIM(C.CountryName)),
    UPPER(RTRIM(LTRIM(C.CountryISO2))),
    UPPER(RTRIM(LTRIM(C.CountryISO3))),
    RTRIM(LTRIM(C.SalesRegion)),
    C.CountryFlag,
    C.FlagFileName,
    C.FlagFileType
FROM PrestigeCars.Data.Country AS C;
GO

-- Reference.Color
INSERT INTO Reference.Color (Color)
SELECT DISTINCT UPPER(RTRIM(LTRIM(S.Color)))
FROM PrestigeCars.Data.Stock AS S
WHERE S.Color IS NOT NULL AND LTRIM(RTRIM(S.Color)) <> '';
GO

-- Data.Make
INSERT INTO Data.Make (MakeName, CountryID)
SELECT 
    RTRIM(LTRIM(M.MakeName)),
    CR.CountryID
FROM PrestigeCars.Data.Make AS M
LEFT JOIN Reference.Country AS CR 
    ON UPPER(RTRIM(LTRIM(M.MakeCountry))) = CR.CountryISO3;
GO

-- Data.Model
INSERT INTO Data.Model (MakeID, ModelName, ModelVariant, YearFirstProduced, YearLastProduced)
SELECT 
    M2.MakeID,
    RTRIM(LTRIM(Old.ModelName)),
    NULLIF(RTRIM(LTRIM(Old.ModelVariant)), ''),
    NULLIF(RTRIM(LTRIM(Old.YearFirstProduced)), ''),
    NULLIF(RTRIM(LTRIM(Old.YearLastProduced)), '')
FROM PrestigeCars.Data.Model AS Old
INNER JOIN Data.Make AS M2 
    ON M2.MakeID = Old.MakeID;
GO

-- Data.Customer
INSERT INTO Data.Customer (CustomerID, CustomerName, Address1, Address2, Town, PostCode, CountryID, IsReseller, IsCreditRisk)
SELECT 
    UPPER(RTRIM(LTRIM(C.CustomerID))),
    RTRIM(LTRIM(C.CustomerName)),
    RTRIM(LTRIM(C.Address1)),
    NULLIF(RTRIM(LTRIM(C.Address2)), ''),
    ISNULL(NULLIF(RTRIM(LTRIM(C.Town)), ''), 'Unknown'),
    CASE 
        WHEN C.PostCode IS NULL OR LTRIM(RTRIM(C.PostCode)) = '' THEN 'UNKNOWN'
        ELSE UPPER(REPLACE(C.PostCode, ' ', ''))
    END,
    CR.CountryID,
    ISNULL(C.IsReseller, 0),
    ISNULL(C.IsCreditRisk, 0)
FROM PrestigeCars.Data.Customer AS C
LEFT JOIN Reference.Country AS CR 
    ON UPPER(RTRIM(LTRIM(C.Country))) = CR.CountryISO2;
GO

-- Data.Stock
INSERT INTO Data.Stock (StockCode, ModelID, Cost, RepairsCost, PartsCost, TransportInCost, IsRHD, ColorID, BuyerComments, DateBought, TimeBought)
SELECT 
    UPPER(RTRIM(LTRIM(S.StockCode))),
    MD.ModelID,
    ISNULL(S.Cost, 0),
    ISNULL(S.RepairsCost, 0),
    ISNULL(S.PartsCost, 0),
    ISNULL(S.TransportInCost, 0),
    ISNULL(S.IsRHD, 0),
    CO.ColorID,
    NULLIF(RTRIM(LTRIM(S.BuyerComments)), ''),
    S.DateBought,
    S.TimeBought
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
    S.CustomerID,
    UPPER(S.InvoiceNumber),
    ISNULL(S.TotalSalePrice, 0.00),
    S.SaleDate
FROM PrestigeCars.Data.Sales AS S
WHERE S.CustomerID IN (SELECT CustomerID FROM Data.Customer);
GO

-- Data.SalesDetails (only rows with valid SalesID and StockID)
INSERT INTO Data.SalesDetails (SalesID, LineItemNumber, StockID, SalePrice, LineItemDiscount)
SELECT 
    SD.SalesID,
    SD.LineItemNumber,
    UPPER(RTRIM(LTRIM(SD.StockID))),
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
    P.[2015], P.[2016], P.[2017], P.[2018]
FROM PrestigeCars.Data.PivotTable AS P
INNER JOIN Reference.Color AS CO 
    ON UPPER(RTRIM(LTRIM(P.Color))) = CO.Color;
GO

-- DataTransfer.Sales2015
INSERT INTO DataTransfer.Sales2015 
    (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
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
GO

-- DataTransfer.Sales2016
INSERT INTO DataTransfer.Sales2016 
    (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
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
GO

-- DataTransfer.Sales2017
INSERT INTO DataTransfer.Sales2017 
    (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
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
GO

-- DataTransfer.Sales2018
INSERT INTO DataTransfer.Sales2018 
    (MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate)
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
GO

-- Reference.Budget
INSERT INTO Reference.Budget (BudgetValue, Year, Month, BudgetDetail, BudgetElement)
SELECT 
    B.BudgetValue,
    B.Year,
    B.Month,
    RTRIM(LTRIM(B.BudgetDetail)),
    RTRIM(LTRIM(B.BudgetElement))
FROM PrestigeCars.Reference.Budget AS B;
GO

-- Reference.Forex
INSERT INTO Reference.Forex (ExchangeDate, ISOCurrency, ExchangeRate)
SELECT F.ExchangeDate, UPPER(F.ISOCurrency), F.ExchangeRate
FROM PrestigeCars.Reference.Forex AS F;
GO

-- Reference.MarketingCategories
INSERT INTO Reference.MarketingCategories (MakeName, MarketingType)
SELECT RTRIM(LTRIM(MC.MakeName)), RTRIM(LTRIM(MC.MarketingType))
FROM PrestigeCars.Reference.MarketingCategories AS MC;
GO

-- Reference.MarketingInformation
INSERT INTO Reference.MarketingInformation (CUST, Country, SpendCapacity)
SELECT RTRIM(LTRIM(MI.CUST)), UPPER(RTRIM(LTRIM(MI.Country))), RTRIM(LTRIM(MI.SpendCapacity))
FROM PrestigeCars.Reference.MarketingInformation AS MI;
GO

-- Reference.SalesCategory
INSERT INTO Reference.SalesCategory (LowerThreshold, UpperThreshold, CategoryDescription)
SELECT SC.LowerThreshold, SC.UpperThreshold, RTRIM(LTRIM(SC.CategoryDescription))
FROM PrestigeCars.Reference.SalesCategory AS SC;
GO

-- Reference.Staff
INSERT INTO Reference.Staff (StaffName, ManagerID, Department)
SELECT RTRIM(LTRIM(SF.StaffName)), SF.ManagerID, RTRIM(LTRIM(SF.Department))
FROM PrestigeCars.Reference.Staff AS SF;
GO

-- Reference.StaffHierarchy
INSERT INTO Reference.StaffHierarchy (HierarchyReference, StaffName, ManagerID, Department)
SELECT SH.HierarchyReference, RTRIM(LTRIM(SH.StaffName)), SH.ManagerID, RTRIM(LTRIM(SH.Department))
FROM PrestigeCars.Reference.StaffHierarchy AS SH;
GO

-- Reference.YearlySales
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
GO

-- SourceData.SalesInPounds
INSERT INTO SourceData.SalesInPounds (MakeName, ModelName, VehicleCost)
SELECT RTRIM(LTRIM(SIP.MakeName)), RTRIM(LTRIM(SIP.ModelName)), RTRIM(LTRIM(SIP.VehicleCost))
FROM PrestigeCars.SourceData.SalesInPounds AS SIP;
GO

-- SourceData.SalesText
INSERT INTO SourceData.SalesText (CountryName, MakeName, Cost, SalePrice)
SELECT RTRIM(LTRIM(ST.CountryName)), RTRIM(LTRIM(ST.MakeName)), RTRIM(LTRIM(ST.Cost)), RTRIM(LTRIM(ST.SalePrice))
FROM PrestigeCars.SourceData.SalesText AS ST;
GO

-- Output.StockPrices
INSERT INTO Output.StockPrices (MakeName, ModelName, Cost)
SELECT 
    MK.MakeName,
    MD.ModelName,
    ST.Cost
FROM Data.Stock AS ST
INNER JOIN Data.Model AS MD ON ST.ModelID = MD.ModelID
INNER JOIN Data.Make  AS MK ON MD.MakeID = MK.MakeID;
GO
