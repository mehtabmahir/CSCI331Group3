USE PrestigeCars_3NF
GO

-- Insert Cleaning Logic for Reference.Country
-- Populate reference Country table from original Data.Country
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
GO

-- Insert Cleaning Logic for Reference.Color
-- Populate Color lookup from distinct Stock colors in original data
INSERT INTO Reference.Color (Color)
SELECT DISTINCT UPPER(RTRIM(LTRIM(S.Color)))  -- use upper-case color name for consistency
FROM PrestigeCars.Data.Stock AS S
WHERE S.Color IS NOT NULL AND LTRIM(RTRIM(S.Color)) <> '';
GO

-- Insert Cleaning Logic for Data.Make
INSERT INTO Data.Make (MakeName, CountryID)
SELECT 
    RTRIM(LTRIM(M.MakeName)),                -- trim Make name
    CR.CountryID                             -- lookup CountryID by country code
FROM PrestigeCars.Data.Make AS M
LEFT JOIN Reference.Country AS CR 
    ON UPPER(RTRIM(LTRIM(M.MakeCountry))) = CR.CountryISO3;
GO

-- Insert Cleaning Logic for Data.Model
INSERT INTO Data.Model (MakeID, ModelName, ModelVariant, YearFirstProduced, YearLastProduced)
SELECT 
    M2.MakeID,
    RTRIM(LTRIM(Old.ModelName)), 
    NULLIF(RTRIM(LTRIM(Old.ModelVariant)), ''),  -- trim variant, convert empty to NULL
    NULLIF(RTRIM(LTRIM(Old.YearFirstProduced)), ''),  -- blank years to NULL
    NULLIF(RTRIM(LTRIM(Old.YearLastProduced)), '')
FROM PrestigeCars.Data.Model AS Old
JOIN Data.Make AS M2 
    ON M2.MakeName = RTRIM(LTRIM(Old.MakeID)) OR M2.MakeID = Old.MakeID;
    /* Note: Original Model.MakeID was a foreign key. 
       We join by MakeID (if numeric match) or by name if needed 
       to get the new MakeID (ensuring proper mapping after any identity reseed). */
GO

-- Insert Cleaning Logic for Data.Customer
INSERT INTO Data.Customer (CustomerID, CustomerName, Address1, Address2, Town, PostCode, CountryID, IsReseller, IsCreditRisk)
SELECT 
    UPPER(RTRIM(LTRIM(C.CustomerID))),                  -- CustomerID to upper-case
    RTRIM(LTRIM(C.CustomerName)),                       -- trim CustomerName
    RTRIM(LTRIM(C.Address1)),                           -- trim Address1
    NULLIF(RTRIM(LTRIM(C.Address2)), ''),               -- trim Address2, blank to NULL
    ISNULL(NULLIF(RTRIM(LTRIM(C.Town)), ''), 'Unknown'),-- trim Town, blank to 'Unknown'
    UPPER(REPLACE(C.PostCode, ' ', '')),                -- remove spaces and upper-case PostCode
    CR.CountryID,                                       -- lookup CountryID by country code
    ISNULL(C.IsReseller, 0),                            -- default IsReseller to 0 if NULL
    ISNULL(C.IsCreditRisk, 0)                           -- default IsCreditRisk to 0 if NULL
FROM PrestigeCars.Data.Customer AS C
LEFT JOIN Reference.Country AS CR 
    ON UPPER(RTRIM(LTRIM(C.Country))) = CR.CountryISO2;
GO

-- Insert Cleaning Logic for Data.Stock
INSERT INTO Data.Stock (StockCode, ModelID, Cost, RepairsCost, PartsCost, TransportInCost, IsRHD, ColorID, BuyerComments, DateBought, TimeBought)
SELECT 
    UPPER(RTRIM(LTRIM(S.StockCode))),   -- normalize StockCode to upper-case, trimmed
    MD.ModelID,                         -- find new ModelID (mapping by ModelName and Make)
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
JOIN Data.Model AS MD 
    ON MD.ModelID = S.ModelID OR (MD.ModelName = S.ModelName AND MD.ModelVariant = S.ModelVariant)
    /* The join above assumes ModelID mapping; adjust if ModelName/Variant used from original data if needed. */
LEFT JOIN Reference.Color AS CO 
    ON UPPER(RTRIM(LTRIM(S.Color))) = CO.Color;
GO

-- Insert Cleaning Logic for Data.Sales
INSERT INTO Data.Sales (SalesID, CustomerID, InvoiceNumber, TotalSalePrice, SaleDate)
SELECT 
    S.SalesID,
    S.CustomerID,     -- CustomerIDs already cleaned/upper-cased in Customer insert
    UPPER(S.InvoiceNumber),  -- ensure InvoiceNumber is upper-case (if alphanumeric)
    ISNULL(S.TotalSalePrice, 0.00),
    S.SaleDate
