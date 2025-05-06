USE [PrestigeCars];
GO

-- Ensure the staging schema exists
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'staging')
    EXEC('CREATE SCHEMA staging');
GO

-- Drop staging table if it exists
IF OBJECT_ID('staging.AllData', 'U') IS NOT NULL
    DROP TABLE staging.AllData;
GO

-- Create the flat table
CREATE TABLE staging.AllData (
    CustomerName NVARCHAR(150),
    CountryName NVARCHAR(150),
    IsReseller BIT,
    IsCreditRisk BIT,
    MakeName NVARCHAR(100),
    ModelName NVARCHAR(150),
    ModelVariant NVARCHAR(150),
    YearFirstProduced CHAR(4),
    YearLastProduced CHAR(4),
    Color NVARCHAR(50),
    SaleDate DATETIME,
    SalePrice NUMERIC(18,2),
    LineItemDiscount NUMERIC(18,2),
    Cost MONEY,
    RepairsCost MONEY,
    PartsCost MONEY,
    TransportInCost MONEY
);
GO

-- Insert flattened data
INSERT INTO staging.AllData (
    CustomerName, CountryName, IsReseller, IsCreditRisk,
    MakeName, ModelName, ModelVariant, YearFirstProduced, YearLastProduced,
    Color, SaleDate, SalePrice, LineItemDiscount,
    Cost, RepairsCost, PartsCost, TransportInCost
)
SELECT
    c.CustomerName,
    co.CountryName,
    c.IsReseller,
    c.IsCreditRisk,
    mk.MakeName,
    mo.ModelName,
    mo.ModelVariant,
    mo.YearFirstProduced,
    mo.YearLastProduced,
    st.Color,
    s.SaleDate,
    sd.SalePrice,
    sd.LineItemDiscount,
    st.Cost,
    st.RepairsCost,
    st.PartsCost,
    st.TransportInCost
FROM Data.Sales s
JOIN Data.Customer c ON s.CustomerID = c.CustomerID
JOIN Data.SalesDetails sd ON s.SalesID = sd.SalesID
JOIN Data.Stock st ON sd.StockID = st.StockCode
JOIN Data.Model mo ON st.ModelID = mo.ModelID
JOIN Data.Make mk ON mo.MakeID = mk.MakeID
LEFT JOIN Data.Country co ON c.Country = co.CountryISO2;
GO
