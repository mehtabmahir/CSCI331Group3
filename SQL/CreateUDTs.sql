/* CreateUDTs.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO

-- COUNTRY
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryID')
    CREATE TYPE dbo.UDT_CountryID FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryName')
    CREATE TYPE dbo.UDT_CountryName FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryISO2')
    CREATE TYPE dbo.UDT_CountryISO2 FROM NCHAR(10);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryISO3')
    CREATE TYPE dbo.UDT_CountryISO3 FROM NCHAR(10);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Region')
    CREATE TYPE dbo.UDT_Region FROM NVARCHAR(20);

-- MAKE
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_MakeID')
    CREATE TYPE dbo.UDT_MakeID FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_MakeName')
    CREATE TYPE dbo.UDT_MakeName FROM NVARCHAR(100);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_MakeCountry')
    CREATE TYPE dbo.UDT_MakeCountry FROM CHAR(3);

-- MODEL
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelID')
    CREATE TYPE dbo.UDT_ModelID FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelName')
    CREATE TYPE dbo.UDT_ModelName FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelVariant')
    CREATE TYPE dbo.UDT_ModelVariant FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Year')
    CREATE TYPE dbo.UDT_Year FROM CHAR(4);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsRHD')
    CREATE TYPE dbo.UDT_IsRHD FROM BIT NOT NULL;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Color')
    CREATE TYPE dbo.UDT_Color FROM NVARCHAR(50) NOT NULL;

-- CUSTOMER
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CustomerID')
    CREATE TYPE dbo.UDT_CustomerID FROM NVARCHAR(5);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CustomerName')
    CREATE TYPE dbo.UDT_CustomerName FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Address')
    CREATE TYPE dbo.UDT_Address FROM NVARCHAR(50);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryRef')
    CREATE TYPE dbo.UDT_CountryRef FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsReseller')
    CREATE TYPE dbo.UDT_IsReseller FROM BIT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsCreditRisk')
    CREATE TYPE dbo.UDT_IsCreditRisk FROM BIT;

-- STOCK
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_StockCode')
    CREATE TYPE dbo.UDT_StockCode FROM NVARCHAR(50);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelRef')
    CREATE TYPE dbo.UDT_ModelRef FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ColorID')
    CREATE TYPE dbo.UDT_ColorID FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Cost')
    CREATE TYPE dbo.UDT_Cost FROM MONEY;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_RepairsCost')
    CREATE TYPE dbo.UDT_RepairsCost FROM MONEY;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_PartsCost')
    CREATE TYPE dbo.UDT_PartsCost FROM MONEY;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_TransportCost')
    CREATE TYPE dbo.UDT_TransportCost FROM MONEY;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_BuyerComments')
    CREATE TYPE dbo.UDT_BuyerComments FROM NVARCHAR(4000);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_DateBought')
    CREATE TYPE dbo.UDT_DateBought FROM DATE;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_TimeBought')
    CREATE TYPE dbo.UDT_TimeBought FROM TIME(7);

-- SALES
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SalesID')
    CREATE TYPE dbo.UDT_SalesID FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_InvoiceNumber')
    CREATE TYPE dbo.UDT_InvoiceNumber FROM CHAR(8);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SaleDate')
    CREATE TYPE dbo.UDT_SaleDate FROM DATETIME;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_TotalSalePrice')
    CREATE TYPE dbo.UDT_TotalSalePrice FROM NUMERIC(18,2);

-- SALES DETAILS
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SalesDetailsID')
    CREATE TYPE dbo.UDT_SalesDetailsID FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_LineItemNumber')
    CREATE TYPE dbo.UDT_LineItemNumber FROM TINYINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SalePrice')
    CREATE TYPE dbo.UDT_SalePrice FROM NUMERIC(18,2);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_LineItemDiscount')
    CREATE TYPE dbo.UDT_LineItemDiscount FROM NUMERIC(18,2);

GO
