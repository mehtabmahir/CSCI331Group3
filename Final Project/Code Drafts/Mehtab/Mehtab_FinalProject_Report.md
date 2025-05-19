# Prestige Cars Normalized Database – Initial Work Report

**Prepared by:** Mehtab Mahir
**Environment:** SQL Server (Docker on WSL2), SSMS

---

## Files Created

### `CreateDB.sql`

Created the original working database using:

```sql
CREATE DATABASE PrestigeCars;
GO
```

I then loaded the instructor-provided `PrestigeCarsDatabaseScript.sql`, which generated all original tables including `Data.Customer`, `Data.Sales`, `Data.Stock`, `Data.Model`, and others.

---

## Flattening Process

To prepare for normalization, I flattened the core sales data from the original schema into a single staging table.

Using SSMS, I browsed the `PrestigeCars` database in Object Explorer and expanded the `Tables` node under the `Data` schema. To gather all column names and inspect structure, I right-clicked on the `Tables` folder and selected **"Script All Tables as → CREATE To → New Query Editor Window"**. This generated a full SQL script of every table's definition, which I used to verify field names and data types.

Once confident in the structure, I created the flattened output using the following script:

```sql
USE [PrestigeCars];
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'staging')
    EXEC('CREATE SCHEMA staging');
GO

IF OBJECT_ID('staging.AllData', 'U') IS NOT NULL
    DROP TABLE staging.AllData;
GO

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
```

The table `staging.AllData` now contains all relevant attributes in one location and is ready for normalization.

---

## Summary

* `PrestigeCars` database created and populated
* Used SSMS scripting to extract the full schema using "Script All Tables as → CREATE"
* Flattened output written to `staging.AllData`
* Output reviewed in SSMS for completeness
