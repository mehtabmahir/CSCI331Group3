-- Drop the existing 3NF database if it exists
IF DB_ID('PrestigeCars_3NF') IS NOT NULL
BEGIN
    ALTER DATABASE PrestigeCars_3NF SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PrestigeCars_3NF;
END
GO

-- Create new 3NF database and switch context to it
CREATE DATABASE PrestigeCars_3NF;
GO
USE PrestigeCars_3NF;
GO

-- Create necessary schemas for organizing tables
CREATE SCHEMA [Data];
GO
CREATE SCHEMA [Reference];
GO
CREATE SCHEMA [SourceData];
GO
CREATE SCHEMA [DataTransfer];
GO
CREATE SCHEMA [Output];
GO
CREATE SCHEMA [Project2.5];
GO
CREATE SCHEMA [Process];
GO

/* CreateUDTs.sql - Author: Mehtab Mahir (with type fixes) */
-- Define all User-Defined Types (UDTs) if they do not already exist

-- COUNTRY-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryID')
    CREATE TYPE dbo.UDT_CountryID FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryName')
    CREATE TYPE dbo.UDT_CountryName FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryISO2')
    CREATE TYPE dbo.UDT_CountryISO2 FROM NCHAR(10);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryISO3')
    CREATE TYPE dbo.UDT_CountryISO3 FROM NCHAR(10);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Region')
    CREATE TYPE dbo.UDT_Region FROM NVARCHAR(20);

-- MAKE/MODEL-related UDTs (all PK/FK are SMALLINT in original)
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_MakeID')
    CREATE TYPE dbo.UDT_MakeID FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_MakeName')
    CREATE TYPE dbo.UDT_MakeName FROM NVARCHAR(100);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_MakeCountry')
    CREATE TYPE dbo.UDT_MakeCountry FROM CHAR(3);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelID')
    CREATE TYPE dbo.UDT_ModelID FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelName')
    CREATE TYPE dbo.UDT_ModelName FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelVariant')
    CREATE TYPE dbo.UDT_ModelVariant FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Year')
    CREATE TYPE dbo.UDT_Year FROM CHAR(4);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsRHD')
    CREATE TYPE dbo.UDT_IsRHD FROM BIT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Color')
    CREATE TYPE dbo.UDT_Color FROM NVARCHAR(50);

-- CUSTOMER-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CustomerID')
    CREATE TYPE dbo.UDT_CustomerID FROM NVARCHAR(5);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CustomerName')
    CREATE TYPE dbo.UDT_CustomerName FROM NVARCHAR(150);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_Address')
    CREATE TYPE dbo.UDT_Address FROM NVARCHAR(50);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_CountryRef')
    CREATE TYPE dbo.UDT_CountryRef FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsReseller')
    CREATE TYPE dbo.UDT_IsReseller FROM BIT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_IsCreditRisk')
    CREATE TYPE dbo.UDT_IsCreditRisk FROM BIT;

-- STOCK-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_StockCode')
    CREATE TYPE dbo.UDT_StockCode FROM NVARCHAR(50);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ModelRef')
    CREATE TYPE dbo.UDT_ModelRef FROM SMALLINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_ColorID')
    CREATE TYPE dbo.UDT_ColorID FROM SMALLINT;
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

-- SALES-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SalesID')
    CREATE TYPE dbo.UDT_SalesID FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_InvoiceNumber')
    CREATE TYPE dbo.UDT_InvoiceNumber FROM CHAR(8);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SaleDate')
    CREATE TYPE dbo.UDT_SaleDate FROM DATETIME;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_TotalSalePrice')
    CREATE TYPE dbo.UDT_TotalSalePrice FROM NUMERIC(18,2);

-- SALES DETAILS-related UDTs
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SalesDetailsID')
    CREATE TYPE dbo.UDT_SalesDetailsID FROM INT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_LineItemNumber')
    CREATE TYPE dbo.UDT_LineItemNumber FROM TINYINT;
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_SalePrice')
    CREATE TYPE dbo.UDT_SalePrice FROM NUMERIC(18,2);
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'UDT_LineItemDiscount')
    CREATE TYPE dbo.UDT_LineItemDiscount FROM NUMERIC(18,2);
GO