FROM PrestigeCars.Data.Sales AS S;
GO

-- Insert Cleaning Logic for Data.SalesDetails
INSERT INTO Data.SalesDetails (SalesID, LineItemNumber, StockID, SalePrice, LineItemDiscount)
SELECT 
    SD.SalesID,
    SD.LineItemNumber,
    UPPER(RTRIM(LTRIM(SD.StockID))),  -- ensure StockID matches upper-case StockCode in new Stock
    ISNULL(SD.SalePrice, 0.00),
    ISNULL(SD.LineItemDiscount, 0.00)
FROM PrestigeCars.Data.SalesDetails AS SD;
GO

-- Insert Cleaning Logic for Data.PivotTable
INSERT INTO Data.PivotTable (ColorID, [2015], [2016], [2017], [2018])
SELECT 
    CO.ColorID,
    P.[2015], P.[2016], P.[2017], P.[2018]
FROM PrestigeCars.Data.PivotTable AS P
JOIN Reference.Color AS CO 
    ON UPPER(RTRIM(LTRIM(P.Color))) = CO.Color;
GO


-- Insert Cleaning Logic for DataTransfer.Sales2015
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

-- Insert Cleaning Logic for DataTransfer.Sales2016
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

-- Insert Cleaning Logic for DataTransfer.Sales2017
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

-- Insert Cleaning Logic for DataTransfer.Sales2018
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

-- Insert Cleaning Logic for Reference.Budget
INSERT INTO Reference.Budget (BudgetValue, Year, Month, BudgetDetail, BudgetElement)
SELECT 
    B.BudgetValue,
    B.Year,
    B.Month,
    RTRIM(LTRIM(B.BudgetDetail)),
    RTRIM(LTRIM(B.BudgetElement))
FROM PrestigeCars.Reference.Budget AS B;
GO

-- Insert Cleaning Logic for Reference.Forex
INSERT INTO Reference.Forex (ExchangeDate, ISOCurrency, ExchangeRate)
SELECT F.ExchangeDate, UPPER(F.ISOCurrency), F.ExchangeRate
FROM PrestigeCars.Reference.Forex AS F;
GO

-- Insert Cleaning Logic for Reference.MarketingCategories
INSERT INTO Reference.MarketingCategories (MakeName, MarketingType)
SELECT RTRIM(LTRIM(MC.MakeName)), RTRIM(LTRIM(MC.MarketingType))
FROM PrestigeCars.Reference.MarketingCategories AS MC;
GO

-- Insert Cleaning Logic for Reference.MarketingInformation
INSERT INTO Reference.MarketingInformation (CUST, Country, SpendCapacity)
SELECT RTRIM(LTRIM(MI.CUST)), UPPER(RTRIM(LTRIM(MI.Country))), RTRIM(LTRIM(MI.SpendCapacity))
FROM PrestigeCars.Reference.MarketingInformation AS MI;
GO

-- Insert Cleaning Logic for Reference.SalesCategory
INSERT INTO Reference.SalesCategory (LowerThreshold, UpperThreshold, CategoryDescription)
SELECT SC.LowerThreshold, SC.UpperThreshold, RTRIM(LTRIM(SC.CategoryDescription))
FROM PrestigeCars.Reference.SalesCategory AS SC;
GO

-- Insert Cleaning Logic for Reference.Staff
INSERT INTO Reference.Staff (StaffName, ManagerID, Department)
SELECT RTRIM(LTRIM(SF.StaffName)), SF.ManagerID, RTRIM(LTRIM(SF.Department))
FROM PrestigeCars.Reference.Staff AS SF;
GO

-- Insert Cleaning Logic for Reference.StaffHierarchy
INSERT INTO Reference.StaffHierarchy (HierarchyReference, StaffName, ManagerID, Department)
SELECT SH.HierarchyReference, RTRIM(LTRIM(SH.StaffName)), SH.ManagerID, RTRIM(LTRIM(SH.Department))
FROM PrestigeCars.Reference.StaffHierarchy AS SH;
GO

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
GO

-- Insert Cleaning Logic for SourceData.SalesInPounds
INSERT INTO SourceData.SalesInPounds (MakeName, ModelName, VehicleCost)
SELECT RTRIM(LTRIM(SIP.MakeName)), RTRIM(LTRIM(SIP.ModelName)), RTRIM(LTRIM(SIP.VehicleCost))
FROM PrestigeCars.SourceData.SalesInPounds AS SIP;
GO

-- Insert Cleaning Logic for SourceData.SalesText
INSERT INTO SourceData.SalesText (CountryName, MakeName, Cost, SalePrice)
SELECT RTRIM(LTRIM(ST.CountryName)), RTRIM(LTRIM(ST.MakeName)), RTRIM(LTRIM(ST.Cost)), RTRIM(LTRIM(ST.SalePrice))
FROM PrestigeCars.SourceData.SalesText AS ST;
GO

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
GO
