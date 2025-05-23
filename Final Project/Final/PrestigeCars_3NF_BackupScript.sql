USE [master]
GO
/****** Object:  Database [PrestigeCars_3NF]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE DATABASE [PrestigeCars_3NF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PrestigeCars_3NF', FILENAME = N'/var/opt/mssql/data/PrestigeCars_3NF.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PrestigeCars_3NF_log', FILENAME = N'/var/opt/mssql/data/PrestigeCars_3NF_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PrestigeCars_3NF] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PrestigeCars_3NF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PrestigeCars_3NF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET ARITHABORT OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PrestigeCars_3NF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PrestigeCars_3NF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PrestigeCars_3NF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PrestigeCars_3NF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET RECOVERY FULL 
GO
ALTER DATABASE [PrestigeCars_3NF] SET  MULTI_USER 
GO
ALTER DATABASE [PrestigeCars_3NF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PrestigeCars_3NF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PrestigeCars_3NF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PrestigeCars_3NF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PrestigeCars_3NF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PrestigeCars_3NF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PrestigeCars_3NF', N'ON'
GO
ALTER DATABASE [PrestigeCars_3NF] SET QUERY_STORE = ON
GO
ALTER DATABASE [PrestigeCars_3NF] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PrestigeCars_3NF]
GO
/****** Object:  Schema [Data]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE SCHEMA [Data]
GO
/****** Object:  Schema [DataTransfer]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE SCHEMA [DataTransfer]
GO
/****** Object:  Schema [Output]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE SCHEMA [Output]
GO
/****** Object:  Schema [Process]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE SCHEMA [Process]
GO
/****** Object:  Schema [Project2.5]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE SCHEMA [Project2.5]
GO
/****** Object:  Schema [Reference]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE SCHEMA [Reference]
GO
/****** Object:  Schema [SourceData]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE SCHEMA [SourceData]
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_Address]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_Address] FROM [nvarchar](50) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_BuyerComments]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_BuyerComments] FROM [nvarchar](4000) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_Color]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_Color] FROM [nvarchar](50) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_ColorID]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_ColorID] FROM [smallint] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_Cost]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_Cost] FROM [money] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_CountryFlag]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_CountryFlag] FROM [varbinary](max) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_CountryID]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_CountryID] FROM [smallint] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_CountryISO2]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_CountryISO2] FROM [nchar](10) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_CountryISO3]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_CountryISO3] FROM [nchar](10) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_CountryName]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_CountryName] FROM [nvarchar](150) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_CountryRef]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_CountryRef] FROM [smallint] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_CustomerID]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_CustomerID] FROM [nvarchar](5) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_CustomerName]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_CustomerName] FROM [nvarchar](150) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_DateBought]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_DateBought] FROM [date] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_FlagFileName]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_FlagFileName] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_FlagFileType]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_FlagFileType] FROM [nchar](3) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_InvoiceNumber]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_InvoiceNumber] FROM [char](8) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_IsCreditRisk]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_IsCreditRisk] FROM [bit] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_IsReseller]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_IsReseller] FROM [bit] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_IsRHD]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_IsRHD] FROM [bit] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_LineItemDiscount]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_LineItemDiscount] FROM [numeric](18, 2) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_LineItemNumber]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_LineItemNumber] FROM [tinyint] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_MakeCountry]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_MakeCountry] FROM [char](3) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_MakeID]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_MakeID] FROM [smallint] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_MakeName]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_MakeName] FROM [nvarchar](100) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_ModelID]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_ModelID] FROM [smallint] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_ModelName]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_ModelName] FROM [nvarchar](150) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_ModelRef]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_ModelRef] FROM [smallint] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_ModelVariant]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_ModelVariant] FROM [nvarchar](150) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_PartsCost]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_PartsCost] FROM [money] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_Region]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_Region] FROM [nvarchar](20) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_RepairsCost]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_RepairsCost] FROM [money] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_SaleDate]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_SaleDate] FROM [datetime] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_SalePrice]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_SalePrice] FROM [numeric](18, 2) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_SalesDetailsID]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_SalesDetailsID] FROM [int] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_SalesID]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_SalesID] FROM [int] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_StockCode]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_StockCode] FROM [nvarchar](50) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_TimeBought]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_TimeBought] FROM [time](7) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_TotalSalePrice]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_TotalSalePrice] FROM [numeric](18, 2) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_TransportCost]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_TransportCost] FROM [money] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[UDT_Year]    Script Date: 5/18/2025 10:02:34 PM ******/
CREATE TYPE [dbo].[UDT_Year] FROM [char](4) NULL
GO
/****** Object:  Table [SourceData].[SalesInPounds]    Script Date: 5/18/2025 10:02:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SourceData].[SalesInPounds](
	[MakeName] [nvarchar](100) NOT NULL,
	[ModelName] [nvarchar](150) NOT NULL,
	[VehicleCost] [varchar](51) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SalesInPoundsByMakeModel]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Filter SalesInPounds by Make/Model
CREATE   FUNCTION [dbo].[fn_SalesInPoundsByMakeModel] (
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
/****** Object:  Table [SourceData].[SalesText]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SourceData].[SalesText](
	[CountryName] [nvarchar](150) NOT NULL,
	[MakeName] [nvarchar](100) NOT NULL,
	[Cost] [varchar](20) NOT NULL,
	[SalePrice] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SalesTextByCountryMake]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Filter SalesText by Country and Make
CREATE   FUNCTION [dbo].[fn_SalesTextByCountryMake] (
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
/****** Object:  Table [Reference].[MarketingCategories]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[MarketingCategories](
	[MakeName] [nvarchar](100) NOT NULL,
	[MarketingType] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Output].[StockPrices]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Output].[StockPrices](
	[MakeName] [nvarchar](100) NOT NULL,
	[ModelName] [nvarchar](150) NOT NULL,
	[Cost] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_StockWithMarketing]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Show car models, costs, and their marketing types
CREATE   VIEW [dbo].[vw_StockWithMarketing] AS
SELECT
    s.MakeName,
    s.ModelName,
    s.Cost,
    m.MarketingType
FROM Output.StockPrices s
LEFT JOIN Reference.MarketingCategories m ON s.MakeName = m.MakeName;
GO
/****** Object:  Table [Reference].[Budget]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[Budget](
	[BudgetKey] [int] IDENTITY(1,1) NOT NULL,
	[BudgetValue] [money] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[BudgetDetail] [nvarchar](50) NOT NULL,
	[BudgetElement] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BudgetKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_SalesBudgets]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Show budget details (fixed to use new Reference.Budget structure)
CREATE   VIEW [dbo].[vw_SalesBudgets] AS
SELECT
    BudgetValue,
    Year AS BudgetYear,
    Month AS BudgetMonth,
    BudgetDetail,
    BudgetElement
FROM Reference.Budget;
GO
/****** Object:  Table [Reference].[Forex]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[Forex](
	[ExchangeDate] [date] NOT NULL,
	[ISOCurrency] [char](3) NOT NULL,
	[ExchangeRate] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Forex]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Reference table views (simple)
CREATE   VIEW [dbo].[vw_Forex] AS
SELECT ExchangeDate, ISOCurrency, ExchangeRate
FROM Reference.Forex;
GO
/****** Object:  View [dbo].[vw_MarketingCategories]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_MarketingCategories] AS
SELECT MakeName, MarketingType
FROM Reference.MarketingCategories;
GO
/****** Object:  Table [Reference].[MarketingInformation]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[MarketingInformation](
	[CUST] [nvarchar](150) NOT NULL,
	[Country] [nchar](10) NOT NULL,
	[SpendCapacity] [varchar](25) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_MarketingInformation]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_MarketingInformation] AS
SELECT CUST, Country, SpendCapacity
FROM Reference.MarketingInformation;
GO
/****** Object:  View [dbo].[vw_SalesInPounds]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_SalesInPounds] AS
SELECT MakeName, ModelName, VehicleCost
FROM SourceData.SalesInPounds;
GO
/****** Object:  View [dbo].[vw_SalesText]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_SalesText] AS
SELECT CountryName, MakeName, Cost, SalePrice
FROM SourceData.SalesText;
GO
/****** Object:  UserDefinedFunction [dbo].[fn_StockPricesByMake]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Function to filter StockPrices by Make
CREATE   FUNCTION [dbo].[fn_StockPricesByMake] (@MakeName NVARCHAR(100))
RETURNS TABLE
AS
RETURN (
    SELECT MakeName, ModelName, Cost
    FROM Output.StockPrices
    WHERE MakeName = @MakeName
);
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SalesBudgetsByYear]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Function to get Budget entries by Year (fixed)
CREATE   FUNCTION [dbo].[fn_SalesBudgetsByYear] (@BudgetYear INT)
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
/****** Object:  UserDefinedFunction [dbo].[fn_ForexByCurrency]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Function to filter Forex by currency code
CREATE   FUNCTION [dbo].[fn_ForexByCurrency] (@ISOCurrency CHAR(3))
RETURNS TABLE
AS
RETURN (
    SELECT ExchangeDate, ISOCurrency, ExchangeRate
    FROM Reference.Forex
    WHERE ISOCurrency = @ISOCurrency
);
GO
/****** Object:  UserDefinedFunction [dbo].[fn_MarketingCategoriesByMake]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Filter MarketingCategories by make name
CREATE   FUNCTION [dbo].[fn_MarketingCategoriesByMake] (@MakeName NVARCHAR(100))
RETURNS TABLE
AS
RETURN (
    SELECT MakeName, MarketingType
    FROM Reference.MarketingCategories
    WHERE MakeName = @MakeName
);
GO
/****** Object:  UserDefinedFunction [dbo].[fn_MarketingInfoByCountry]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Filter MarketingInfo by country code
CREATE   FUNCTION [dbo].[fn_MarketingInfoByCountry] (@Country NCHAR(10))
RETURNS TABLE
AS
RETURN (
    SELECT CUST, Country, SpendCapacity
    FROM Reference.MarketingInformation
    WHERE Country = @Country
);
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAllSales]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ITVFs (inline table-valued functions)
-- Get all sales from 2015 to 2018
CREATE   FUNCTION [dbo].[fn_GetAllSales]()
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
/****** Object:  UserDefinedFunction [dbo].[fn_SalesCategoryByValue]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Find SalesCategory by value threshold
CREATE   FUNCTION [dbo].[fn_SalesCategoryByValue] (@Value INT)
RETURNS TABLE
AS
RETURN (
    SELECT LowerThreshold, UpperThreshold, CategoryDescription
    FROM Reference.SalesCategory
    WHERE @Value BETWEEN LowerThreshold AND UpperThreshold
);
GO
/****** Object:  UserDefinedFunction [dbo].[fn_StaffByDepartment]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Filter Staff by Department
CREATE   FUNCTION [dbo].[fn_StaffByDepartment] (@Department NVARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT StaffID, StaffName, ManagerID, Department
    FROM Reference.Staff
    WHERE Department = @Department
);
GO
/****** Object:  UserDefinedFunction [dbo].[fn_StaffHierarchyByManager]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Filter StaffHierarchy by Manager
CREATE   FUNCTION [dbo].[fn_StaffHierarchyByManager] (@ManagerID INT)
RETURNS TABLE
AS
RETURN (
    SELECT HierarchyReference, StaffID, StaffName, ManagerID, Department
    FROM Reference.StaffHierarchy
    WHERE ManagerID = @ManagerID
);
GO
/****** Object:  UserDefinedFunction [dbo].[fn_YearlySalesByDateRange]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Filter YearlySales by date range
CREATE   FUNCTION [dbo].[fn_YearlySalesByDateRange] (
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
/****** Object:  View [dbo].[vw_AllSales]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Credits: William & Mehtab

-- Views
-- Combines all yearly sales into one
CREATE   VIEW [dbo].[vw_AllSales] AS
SELECT *, 2015 AS SalesYear FROM DataTransfer.Sales2015
UNION ALL
SELECT *, 2016 AS SalesYear FROM DataTransfer.Sales2016
UNION ALL
SELECT *, 2017 AS SalesYear FROM DataTransfer.Sales2017
UNION ALL
SELECT *, 2018 AS SalesYear FROM DataTransfer.Sales2018;
GO
/****** Object:  View [dbo].[vw_SalesCategory]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_SalesCategory] AS
SELECT LowerThreshold, UpperThreshold, CategoryDescription
FROM Reference.SalesCategory;
GO
/****** Object:  View [dbo].[vw_Staff]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_Staff] AS
SELECT StaffID, StaffName, ManagerID, Department
FROM Reference.Staff;
GO
/****** Object:  View [dbo].[vw_StaffHierarchy]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_StaffHierarchy] AS
SELECT HierarchyReference, StaffID, StaffName, ManagerID, Department
FROM Reference.StaffHierarchy;
GO
/****** Object:  View [dbo].[vw_YearlySales]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_YearlySales] AS
SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate
FROM Reference.YearlySales;
GO
/****** Object:  Table [Data].[Customer]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[Customer](
	[CustomerID] [dbo].[UDT_CustomerID] NOT NULL,
	[CustomerName] [dbo].[UDT_CustomerName] NOT NULL,
	[Address1] [dbo].[UDT_Address] NOT NULL,
	[Address2] [dbo].[UDT_Address] NOT NULL,
	[Town] [dbo].[UDT_Address] NOT NULL,
	[PostCode] [dbo].[UDT_CountryISO2] NOT NULL,
	[CountryID] [dbo].[UDT_CountryRef] NOT NULL,
	[IsReseller] [dbo].[UDT_IsReseller] NOT NULL,
	[IsCreditRisk] [dbo].[UDT_IsCreditRisk] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[Make]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[Make](
	[MakeID] [dbo].[UDT_MakeID] IDENTITY(1,1) NOT NULL,
	[MakeName] [dbo].[UDT_MakeName] NOT NULL,
	[CountryID] [dbo].[UDT_CountryRef] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[Model]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[Model](
	[ModelID] [dbo].[UDT_ModelID] IDENTITY(1,1) NOT NULL,
	[MakeID] [dbo].[UDT_MakeID] NOT NULL,
	[ModelName] [dbo].[UDT_ModelName] NOT NULL,
	[ModelVariant] [dbo].[UDT_ModelVariant] NOT NULL,
	[YearFirstProduced] [dbo].[UDT_Year] NOT NULL,
	[YearLastProduced] [dbo].[UDT_Year] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[PivotTable]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[PivotTable](
	[ColorID] [dbo].[UDT_ColorID] NOT NULL,
	[2015] [dbo].[UDT_SalePrice] NOT NULL,
	[2016] [dbo].[UDT_SalePrice] NOT NULL,
	[2017] [dbo].[UDT_SalePrice] NOT NULL,
	[2018] [dbo].[UDT_SalePrice] NOT NULL,
 CONSTRAINT [PK_PivotTable] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[Sales]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[Sales](
	[SalesID] [dbo].[UDT_SalesID] NOT NULL,
	[CustomerID] [dbo].[UDT_CustomerID] NOT NULL,
	[InvoiceNumber] [dbo].[UDT_InvoiceNumber] NOT NULL,
	[TotalSalePrice] [dbo].[UDT_TotalSalePrice] NOT NULL,
	[SaleDate] [dbo].[UDT_SaleDate] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[SalesDetails]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[SalesDetails](
	[SalesDetailsID] [dbo].[UDT_SalesDetailsID] IDENTITY(1,1) NOT NULL,
	[SalesID] [dbo].[UDT_SalesID] NOT NULL,
	[LineItemNumber] [dbo].[UDT_LineItemNumber] NOT NULL,
	[StockID] [dbo].[UDT_StockCode] NOT NULL,
	[SalePrice] [dbo].[UDT_SalePrice] NOT NULL,
	[LineItemDiscount] [dbo].[UDT_LineItemDiscount] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[Stock]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[Stock](
	[StockCode] [dbo].[UDT_StockCode] NOT NULL,
	[ModelID] [dbo].[UDT_ModelID] NOT NULL,
	[Cost] [dbo].[UDT_Cost] NOT NULL,
	[RepairsCost] [dbo].[UDT_RepairsCost] NOT NULL,
	[PartsCost] [dbo].[UDT_PartsCost] NOT NULL,
	[TransportInCost] [dbo].[UDT_TransportCost] NOT NULL,
	[IsRHD] [dbo].[UDT_IsRHD] NOT NULL,
	[ColorID] [dbo].[UDT_ColorID] NOT NULL,
	[BuyerComments] [dbo].[UDT_BuyerComments] NOT NULL,
	[DateBought] [dbo].[UDT_DateBought] NOT NULL,
	[TimeBought] [dbo].[UDT_TimeBought] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StockCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reference].[Color]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[Color](
	[ColorID] [dbo].[UDT_ColorID] IDENTITY(1,1) NOT NULL,
	[Color] [dbo].[UDT_Color] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reference].[Country]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[Country](
	[CountryID] [dbo].[UDT_CountryID] IDENTITY(1,1) NOT NULL,
	[CountryName] [dbo].[UDT_CountryName] NOT NULL,
	[CountryISO2] [dbo].[UDT_CountryISO2] NOT NULL,
	[CountryISO3] [dbo].[UDT_CountryISO3] NOT NULL,
	[SalesRegion] [dbo].[UDT_Region] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SourceData].[SalesInPounds_Cleaned]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SourceData].[SalesInPounds_Cleaned](
	[SalesInPoundsID] [dbo].[UDT_SalesID] IDENTITY(1,1) NOT NULL,
	[CustomerID] [dbo].[UDT_CustomerID] NOT NULL,
	[StockID] [dbo].[UDT_StockCode] NOT NULL,
	[SaleDate] [dbo].[UDT_SaleDate] NOT NULL,
	[SalePriceGBP] [dbo].[UDT_SalePrice] NOT NULL,
	[ConvertedUSD] [dbo].[UDT_SalePrice] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesInPoundsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0001', N'Magic Motors', N'27, Handsworth Road', N'', N'Birmingham', N'B17AZ     ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0002', N'Snazzy Roadsters', N'102, Bleak Street', N'', N'Birmingham', N'B35ST     ', 6, 1, 1)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0003', N'Birmingham Executive Prestige Vehicles', N'96, Aardvark Avenue', N'', N'Birmingham', N'B28UH     ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0004', N'WunderKar', N'AlexanderPlatz 205', N'', N'Berlin', N'UNKNOWN   ', 3, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0005', N'Casseroles Chromes', N'29, Rue Gigondas', N'', N'Lyon', N'UNKNOWN   ', 2, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0006', N'Le Luxe en Motion', N'Avenue des Indes, 26', N'', N'Geneva', N'CH-1201   ', 10, 1, 1)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0007', N'Eat My Exhaust Ltd', N'29, Kop Hill', N'', N'Liverpool', N'L18UY     ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0008', N'M. Pierre Dubois', N'14, Rue De La Hutte', N'', N'Marseille', N'UNKNOWN   ', 2, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0009', N'Sondra Horowitz', N'10040 Great Western Road', N'', N'Los Angeles', N'UNKNOWN   ', 7, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0010', N'Wonderland Wheels', N'57, Grosvenor Estate Avenue', N'', N'London', N'E74BR     ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0011', N'London Executive Prestige Vehicles', N'199, Park Lane', N'', N'London', N'NW10AK    ', 6, 1, 1)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0012', N'Glittering Prize Cars Ltd', N'46, Golders Green Road', N'PO Box 27', N'London', N'E179IK    ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0013', N'La Bagnole de Luxe', N'890 Place de la Concorde', N'Cedex 8', N'Paris', N'UNKNOWN   ', 2, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0014', N'Convertible Dreams', N'31, Archbishop Ave', N'', N'London', N'SW26PL    ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0015', N'Alexei Tolstoi', N'83, Abbey Road', N'', N'London', N'N42CV     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0016', N'SuperSport S.A.R.L.', N'210 Place de la Republique', N'', N'Paris', N'UNKNOWN   ', 2, 1, 1)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0017', N'Theo Kowalski', N'1000 East 51st Street', N'', N'New York', N'UNKNOWN   ', 7, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0018', N'Peter McLuckie', N'73, Entwhistle Street', N'', N'London', N'W10BN     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0019', N'Posh Vehicles Ltd', N'82, Millar Close', N'', N'Manchester', N'M45SD     ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0020', N'Jason B. Wight', N'5300 Star Boulevard', N'', N'Washington', N'UNKNOWN   ', 7, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0021', N'Silver HubCaps', N'54, Didsbury Lane', N'', N'Manchester', N'M17TH     ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0022', N'Stan Collywobble', N'65, Townsend Road', N'', N'Manchester', N'M15HJ     ', 6, 0, 1)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0023', N'Glitz', N'FriedrichStrasse 579', N'', N'Stuttgart', N'UNKNOWN   ', 3, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0024', N'Matterhorn Motors', N'1, Rue de la Colline', N'', N'Lausanne', N'UNKNOWN   ', 10, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0025', N'King Leer Cars', N'87, Lindisfarne Road', N'', N'Newcastle', N'NE14OX    ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0026', N'Honest Pete Motors', N'76, Williams Street', N'', N'Stoke', N'ST39XY    ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0027', N'Peter Smith', N'82, Ell Pie Lane', N'', N'Birmingham', N'B55SD     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0028', N'Vive La Vitesse', N'56, Rue Noiratre', N'', N'Marseille', N'UNKNOWN   ', 2, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0029', N'Liverpool Executive Prestige Vehicles', N'8, Everton Avenue', N'', N'Liverpool', N'L22RD     ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0030', N'Mrs. Ivana Telford', N'52, Gerrard Mansions', N'', N'Liverpool', N'L29RT     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0031', N'Kieran O''Harris', N'71, Askwith Ave', N'', N'Liverpool', N'L76OP     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0032', N'Prestige Imports', N'Gran Via 26', N'', N'Barcelona', N'08120     ', 5, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0033', N'Prestissimo!', N'Via Appia 239', N'', N'Milan', N'UNKNOWN   ', 4, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0034', N'Diplomatic Cars', N'Rue Des Coteaux, 39', N'', N'Brussels', N'UNKNOWN   ', 1, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0035', N'Laurent Saint Yves', N'49, Rue Quicampoix', N'', N'Marseille', N'UNKNOWN   ', 2, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0036', N'Screamin'' Wheels', N'1090 Reagan Road', N'', N'Los Angeles', N'UNKNOWN   ', 7, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0037', N'Screamin'' Wheels', N'4, Churchill Close', N'', N'London', N'SE15RU    ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0038', N'Executive Motor Delight', N'17, The Brambles', N'', N'London', N'SE176AD   ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0039', N'Alicia Almodovar', N'Palacia Del Sol', N'', N'Barcelona', N'08400     ', 5, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0040', N'Ronaldo Bianco', N'Palazzo Medusa 2000', N'', N'Milan', N'UNKNOWN   ', 4, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0041', N'Sport.Car', N'Via Barberini 59', N'', N'Rome', N'00120     ', 4, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0042', N'Autos Sportivos', N'Paseo del Prado, 270', N'', N'Madrid', N'UNKNOWN   ', 5, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0043', N'Le Luxe en Motion', N'32, Allee de la Paix', N'', N'Paris', N'UNKNOWN   ', 2, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0044', N'Screamin'' Wheels Corp', N'50000 Fifth Avenue', N'', N'New York', N'UNKNOWN   ', 7, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0045', N'Pierre Blanc', N'52 Deirdre Lane', N'', N'London', N'C13EJ     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0046', N'Capots Reluisants S.A.', N'567 rue Lafayette', N'', N'Paris', N'UNKNOWN   ', 2, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0047', N'Stefano DiLonghi', N'Piazza Verona', N'', N'Rome', N'00129     ', 4, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0048', N'Antonio Maura', N'Puerta del Sol, 45', N'', N'Madrid', N'UNKNOWN   ', 5, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0049', N'Stefan Van Helsing', N'Nieuwstraat 5', N'', N'Brussels', N'UNKNOWN   ', 1, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0050', N'Mme Anne Duport', N'90, Place de la Victoire 1945', N'', N'Paris', N'UNKNOWN   ', 2, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0051', N'Screamin'' Wheels', N'10500 The Potomac', N'', N'Washington', N'UNKNOWN   ', 7, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0052', N'Clubbing Cars', N'91, Acid Avenue', N'', N'Manchester', N'M59RD     ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0053', N'Jean-Yves Truffaut', N'87 Rue du Combat', N'', N'Paris', N'UNKNOWN   ', 2, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0054', N'Mr. Evan Telford', N'7, Godzilla Street', N'', N'Manchester', N'M26KL     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0055', N'Ralph Obermann', N'BerolinaStrasse 210', N'', N'Berlin', N'UNKNOWN   ', 3, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0056', N'ImpressTheNeighbours.Com', N'47, Edgbaston Row', N'', N'Birmingham', N'B44RY     ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0057', N'Wladimir Lacroix', N'3, Rue de la Vie en Rose', N'', N'Lyon', N'UNKNOWN   ', 2, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0058', N'Raimondo Delattre', N'9, Place de Chatelet', N'', N'Geneva', N'CH-1211   ', 10, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0059', N'Boris Spry', N'53, Odeon Way', N'', N'Birmingham', N'B14BZ     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0060', N'Andrea Tarbuck', N'2,Newcastle Lane', N'', N'Birmingham', N'B48SG     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0061', N'Beltway Prestige Driving', N'1, Smithy Close', N'', N'Liverpool', N'L1WS      ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0062', N'Bling Motors', N'2, Arndale Lane', N'', N'Liverpool', N'L3QS      ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0063', N'Smooth Rocking Chrome', N'Via Stromboli 2', N'', N'Milan', N'UNKNOWN   ', 4, 1, 1)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0064', N'YO! Speed!', N'Plaza Mayor', N'', N'Barcelona', N'08550     ', 5, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0065', N'Stephany Rousso', N'10180 Orange County Place', N'', N'Los Angeles', N'UNKNOWN   ', 7, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0066', N'My Shiny Sports Car Ltd.', N'1091, Cambride Street', N'', N'London', N'W13GH     ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0067', N'Flash Voitures', N'Place Anspach 85', N'', N'Brussels', N'UNKNOWN   ', 1, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0068', N'Paul Blasio', N'50500 JFK Square', N'', N'New York', N'UNKNOWN   ', 7, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0069', N'Mary Blackhouse', N'260, Oxford Avenue', N'', N'London', N'E19AP     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0070', N'Maurice Dujardin', N'10, Daltrey Lane', N'', N'London', N'NW17YU    ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0071', N'Leslie Whittington', N'17, Mercury Street', N'', N'London', N'SE14AT    ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0072', N'Mike Beeton', N'Green Plaza Place', N'', N'London', N'SW137ED   ', 6, 0, 1)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0073', N'Melissa Bertrand', N'7, Westlands Street', N'', N'London', N'NW102SG   ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0074', N'El Sport', N'Plaza San Andres', N'', N'Madrid', N'UNKNOWN   ', 5, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0075', N'Bling Bling S.A.', N'7, Place de la Richesse', N'Z.I Les Arnaques', N'Paris', N'UNKNOWN   ', 2, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0076', N'Bravissima!', N'Via Rosso, 34', N'', N'Rome', N'00175     ', 4, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0077', N'Jayden Jones', N'10500 Lincoln Square', N'', N'Washington', N'UNKNOWN   ', 7, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0078', N'Expensive Shine', N'89, Abbots Lane', N'', N'Manchester', N'M173EF    ', 6, 1, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0079', N'Steve Docherty', N'5, Albermarle Avenue', N'', N'Manchester', N'M79AS     ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0080', N'Rodolph Legler', N'SingerStrasse 89', N'', N'Stuttgart', N'UNKNOWN   ', 3, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0081', N'Pete Spring', N'53, Pimlico Square', N'', N'Manchester', N'M34WR     ', 6, 0, 1)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0082', N'Khader El Ghannam', N'10, rue de Jemappes', N'4eme etage', N'Paris', N'UNKNOWN   ', 2, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0083', N'Jacques Mitterand', N'1 Quai des Pertes', N'', N'Paris', N'UNKNOWN   ', 2, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0084', N'Francoise LeBrun', N'56, Rue Verte', N'', N'Lausanne', N'UNKNOWN   ', 10, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0085', N'Alex McWhirter', N'89, Harlequin Road', N'', N'Newcastle', N'NE17DH    ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0086', N'Francois Chirac', N'2, Quai de l''Enfer', N'', N'Paris', N'UNKNOWN   ', 2, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0087', N'Andy Cheshire', N'7, Wedgewood Steet', N'', N'Stoke', N'ST42OZ    ', 6, 0, 0)
INSERT [Data].[Customer] ([CustomerID], [CustomerName], [Address1], [Address2], [Town], [PostCode], [CountryID], [IsReseller], [IsCreditRisk]) VALUES (N'0088', N'Jimmy McFiddler', N'57, Smile Square', N'', N'Glasgow', N'G151AA    ', 6, 1, 1)
GO
SET IDENTITY_INSERT [Data].[Make] ON 

INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (1, N'Ferrari', 4)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (2, N'Porsche', 1)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (3, N'Lamborghini', 4)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (4, N'Aston Martin', 6)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (5, N'Bentley', 6)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (6, N'Rolls Royce', 6)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (7, N'Maybach', 1)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (8, N'Mercedes', 1)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (9, N'Alfa Romeo', 4)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (10, N'Austin', 6)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (11, N'BMW', 1)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (12, N'Bugatti', 2)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (13, N'Citroen', 2)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (14, N'Delahaye', 2)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (15, N'Delorean', 7)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (16, N'Jaguar', 6)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (17, N'Lagonda', 4)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (18, N'McLaren', 6)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (19, N'Morgan', 6)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (20, N'Noble', 6)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (21, N'Triumph', 6)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (22, N'Trabant', 1)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (23, N'Peugeot', 1)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (24, N'Reliant', 2)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (25, N'Riley', 6)
INSERT [Data].[Make] ([MakeID], [MakeName], [CountryID]) VALUES (26, N'Cadillac', 7)
SET IDENTITY_INSERT [Data].[Make] OFF
GO
SET IDENTITY_INSERT [Data].[Model] ON 

INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (1, 1, N'Daytona', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (2, 1, N'Testarossa', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (3, 1, N'355', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (4, 1, N'308', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (5, 1, N'Dino', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (6, 1, N'Mondial', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (7, 1, N'F40', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (8, 1, N'F50', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (9, 1, N'360', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (10, 1, N'Enzo', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (11, 2, N'911', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (12, 2, N'924', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (13, 2, N'944', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (14, 2, N'959', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (15, 2, N'928', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (16, 2, N'Boxster', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (17, 3, N'Countach', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (18, 3, N'Diabolo', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (19, 3, N'Jarama', N'', N'1970', N'1976')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (20, 3, N'400GT', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (21, 4, N'DB2', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (22, 4, N'DB4', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (23, 4, N'DB5', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (24, 4, N'DB6', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (25, 4, N'DB9', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (26, 4, N'Virage', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (27, 4, N'Vantage', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (28, 4, N'Vanquish', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (29, 4, N'Rapide', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (30, 5, N'Mulsanne', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (31, 5, N'Continental', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (32, 5, N'Flying Spur', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (33, 5, N'Arnage', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (34, 5, N'Brooklands', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (35, 6, N'Phantom', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (36, 6, N'Ghost', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (37, 6, N'Wraith', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (38, 6, N'Silver Shadow', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (39, 6, N'Corniche', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (40, 6, N'Camargue', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (41, 6, N'Silver Seraph', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (42, 7, N'57', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (43, 7, N'62', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (44, 7, N'Exelero', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (45, 8, N'280SL', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (46, 8, N'350SL', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (47, 8, N'500SL', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (48, 8, N'250SL', N'Sports Pagoda', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (49, 8, N'R107', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (50, 8, N'W107', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (51, 9, N'Giulia', N'Sprint', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (52, 9, N'Spider', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (53, 9, N'1750', N'GTV', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (54, 9, N'Giulietta', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (55, 10, N'Lichfield', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (56, 10, N'Princess', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (57, 10, N'Cambridge', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (58, 11, N'Isetta', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (59, 11, N'Alpina', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (60, 11, N'E30', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (61, 12, N'35', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (62, 12, N'Veyron', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (63, 12, N'57C', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (64, 13, N'Torpedo', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (65, 13, N'Rosalie', N'Coupe', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (66, 13, N'Traaction Avant', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (67, 14, N'135', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (68, 14, N'145', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (69, 14, N'175', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (70, 15, N'DMC 12', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (71, 16, N'Mark V', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (72, 16, N'Mark X', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (73, 16, N'XJ12', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (74, 16, N'XK120', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (75, 16, N'XK150', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (76, 16, N'XJS', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (77, 16, N'E-Type', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (78, 17, N'V12', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (79, 17, N'3 Litre', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (80, 18, N'P1', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (81, 19, N'Plus 8', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (82, 19, N'Plus 4', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (83, 19, N'Supersport', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (84, 20, N'M14', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (85, 20, N'M600', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (86, 21, N'TR4', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (87, 21, N'TR5', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (88, 21, N'TR6', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (89, 21, N'TR7', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (90, 21, N'GT6', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (91, 21, N'Roadster', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (92, 21, N'Stag', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (93, 21, N'TR3A', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (94, 22, N'500', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (95, 22, N'600', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (96, 23, N'205', N'GTI', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (97, 23, N'Type VA', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (98, 23, N'404', N'', N'    ', N'    ')
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (99, 23, N'203', N'', N'    ', N'    ')
GO
INSERT [Data].[Model] ([ModelID], [MakeID], [ModelName], [ModelVariant], [YearFirstProduced], [YearLastProduced]) VALUES (100, 24, N'Robin', N'', N'    ', N'    ')
SET IDENTITY_INSERT [Data].[Model] OFF
GO
INSERT [Data].[PivotTable] ([ColorID], [2015], [2016], [2017], [2018]) VALUES (1, CAST(374490.00 AS Numeric(18, 2)), CAST(1251410.00 AS Numeric(18, 2)), CAST(3112550.00 AS Numeric(18, 2)), CAST(1983695.00 AS Numeric(18, 2)))
INSERT [Data].[PivotTable] ([ColorID], [2015], [2016], [2017], [2018]) VALUES (2, CAST(284600.00 AS Numeric(18, 2)), CAST(423650.00 AS Numeric(18, 2)), CAST(708420.00 AS Numeric(18, 2)), CAST(1186400.00 AS Numeric(18, 2)))
INSERT [Data].[PivotTable] ([ColorID], [2015], [2016], [2017], [2018]) VALUES (3, CAST(111500.00 AS Numeric(18, 2)), CAST(663250.00 AS Numeric(18, 2)), CAST(872340.00 AS Numeric(18, 2)), CAST(566385.00 AS Numeric(18, 2)))
INSERT [Data].[PivotTable] ([ColorID], [2015], [2016], [2017], [2018]) VALUES (4, CAST(132000.00 AS Numeric(18, 2)), CAST(287070.00 AS Numeric(18, 2)), CAST(104750.00 AS Numeric(18, 2)), CAST(134045.00 AS Numeric(18, 2)))
INSERT [Data].[PivotTable] ([ColorID], [2015], [2016], [2017], [2018]) VALUES (5, CAST(0.00 AS Numeric(18, 2)), CAST(283000.00 AS Numeric(18, 2)), CAST(219175.00 AS Numeric(18, 2)), CAST(662640.00 AS Numeric(18, 2)))
INSERT [Data].[PivotTable] ([ColorID], [2015], [2016], [2017], [2018]) VALUES (6, CAST(216600.00 AS Numeric(18, 2)), CAST(370750.00 AS Numeric(18, 2)), CAST(655090.00 AS Numeric(18, 2)), CAST(599540.00 AS Numeric(18, 2)))
INSERT [Data].[PivotTable] ([ColorID], [2015], [2016], [2017], [2018]) VALUES (7, CAST(57990.00 AS Numeric(18, 2)), CAST(405500.00 AS Numeric(18, 2)), CAST(457500.00 AS Numeric(18, 2)), CAST(600830.00 AS Numeric(18, 2)))
INSERT [Data].[PivotTable] ([ColorID], [2015], [2016], [2017], [2018]) VALUES (8, CAST(0.00 AS Numeric(18, 2)), CAST(235950.00 AS Numeric(18, 2)), CAST(54700.00 AS Numeric(18, 2)), CAST(191600.00 AS Numeric(18, 2)))
INSERT [Data].[PivotTable] ([ColorID], [2015], [2016], [2017], [2018]) VALUES (9, CAST(154795.00 AS Numeric(18, 2)), CAST(442500.00 AS Numeric(18, 2)), CAST(659150.00 AS Numeric(18, 2)), CAST(932450.00 AS Numeric(18, 2)))
INSERT [Data].[PivotTable] ([ColorID], [2015], [2016], [2017], [2018]) VALUES (10, CAST(89000.00 AS Numeric(18, 2)), CAST(542205.00 AS Numeric(18, 2)), CAST(1093900.00 AS Numeric(18, 2)), CAST(926030.00 AS Numeric(18, 2)))
GO
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (1, N'0001', N'GBPGB001', CAST(65000.00 AS Numeric(18, 2)), CAST(N'2015-01-02T08:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (2, N'0002', N'GBPGB002', CAST(220000.10 AS Numeric(18, 2)), CAST(N'2015-01-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (3, N'0003', N'GBPGB003', CAST(19500.00 AS Numeric(18, 2)), CAST(N'2015-02-03T10:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (4, N'0004', N'EURDE004', CAST(11500.00 AS Numeric(18, 2)), CAST(N'2015-02-16T08:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (5, N'0005', N'EURFR005', CAST(19900.00 AS Numeric(18, 2)), CAST(N'2015-01-02T10:33:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (6, N'0001', N'GBPGB006', CAST(29500.00 AS Numeric(18, 2)), CAST(N'2015-03-14T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (7, N'0003', N'GBPGB007', CAST(49500.20 AS Numeric(18, 2)), CAST(N'2015-03-24T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (8, N'0007', N'GBPGB008', CAST(76000.90 AS Numeric(18, 2)), CAST(N'2015-03-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (9, N'0008', N'EURFR009', CAST(19600.00 AS Numeric(18, 2)), CAST(N'2015-04-06T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (10, N'0009', N'USDUS010', CAST(36500.00 AS Numeric(18, 2)), CAST(N'2015-04-04T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (11, N'0010', N'GBPGB011', CAST(89000.00 AS Numeric(18, 2)), CAST(N'2015-04-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (12, N'0011', N'GBPGB012', CAST(169500.00 AS Numeric(18, 2)), CAST(N'2015-05-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (13, N'0008', N'EURFR013', CAST(8950.00 AS Numeric(18, 2)), CAST(N'2015-05-20T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (14, N'0012', N'GBPGB014', CAST(195000.00 AS Numeric(18, 2)), CAST(N'2015-05-28T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (15, N'0013', N'EURFR015', CAST(22950.00 AS Numeric(18, 2)), CAST(N'2015-06-04T16:37:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (16, N'0014', N'GBPGB016', CAST(8695.00 AS Numeric(18, 2)), CAST(N'2015-07-12T10:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (17, N'0015', N'GBPGB017', CAST(22990.00 AS Numeric(18, 2)), CAST(N'2015-07-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (18, N'0016', N'EURFR018', CAST(75500.00 AS Numeric(18, 2)), CAST(N'2015-07-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (19, N'0017', N'USDUS019', CAST(5500.00 AS Numeric(18, 2)), CAST(N'2015-08-02T08:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (20, N'0018', N'GBPGB020', CAST(12650.00 AS Numeric(18, 2)), CAST(N'2015-09-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (21, N'0019', N'GBPGB021', CAST(8950.00 AS Numeric(18, 2)), CAST(N'2015-09-15T10:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (22, N'0018', N'GBPGB022', CAST(15600.00 AS Numeric(18, 2)), CAST(N'2015-09-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (23, N'0015', N'GBPGB023', CAST(22600.00 AS Numeric(18, 2)), CAST(N'2015-10-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (24, N'0017', N'USDUS024', CAST(123590.00 AS Numeric(18, 2)), CAST(N'2015-10-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (25, N'0014', N'GBPGB025', CAST(22950.00 AS Numeric(18, 2)), CAST(N'2015-11-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (26, N'0015', N'GBPGB026', CAST(69500.00 AS Numeric(18, 2)), CAST(N'2015-12-01T08:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (27, N'0006', N'GBPCH027', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2016-01-01T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (28, N'0007', N'GBPGB028', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2016-01-01T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (29, N'0009', N'USDUS029', CAST(159500.00 AS Numeric(18, 2)), CAST(N'2016-01-01T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (30, N'0010', N'GBPGB030', CAST(165000.00 AS Numeric(18, 2)), CAST(N'2016-01-01T08:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (31, N'0008', N'EURFR031', CAST(2550.00 AS Numeric(18, 2)), CAST(N'2016-01-07T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (32, N'0019', N'GBPGB032', CAST(29500.00 AS Numeric(18, 2)), CAST(N'2016-01-07T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (33, N'0020', N'USDUS033', CAST(12650.00 AS Numeric(18, 2)), CAST(N'2016-01-09T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (34, N'0021', N'GBPGB034', CAST(56950.00 AS Numeric(18, 2)), CAST(N'2016-01-22T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (35, N'0022', N'GBPGB035', CAST(56000.00 AS Numeric(18, 2)), CAST(N'2016-02-22T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (36, N'0023', N'EURDE036', CAST(71890.00 AS Numeric(18, 2)), CAST(N'2016-02-17T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (37, N'0016', N'EURFR037', CAST(39500.00 AS Numeric(18, 2)), CAST(N'2016-02-16T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (38, N'0001', N'GBPGB038', CAST(3650.00 AS Numeric(18, 2)), CAST(N'2016-02-28T10:10:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (39, N'0024', N'GBPCH039', CAST(220500.00 AS Numeric(18, 2)), CAST(N'2016-03-20T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (40, N'0025', N'GBPGB040', CAST(102950.00 AS Numeric(18, 2)), CAST(N'2016-04-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (41, N'0020', N'USDUS041', CAST(17500.00 AS Numeric(18, 2)), CAST(N'2016-04-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (42, N'0021', N'GBPGB042', CAST(8800.00 AS Numeric(18, 2)), CAST(N'2016-04-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (43, N'0023', N'EURDE043', CAST(99500.00 AS Numeric(18, 2)), CAST(N'2016-04-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (44, N'0021', N'GBPGB044', CAST(17500.00 AS Numeric(18, 2)), CAST(N'2016-04-30T11:27:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (45, N'0010', N'GBPGB045', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2016-04-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (46, N'0015', N'GBPGB046', CAST(49450.00 AS Numeric(18, 2)), CAST(N'2016-05-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (47, N'0016', N'EURFR047', CAST(49580.00 AS Numeric(18, 2)), CAST(N'2016-05-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (48, N'0008', N'EURFR048', CAST(5500.00 AS Numeric(18, 2)), CAST(N'2016-06-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (49, N'0026', N'GBPGB049', CAST(22150.00 AS Numeric(18, 2)), CAST(N'2016-06-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (50, N'0027', N'GBPGB050', CAST(35000.00 AS Numeric(18, 2)), CAST(N'2016-06-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (51, N'0028', N'EURFR051', CAST(174650.00 AS Numeric(18, 2)), CAST(N'2016-06-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (52, N'0029', N'GBPGB052', CAST(15650.00 AS Numeric(18, 2)), CAST(N'2016-07-01T08:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (53, N'0020', N'USDUS053', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2016-07-06T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (54, N'0030', N'GBPGB054', CAST(195000.00 AS Numeric(18, 2)), CAST(N'2016-07-25T10:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (55, N'0015', N'GBPGB055', CAST(205000.00 AS Numeric(18, 2)), CAST(N'2016-07-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (56, N'0014', N'GBPGB056', CAST(66500.00 AS Numeric(18, 2)), CAST(N'2016-07-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (57, N'0031', N'GBPGB057', CAST(19500.00 AS Numeric(18, 2)), CAST(N'2016-07-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (58, N'0032', N'EURES058', CAST(79500.00 AS Numeric(18, 2)), CAST(N'2016-07-26T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (59, N'0033', N'EURIT059', CAST(14590.00 AS Numeric(18, 2)), CAST(N'2016-07-26T10:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (60, N'0032', N'EURES060', CAST(12750.00 AS Numeric(18, 2)), CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (61, N'0022', N'GBPGB061', CAST(45600.00 AS Numeric(18, 2)), CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (62, N'0021', N'GBPGB062', CAST(6500.00 AS Numeric(18, 2)), CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (63, N'0015', N'GBPGB063', CAST(102500.00 AS Numeric(18, 2)), CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (64, N'0016', N'EURFR064', CAST(99500.00 AS Numeric(18, 2)), CAST(N'2016-08-09T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (65, N'0014', N'GBPGB065', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2016-08-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (66, N'0004', N'EURDE066', CAST(61500.00 AS Numeric(18, 2)), CAST(N'2016-08-12T10:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (67, N'0006', N'GBPCH067', CAST(79500.00 AS Numeric(18, 2)), CAST(N'2016-08-13T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (68, N'0018', N'GBPGB068', CAST(50100.00 AS Numeric(18, 2)), CAST(N'2016-08-13T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (69, N'0005', N'EURFR069', CAST(66500.00 AS Numeric(18, 2)), CAST(N'2016-08-13T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (70, N'0033', N'EURIT070', CAST(45000.00 AS Numeric(18, 2)), CAST(N'2016-08-19T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (71, N'0023', N'EURDE071', CAST(19500.00 AS Numeric(18, 2)), CAST(N'2016-08-19T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (72, N'0021', N'GBPGB072', CAST(76500.00 AS Numeric(18, 2)), CAST(N'2016-08-21T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (73, N'0014', N'GBPGB073', CAST(45900.00 AS Numeric(18, 2)), CAST(N'2016-08-22T08:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (74, N'0034', N'EURBE074', CAST(125000.00 AS Numeric(18, 2)), CAST(N'2016-08-23T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (75, N'0035', N'EURFR075', CAST(65500.00 AS Numeric(18, 2)), CAST(N'2016-08-24T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (76, N'0036', N'USDUS076', CAST(92150.00 AS Numeric(18, 2)), CAST(N'2016-08-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (77, N'0037', N'GBPGB077', CAST(9500.00 AS Numeric(18, 2)), CAST(N'2016-08-28T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (78, N'0033', N'EURIT078', CAST(9950.00 AS Numeric(18, 2)), CAST(N'2016-08-28T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (79, N'0025', N'GBPGB079', CAST(5680.00 AS Numeric(18, 2)), CAST(N'2016-08-29T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (80, N'0024', N'GBPCH080', CAST(19500.00 AS Numeric(18, 2)), CAST(N'2016-08-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (81, N'0015', N'GBPGB081', CAST(3500.00 AS Numeric(18, 2)), CAST(N'2016-09-04T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (82, N'0006', N'GBPCH082', CAST(3950.00 AS Numeric(18, 2)), CAST(N'2016-09-04T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (83, N'0019', N'GBPGB083', CAST(20950.00 AS Numeric(18, 2)), CAST(N'2016-09-04T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (84, N'0003', N'GBPGB084', CAST(7500.00 AS Numeric(18, 2)), CAST(N'2016-09-06T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (85, N'0002', N'GBPGB085', CAST(56500.00 AS Numeric(18, 2)), CAST(N'2016-09-07T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (86, N'0022', N'GBPGB086', CAST(49500.00 AS Numeric(18, 2)), CAST(N'2016-09-07T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (87, N'0032', N'EURES087', CAST(68900.00 AS Numeric(18, 2)), CAST(N'2016-09-11T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (88, N'0001', N'GBPGB088', CAST(55000.00 AS Numeric(18, 2)), CAST(N'2016-09-11T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (89, N'0008', N'EURFR089', CAST(3575.00 AS Numeric(18, 2)), CAST(N'2016-09-14T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (90, N'0012', N'GBPGB090', CAST(35250.00 AS Numeric(18, 2)), CAST(N'2016-09-14T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (91, N'0013', N'EURFR091', CAST(47490.00 AS Numeric(18, 2)), CAST(N'2016-09-16T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (92, N'0015', N'GBPGB092', CAST(45950.00 AS Numeric(18, 2)), CAST(N'2016-09-16T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (93, N'0025', N'GBPGB093', CAST(9950.00 AS Numeric(18, 2)), CAST(N'2016-09-18T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (94, N'0026', N'GBPGB094', CAST(163050.00 AS Numeric(18, 2)), CAST(N'2016-09-19T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (95, N'0022', N'GBPGB095', CAST(76500.00 AS Numeric(18, 2)), CAST(N'2016-10-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (96, N'0032', N'EURES096', CAST(119600.00 AS Numeric(18, 2)), CAST(N'2016-10-05T10:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (97, N'0038', N'GBPGB097', CAST(95600.00 AS Numeric(18, 2)), CAST(N'2016-10-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (98, N'0039', N'EURES098', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2016-10-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (99, N'0040', N'EURIT099', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2016-10-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (100, N'0003', N'GBPGB100', CAST(56890.00 AS Numeric(18, 2)), CAST(N'2016-11-03T00:00:00.000' AS DateTime))
GO
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (101, N'0012', N'GBPGB101', CAST(55000.00 AS Numeric(18, 2)), CAST(N'2016-11-04T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (102, N'0026', N'GBPGB102', CAST(191490.00 AS Numeric(18, 2)), CAST(N'2016-12-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (103, N'0033', N'EURIT103', CAST(99500.00 AS Numeric(18, 2)), CAST(N'2016-12-06T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (104, N'0013', N'EURFR104', CAST(60500.00 AS Numeric(18, 2)), CAST(N'2016-12-06T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (105, N'0014', N'GBPGB105', CAST(123500.00 AS Numeric(18, 2)), CAST(N'2016-12-06T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (106, N'0023', N'EURDE106', CAST(25000.00 AS Numeric(18, 2)), CAST(N'2016-12-08T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (107, N'0028', N'EURFR107', CAST(169500.00 AS Numeric(18, 2)), CAST(N'2016-12-20T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (108, N'0029', N'GBPGB108', CAST(99500.00 AS Numeric(18, 2)), CAST(N'2016-12-28T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (109, N'0039', N'EURES109', CAST(39500.00 AS Numeric(18, 2)), CAST(N'2016-12-31T10:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (110, N'0028', N'EURFR110', CAST(22500.00 AS Numeric(18, 2)), CAST(N'2017-01-01T11:12:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (111, N'0027', N'GBPGB111', CAST(125000.00 AS Numeric(18, 2)), CAST(N'2017-01-05T11:55:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (112, N'0007', N'GBPGB112', CAST(85000.00 AS Numeric(18, 2)), CAST(N'2017-01-10T15:56:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (113, N'0013', N'EURFR113', CAST(1250.00 AS Numeric(18, 2)), CAST(N'2017-01-21T13:56:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (114, N'0006', N'GBPCH114', CAST(22500.00 AS Numeric(18, 2)), CAST(N'2017-01-11T17:52:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (115, N'0001', N'GBPGB115', CAST(125950.00 AS Numeric(18, 2)), CAST(N'2017-01-12T18:57:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (116, N'0006', N'GBPCH116', CAST(8850.00 AS Numeric(18, 2)), CAST(N'2017-01-13T19:58:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (117, N'0019', N'GBPGB117', CAST(9950.00 AS Numeric(18, 2)), CAST(N'2017-01-14T09:58:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (118, N'0028', N'EURFR118', CAST(56500.00 AS Numeric(18, 2)), CAST(N'2017-01-30T10:59:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (119, N'0037', N'GBPGB119', CAST(55000.00 AS Numeric(18, 2)), CAST(N'2017-01-31T09:59:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (120, N'0026', N'GBPGB120', CAST(56950.00 AS Numeric(18, 2)), CAST(N'2017-01-31T12:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (121, N'0028', N'EURFR121', CAST(365000.00 AS Numeric(18, 2)), CAST(N'2017-02-07T20:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (122, N'0035', N'EURFR122', CAST(395000.00 AS Numeric(18, 2)), CAST(N'2017-02-08T13:01:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (123, N'0036', N'USDUS123', CAST(21500.00 AS Numeric(18, 2)), CAST(N'2017-02-09T17:01:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (124, N'0037', N'GBPGB124', CAST(6500.00 AS Numeric(18, 2)), CAST(N'2017-02-10T11:02:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (125, N'0034', N'EURBE125', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2017-02-12T16:02:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (126, N'0001', N'GBPGB126', CAST(2250.00 AS Numeric(18, 2)), CAST(N'2017-02-14T14:03:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (127, N'0011', N'GBPGB127', CAST(3500.00 AS Numeric(18, 2)), CAST(N'2017-03-05T18:03:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (128, N'0012', N'GBPGB128', CAST(5680.00 AS Numeric(18, 2)), CAST(N'2017-03-05T19:04:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (129, N'0016', N'EURFR129', CAST(8550.00 AS Numeric(18, 2)), CAST(N'2017-03-05T14:04:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (130, N'0026', N'GBPGB130', CAST(156500.00 AS Numeric(18, 2)), CAST(N'2017-03-10T20:05:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (131, N'0025', N'GBPGB131', CAST(56500.00 AS Numeric(18, 2)), CAST(N'2017-03-10T16:05:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (132, N'0034', N'EURBE132', CAST(86500.00 AS Numeric(18, 2)), CAST(N'2017-03-12T17:06:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (133, N'0001', N'GBPGB133', CAST(66500.00 AS Numeric(18, 2)), CAST(N'2017-03-12T20:06:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (134, N'0005', N'EURFR134', CAST(55600.00 AS Numeric(18, 2)), CAST(N'2017-03-25T10:07:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (135, N'0023', N'EURDE135', CAST(305000.00 AS Numeric(18, 2)), CAST(N'2017-03-30T13:07:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (136, N'0028', N'EURFR136', CAST(45000.00 AS Numeric(18, 2)), CAST(N'2017-03-31T13:08:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (137, N'0029', N'GBPGB137', CAST(225000.00 AS Numeric(18, 2)), CAST(N'2017-03-31T16:08:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (138, N'0037', N'GBPGB138', CAST(42950.00 AS Numeric(18, 2)), CAST(N'2017-03-31T18:09:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (139, N'0031', N'GBPGB139', CAST(990.00 AS Numeric(18, 2)), CAST(N'2017-03-31T14:09:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (140, N'0032', N'EURES140', CAST(29500.00 AS Numeric(18, 2)), CAST(N'2017-04-05T20:10:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (141, N'0035', N'EURFR141', CAST(139500.00 AS Numeric(18, 2)), CAST(N'2017-04-06T19:10:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (142, N'0026', N'GBPGB142', CAST(295000.00 AS Numeric(18, 2)), CAST(N'2017-04-07T12:11:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (143, N'0028', N'EURFR143', CAST(220500.00 AS Numeric(18, 2)), CAST(N'2017-04-07T12:11:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (144, N'0029', N'GBPGB144', CAST(79500.00 AS Numeric(18, 2)), CAST(N'2017-05-01T17:12:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (145, N'0027', N'GBPGB145', CAST(162500.00 AS Numeric(18, 2)), CAST(N'2017-05-01T10:12:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (146, N'0041', N'EURIT146', CAST(79500.00 AS Numeric(18, 2)), CAST(N'2017-05-09T18:13:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (147, N'0042', N'EURES147', CAST(65890.00 AS Numeric(18, 2)), CAST(N'2017-05-09T12:13:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (148, N'0040', N'EURIT148', CAST(61500.00 AS Numeric(18, 2)), CAST(N'2017-05-10T20:14:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (149, N'0039', N'EURES149', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2017-05-10T16:14:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (150, N'0001', N'GBPGB150', CAST(255000.00 AS Numeric(18, 2)), CAST(N'2017-05-10T11:15:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (151, N'0043', N'EURFR151', CAST(255950.00 AS Numeric(18, 2)), CAST(N'2017-05-12T13:15:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (152, N'0044', N'USDUS152', CAST(250000.00 AS Numeric(18, 2)), CAST(N'2017-05-13T20:16:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (153, N'0033', N'EURIT153', CAST(6500.00 AS Numeric(18, 2)), CAST(N'2017-05-16T16:16:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (154, N'0022', N'GBPGB154', CAST(9250.00 AS Numeric(18, 2)), CAST(N'2017-05-19T21:17:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (155, N'0011', N'GBPGB155', CAST(950.00 AS Numeric(18, 2)), CAST(N'2017-05-20T14:17:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (156, N'0008', N'EURFR156', CAST(295000.00 AS Numeric(18, 2)), CAST(N'2017-05-21T16:18:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (157, N'0045', N'GBPGB157', CAST(99500.00 AS Numeric(18, 2)), CAST(N'2017-05-22T11:18:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (158, N'0046', N'EURFR158', CAST(33500.00 AS Numeric(18, 2)), CAST(N'2017-05-23T09:19:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (159, N'0023', N'EURDE159', CAST(45000.00 AS Numeric(18, 2)), CAST(N'2017-05-24T17:19:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (160, N'0035', N'EURFR160', CAST(114000.00 AS Numeric(18, 2)), CAST(N'2017-05-26T10:20:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (161, N'0024', N'GBPCH161', CAST(2350.00 AS Numeric(18, 2)), CAST(N'2017-05-27T21:20:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (162, N'0011', N'GBPGB162', CAST(32500.00 AS Numeric(18, 2)), CAST(N'2017-06-01T20:21:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (163, N'0019', N'GBPGB163', CAST(45000.00 AS Numeric(18, 2)), CAST(N'2017-06-01T12:21:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (164, N'0006', N'GBPCH164', CAST(8500.00 AS Numeric(18, 2)), CAST(N'2017-06-15T21:22:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (165, N'0004', N'EURDE165', CAST(99500.00 AS Numeric(18, 2)), CAST(N'2017-06-15T20:22:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (166, N'0047', N'EURIT166', CAST(25000.00 AS Numeric(18, 2)), CAST(N'2017-06-15T16:23:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (167, N'0033', N'EURIT167', CAST(19500.00 AS Numeric(18, 2)), CAST(N'2017-06-15T10:23:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (168, N'0048', N'EURES168', CAST(12950.00 AS Numeric(18, 2)), CAST(N'2017-06-15T18:24:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (169, N'0025', N'GBPGB169', CAST(5650.00 AS Numeric(18, 2)), CAST(N'2017-06-22T18:24:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (170, N'0016', N'EURFR170', CAST(29500.00 AS Numeric(18, 2)), CAST(N'2017-06-24T09:25:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (171, N'0049', N'EURBE171', CAST(45950.00 AS Numeric(18, 2)), CAST(N'2017-07-01T10:25:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (172, N'0050', N'EURFR172', CAST(99950.00 AS Numeric(18, 2)), CAST(N'2017-07-01T18:26:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (173, N'0003', N'GBPGB173', CAST(335000.00 AS Numeric(18, 2)), CAST(N'2017-07-03T19:26:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (174, N'0008', N'EURFR174', CAST(56500.00 AS Numeric(18, 2)), CAST(N'2017-07-31T20:27:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (175, N'0011', N'GBPGB175', CAST(99500.00 AS Numeric(18, 2)), CAST(N'2017-07-31T19:27:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (176, N'0016', N'EURFR176', CAST(135000.00 AS Numeric(18, 2)), CAST(N'2017-07-31T17:28:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (177, N'0025', N'GBPGB177', CAST(89500.00 AS Numeric(18, 2)), CAST(N'2017-07-31T17:28:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (178, N'0024', N'GBPCH178', CAST(165000.00 AS Numeric(18, 2)), CAST(N'2017-08-04T21:29:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (179, N'0036', N'USDUS179', CAST(22600.00 AS Numeric(18, 2)), CAST(N'2017-08-04T11:29:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (180, N'0046', N'EURFR180', CAST(32675.00 AS Numeric(18, 2)), CAST(N'2017-08-06T14:30:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (181, N'0028', N'EURFR181', CAST(45000.00 AS Numeric(18, 2)), CAST(N'2017-08-07T13:30:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (182, N'0021', N'GBPGB182', CAST(5500.00 AS Numeric(18, 2)), CAST(N'2017-08-27T13:31:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (183, N'0007', N'GBPGB183', CAST(55000.00 AS Numeric(18, 2)), CAST(N'2017-08-30T19:31:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (184, N'0009', N'USDUS184', CAST(49500.00 AS Numeric(18, 2)), CAST(N'2017-09-20T14:32:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (185, N'0039', N'EURES185', CAST(250000.00 AS Numeric(18, 2)), CAST(N'2017-09-20T12:32:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (186, N'0028', N'EURFR186', CAST(155000.00 AS Numeric(18, 2)), CAST(N'2017-09-20T16:33:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (187, N'0017', N'USDUS187', CAST(15750.00 AS Numeric(18, 2)), CAST(N'2017-09-26T10:33:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (188, N'0026', N'GBPGB188', CAST(19500.00 AS Numeric(18, 2)), CAST(N'2017-10-15T16:34:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (189, N'0035', N'EURFR189', CAST(235000.00 AS Numeric(18, 2)), CAST(N'2017-10-15T18:34:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (190, N'0014', N'GBPGB190', CAST(25000.00 AS Numeric(18, 2)), CAST(N'2017-11-01T19:35:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (191, N'0047', N'EURIT191', CAST(245000.00 AS Numeric(18, 2)), CAST(N'2017-11-01T12:35:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (192, N'0048', N'EURES192', CAST(89000.00 AS Numeric(18, 2)), CAST(N'2017-11-01T17:36:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (193, N'0049', N'EURBE193', CAST(34000.00 AS Numeric(18, 2)), CAST(N'2017-11-06T21:36:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (194, N'0050', N'EURFR194', CAST(62700.00 AS Numeric(18, 2)), CAST(N'2017-11-12T11:37:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (195, N'0002', N'GBPGB195', CAST(45950.00 AS Numeric(18, 2)), CAST(N'2017-12-01T17:37:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (196, N'0012', N'GBPGB196', CAST(21600.00 AS Numeric(18, 2)), CAST(N'2017-12-01T21:38:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (197, N'0022', N'GBPGB197', CAST(25000.00 AS Numeric(18, 2)), CAST(N'2017-12-05T12:38:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (198, N'0023', N'EURDE198', CAST(23600.00 AS Numeric(18, 2)), CAST(N'2017-12-05T11:39:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (199, N'0032', N'EURES199', CAST(99950.00 AS Numeric(18, 2)), CAST(N'2017-12-10T10:39:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (200, N'0041', N'EURIT200', CAST(46900.00 AS Numeric(18, 2)), CAST(N'2017-12-10T16:40:00.000' AS DateTime))
GO
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (201, N'0045', N'GBPGB201', CAST(45950.00 AS Numeric(18, 2)), CAST(N'2017-12-10T17:40:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (202, N'0046', N'EURFR202', CAST(7550.00 AS Numeric(18, 2)), CAST(N'2017-12-10T12:41:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (203, N'0048', N'EURES203', CAST(11990.00 AS Numeric(18, 2)), CAST(N'2017-12-12T14:41:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (204, N'0036', N'USDUS204', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2017-12-27T17:42:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (205, N'0037', N'GBPGB205', CAST(7500.00 AS Numeric(18, 2)), CAST(N'2017-12-27T12:42:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (206, N'0025', N'GBPGB206', CAST(56850.00 AS Numeric(18, 2)), CAST(N'2018-01-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (207, N'0021', N'GBPGB207', CAST(62500.00 AS Numeric(18, 2)), CAST(N'2018-01-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (208, N'0026', N'GBPGB208', CAST(42500.00 AS Numeric(18, 2)), CAST(N'2018-01-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (209, N'0051', N'USDUS209', CAST(65450.00 AS Numeric(18, 2)), CAST(N'2018-01-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (210, N'0052', N'GBPGB210', CAST(56950.00 AS Numeric(18, 2)), CAST(N'2018-01-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (211, N'0053', N'EURFR211', CAST(1950.00 AS Numeric(18, 2)), CAST(N'2018-01-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (212, N'0054', N'GBPGB212', CAST(1150.00 AS Numeric(18, 2)), CAST(N'2018-01-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (213, N'0055', N'EURDE213', CAST(11550.00 AS Numeric(18, 2)), CAST(N'2018-01-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (214, N'0045', N'GBPGB214', CAST(12570.00 AS Numeric(18, 2)), CAST(N'2018-01-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (215, N'0046', N'EURFR215', CAST(9890.00 AS Numeric(18, 2)), CAST(N'2018-01-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (216, N'0012', N'GBPGB216', CAST(56950.00 AS Numeric(18, 2)), CAST(N'2018-01-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (217, N'0032', N'EURES217', CAST(45950.00 AS Numeric(18, 2)), CAST(N'2018-01-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (218, N'0049', N'EURBE218', CAST(950.00 AS Numeric(18, 2)), CAST(N'2018-01-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (219, N'0035', N'EURFR219', CAST(21550.00 AS Numeric(18, 2)), CAST(N'2018-01-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (220, N'0021', N'GBPGB220', CAST(5950.00 AS Numeric(18, 2)), CAST(N'2018-01-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (221, N'0013', N'EURFR221', CAST(355000.00 AS Numeric(18, 2)), CAST(N'2018-01-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (222, N'0008', N'EURFR222', CAST(120000.00 AS Numeric(18, 2)), CAST(N'2018-02-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (223, N'0006', N'GBPCH223', CAST(121500.00 AS Numeric(18, 2)), CAST(N'2018-02-11T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (224, N'0009', N'USDUS224', CAST(182500.00 AS Numeric(18, 2)), CAST(N'2018-02-12T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (225, N'0056', N'GBPGB225', CAST(22500.00 AS Numeric(18, 2)), CAST(N'2018-02-13T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (226, N'0057', N'EURFR226', CAST(21500.00 AS Numeric(18, 2)), CAST(N'2018-02-14T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (227, N'0046', N'EURFR227', CAST(189500.00 AS Numeric(18, 2)), CAST(N'2018-02-17T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (228, N'0058', N'GBPCH228', CAST(55450.00 AS Numeric(18, 2)), CAST(N'2018-02-17T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (229, N'0059', N'GBPGB229', CAST(98950.00 AS Numeric(18, 2)), CAST(N'2018-02-17T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (230, N'0060', N'GBPGB230', CAST(355000.00 AS Numeric(18, 2)), CAST(N'2018-02-17T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (231, N'0028', N'EURFR231', CAST(6000.00 AS Numeric(18, 2)), CAST(N'2018-03-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (232, N'0039', N'EURES232', CAST(5690.00 AS Numeric(18, 2)), CAST(N'2018-03-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (233, N'0017', N'USDUS233', CAST(56900.00 AS Numeric(18, 2)), CAST(N'2018-03-08T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (234, N'0048', N'EURES234', CAST(368000.00 AS Numeric(18, 2)), CAST(N'2018-03-08T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (235, N'0046', N'EURFR235', CAST(310000.00 AS Numeric(18, 2)), CAST(N'2018-03-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (236, N'0045', N'GBPGB236', CAST(9800.00 AS Numeric(18, 2)), CAST(N'2018-03-19T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (237, N'0039', N'EURES237', CAST(15950.00 AS Numeric(18, 2)), CAST(N'2018-04-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (238, N'0031', N'GBPGB238', CAST(267950.00 AS Numeric(18, 2)), CAST(N'2018-04-09T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (239, N'0025', N'GBPGB239', CAST(155000.00 AS Numeric(18, 2)), CAST(N'2018-04-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (240, N'0036', N'USDUS240', CAST(2500.00 AS Numeric(18, 2)), CAST(N'2018-04-11T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (241, N'0028', N'EURFR241', CAST(9950.00 AS Numeric(18, 2)), CAST(N'2018-04-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (242, N'0036', N'USDUS242', CAST(39500.00 AS Numeric(18, 2)), CAST(N'2018-04-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (243, N'0038', N'GBPGB243', CAST(23500.00 AS Numeric(18, 2)), CAST(N'2018-04-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (244, N'0039', N'EURES244', CAST(45950.00 AS Numeric(18, 2)), CAST(N'2018-04-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (245, N'0051', N'USDUS245', CAST(55000.00 AS Numeric(18, 2)), CAST(N'2018-04-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (246, N'0056', N'GBPGB246', CAST(100000.00 AS Numeric(18, 2)), CAST(N'2018-04-20T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (247, N'0061', N'GBPGB247', CAST(44885.00 AS Numeric(18, 2)), CAST(N'2018-04-20T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (248, N'0062', N'GBPGB248', CAST(61500.00 AS Numeric(18, 2)), CAST(N'2018-04-22T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (249, N'0052', N'GBPGB249', CAST(950.00 AS Numeric(18, 2)), CAST(N'2018-04-23T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (250, N'0063', N'EURIT250', CAST(195000.00 AS Numeric(18, 2)), CAST(N'2018-04-24T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (251, N'0064', N'EURES251', CAST(52500.00 AS Numeric(18, 2)), CAST(N'2018-04-29T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (252, N'0003', N'GBPGB252', CAST(1350.00 AS Numeric(18, 2)), CAST(N'2018-05-03T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (253, N'0021', N'GBPGB253', CAST(2495.00 AS Numeric(18, 2)), CAST(N'2018-05-03T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (254, N'0035', N'EURFR254', CAST(269500.00 AS Numeric(18, 2)), CAST(N'2018-05-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (255, N'0065', N'USDUS255', CAST(195000.00 AS Numeric(18, 2)), CAST(N'2018-05-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (256, N'0066', N'GBPGB256', CAST(25950.00 AS Numeric(18, 2)), CAST(N'2018-05-23T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (257, N'0061', N'GBPGB257', CAST(9990.00 AS Numeric(18, 2)), CAST(N'2018-05-23T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (258, N'0063', N'EURIT258', CAST(135000.00 AS Numeric(18, 2)), CAST(N'2018-05-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (259, N'0062', N'GBPGB259', CAST(1250.00 AS Numeric(18, 2)), CAST(N'2018-05-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (260, N'0066', N'GBPGB260', CAST(6590.00 AS Numeric(18, 2)), CAST(N'2018-05-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (261, N'0035', N'EURFR261', CAST(89500.00 AS Numeric(18, 2)), CAST(N'2018-05-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (262, N'0031', N'GBPGB262', CAST(18500.00 AS Numeric(18, 2)), CAST(N'2018-05-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (263, N'0024', N'GBPCH263', CAST(3575.00 AS Numeric(18, 2)), CAST(N'2018-06-03T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (264, N'0067', N'EURBE264', CAST(6950.00 AS Numeric(18, 2)), CAST(N'2018-06-03T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (265, N'0002', N'GBPGB265', CAST(26500.00 AS Numeric(18, 2)), CAST(N'2018-06-16T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (266, N'0068', N'USDUS266', CAST(33500.00 AS Numeric(18, 2)), CAST(N'2018-06-18T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (267, N'0012', N'GBPGB267', CAST(24500.00 AS Numeric(18, 2)), CAST(N'2018-06-22T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (268, N'0025', N'GBPGB268', CAST(99500.00 AS Numeric(18, 2)), CAST(N'2018-06-23T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (269, N'0038', N'GBPGB269', CAST(99990.00 AS Numeric(18, 2)), CAST(N'2018-07-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (270, N'0069', N'GBPGB270', CAST(6950.00 AS Numeric(18, 2)), CAST(N'2018-07-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (271, N'0070', N'GBPGB271', CAST(10500.00 AS Numeric(18, 2)), CAST(N'2018-07-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (272, N'0062', N'GBPGB272', CAST(33450.00 AS Numeric(18, 2)), CAST(N'2018-07-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (273, N'0054', N'GBPGB273', CAST(72500.00 AS Numeric(18, 2)), CAST(N'2018-07-25T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (274, N'0071', N'GBPGB274', CAST(2400.00 AS Numeric(18, 2)), CAST(N'2018-07-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (275, N'0072', N'GBPGB275', CAST(68500.00 AS Numeric(18, 2)), CAST(N'2018-07-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (276, N'0006', N'GBPCH276', CAST(2350.00 AS Numeric(18, 2)), CAST(N'2018-07-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (277, N'0056', N'GBPGB277', CAST(18500.00 AS Numeric(18, 2)), CAST(N'2018-07-30T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (278, N'0073', N'GBPGB278', CAST(5500.00 AS Numeric(18, 2)), CAST(N'2018-07-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (279, N'0074', N'EURES279', CAST(128500.00 AS Numeric(18, 2)), CAST(N'2018-07-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (280, N'0065', N'USDUS280', CAST(55000.00 AS Numeric(18, 2)), CAST(N'2018-07-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (281, N'0063', N'EURIT281', CAST(1250.00 AS Numeric(18, 2)), CAST(N'2018-07-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (282, N'0075', N'EURFR282', CAST(345000.00 AS Numeric(18, 2)), CAST(N'2018-07-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (283, N'0076', N'EURIT283', CAST(82590.00 AS Numeric(18, 2)), CAST(N'2018-07-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (284, N'0077', N'USDUS284', CAST(113590.00 AS Numeric(18, 2)), CAST(N'2018-08-01T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (285, N'0065', N'USDUS285', CAST(45000.00 AS Numeric(18, 2)), CAST(N'2018-08-01T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (286, N'0064', N'EURES286', CAST(57600.00 AS Numeric(18, 2)), CAST(N'2018-08-01T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (287, N'0045', N'GBPGB287', CAST(102500.00 AS Numeric(18, 2)), CAST(N'2018-08-01T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (288, N'0054', N'GBPGB288', CAST(39500.00 AS Numeric(18, 2)), CAST(N'2018-08-10T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (289, N'0078', N'GBPGB289', CAST(61550.00 AS Numeric(18, 2)), CAST(N'2018-08-11T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (290, N'0079', N'GBPGB290', CAST(55000.00 AS Numeric(18, 2)), CAST(N'2018-08-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (291, N'0080', N'EURDE291', CAST(99500.00 AS Numeric(18, 2)), CAST(N'2018-08-16T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (292, N'0006', N'GBPCH292', CAST(56800.00 AS Numeric(18, 2)), CAST(N'2018-08-18T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (293, N'0036', N'USDUS293', CAST(89500.00 AS Numeric(18, 2)), CAST(N'2018-09-01T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (294, N'0016', N'EURFR294', CAST(72500.00 AS Numeric(18, 2)), CAST(N'2018-09-01T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (295, N'0014', N'GBPGB295', CAST(56950.00 AS Numeric(18, 2)), CAST(N'2018-09-01T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (296, N'0056', N'GBPGB296', CAST(62500.00 AS Numeric(18, 2)), CAST(N'2018-09-04T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (297, N'0048', N'EURES297', CAST(56890.00 AS Numeric(18, 2)), CAST(N'2018-09-04T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (298, N'0057', N'EURFR298', CAST(33600.00 AS Numeric(18, 2)), CAST(N'2018-09-08T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (299, N'0081', N'GBPGB299', CAST(30500.00 AS Numeric(18, 2)), CAST(N'2018-09-08T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (300, N'0082', N'EURFR300', CAST(50500.00 AS Numeric(18, 2)), CAST(N'2018-09-15T00:00:00.000' AS DateTime))
GO
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (301, N'0078', N'GBPGB301', CAST(39500.00 AS Numeric(18, 2)), CAST(N'2018-09-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (302, N'0076', N'EURIT302', CAST(12500.00 AS Numeric(18, 2)), CAST(N'2018-09-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (303, N'0069', N'GBPGB303', CAST(5600.00 AS Numeric(18, 2)), CAST(N'2018-10-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (304, N'0083', N'EURFR304', CAST(69500.00 AS Numeric(18, 2)), CAST(N'2018-10-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (305, N'0084', N'GBPCH305', CAST(45000.00 AS Numeric(18, 2)), CAST(N'2018-10-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (306, N'0065', N'USDUS306', CAST(56990.00 AS Numeric(18, 2)), CAST(N'2018-10-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (307, N'0077', N'USDUS307', CAST(86500.00 AS Numeric(18, 2)), CAST(N'2018-10-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (308, N'0085', N'GBPGB308', CAST(17850.00 AS Numeric(18, 2)), CAST(N'2018-10-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (309, N'0086', N'EURFR309', CAST(25950.00 AS Numeric(18, 2)), CAST(N'2018-10-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (310, N'0087', N'GBPGB310', CAST(29500.00 AS Numeric(18, 2)), CAST(N'2018-10-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (311, N'0005', N'EURFR311', CAST(59000.00 AS Numeric(18, 2)), CAST(N'2018-10-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (312, N'0065', N'USDUS312', CAST(9500.00 AS Numeric(18, 2)), CAST(N'2018-10-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (313, N'0035', N'EURFR313', CAST(8900.00 AS Numeric(18, 2)), CAST(N'2018-11-02T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (314, N'0024', N'GBPCH314', CAST(11590.00 AS Numeric(18, 2)), CAST(N'2018-11-15T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (315, N'0019', N'GBPGB315', CAST(8500.00 AS Numeric(18, 2)), CAST(N'2018-11-22T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (316, N'0020', N'USDUS316', CAST(59500.00 AS Numeric(18, 2)), CAST(N'2018-12-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (317, N'0040', N'EURIT317', CAST(123500.00 AS Numeric(18, 2)), CAST(N'2018-12-05T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (318, N'0060', N'GBPGB318', CAST(99500.00 AS Numeric(18, 2)), CAST(N'2018-12-08T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (319, N'0059', N'GBPGB319', CAST(56090.00 AS Numeric(18, 2)), CAST(N'2018-12-08T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (320, N'0048', N'EURES320', CAST(11500.00 AS Numeric(18, 2)), CAST(N'2018-12-16T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (321, N'0036', N'USDUS321', CAST(17950.00 AS Numeric(18, 2)), CAST(N'2018-12-17T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (322, N'0035', N'EURFR322', CAST(5500.00 AS Numeric(18, 2)), CAST(N'2018-12-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (323, N'0030', N'GBPGB323', CAST(950.00 AS Numeric(18, 2)), CAST(N'2018-12-31T00:00:00.000' AS DateTime))
INSERT [Data].[Sales] ([SalesID], [CustomerID], [InvoiceNumber], [TotalSalePrice], [SaleDate]) VALUES (324, N'0087', N'GBPGB324', CAST(145000.00 AS Numeric(18, 2)), CAST(N'2018-12-31T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [Data].[SalesDetails] ON 

INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (1, 190, 1, N'009A5323-23E5-48BE-95DB-BA94E1897419', CAST(25000.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (2, 80, 1, N'00DDC5C0-E266-49E4-A785-E4F8BC3C9B24', CAST(19500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (3, 202, 1, N'00E07EB4-4A3A-434F-B3FC-76A312BEEF5D', CAST(7550.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (4, 123, 1, N'01B087C6-00D1-40B2-808F-B4B5BC1E344D', CAST(21500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (5, 283, 1, N'0318C525-58CA-438E-A5A5-BA854855A664', CAST(82590.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (6, 224, 1, N'03AC7842-CA66-4AC0-92AD-F538494D1FAE', CAST(182500.00 AS Numeric(18, 2)), CAST(17500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (7, 316, 1, N'0487C263-79B7-4F2B-8D0E-B0BAA41D7F24', CAST(59500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (8, 48, 1, N'055F7639-30EA-4975-A8CB-29F5C1C1C48E', CAST(5500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (9, 138, 1, N'0588AA57-B6B5-47F5-910F-5A1099B0476D', CAST(42950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (10, 145, 1, N'05AB94D5-2F8D-4B06-878D-615956C94EC2', CAST(162500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (11, 194, 2, N'05D4115C-3F27-4059-BDC8-C0C3FFC85E8B', CAST(51200.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (12, 263, 1, N'05F6C06A-9CD8-448B-9F67-FDBC0A7CEDCE', CAST(3575.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (13, 154, 1, N'06FD2864-8415-44A5-B022-B98BEFB7E490', CAST(9250.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (14, 239, 1, N'07E4BA14-7B78-4B11-9A11-1520460A5631', CAST(155000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (15, 44, 1, N'07F0D746-085B-4FB9-9F82-6CEAC851FBC3', CAST(17500.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (16, 143, 1, N'08B3555E-47A2-4365-AED8-2DF054FF73E2', CAST(220500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (17, 111, 1, N'09FA3947-726D-4987-B9DD-2F4CF7CD7C45', CAST(125000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (18, 303, 3, N'0A059F54-46DE-4A25-8B5D-D7373AEE6F91', CAST(2500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (19, 60, 1, N'0B0E0FC2-E72B-4BD4-9C46-1AF98F17BEC4', CAST(12750.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (20, 134, 1, N'0B3AEBF5-0997-447D-B0E8-B399B7343742', CAST(55600.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (21, 51, 3, N'0BE222D6-9254-4FC8-892D-76563CA81F9B', CAST(99500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (22, 163, 1, N'0C3EBD09-B9DF-414D-AD00-90F5819812D0', CAST(45000.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (23, 26, 1, N'0CC75388-9A95-4F14-8D9A-8373E3B44D8A', CAST(69500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (24, 307, 1, N'0E2AECED-5A41-412A-9414-DE7217C0B6EB', CAST(86500.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (25, 79, 1, N'100EE806-DFE5-4C5E-9AB4-8F881615F8BD', CAST(5680.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (26, 107, 1, N'102A734C-3212-4708-85A5-A96FE8E14641', CAST(169500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (27, 187, 1, N'10AD713C-C997-48BB-A5FB-F0B5FD26479B', CAST(15750.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (28, 279, 1, N'114760E3-FC54-4C31-B323-BC4B83AB80D0', CAST(128500.00 AS Numeric(18, 2)), CAST(12500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (29, 40, 1, N'11790E1E-859C-4E05-B6B3-6D72DDCC8DAE', CAST(102950.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (30, 124, 1, N'11BCE306-33ED-4C8D-9198-2A4B653D9F8A', CAST(6500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (31, 76, 1, N'126C36BB-9C33-4BC5-9127-F941731DD0C8', CAST(92150.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (32, 275, 1, N'13F9FBD7-9342-4A2D-A249-E3AD6AE9A9CB', CAST(68500.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (33, 186, 1, N'15108517-AD0C-4FF2-A7D4-57679C374A68', CAST(155000.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (34, 87, 1, N'155E940E-7AA7-47EA-B83F-B3521F0B5718', CAST(68900.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (35, 74, 1, N'170FAF32-4223-4806-B483-D89F4D38AC16', CAST(125000.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (36, 284, 1, N'17FA511D-1C85-4F74-A164-B4EE39F48565', CAST(113590.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (37, 201, 1, N'1860F37A-EBC7-42E9-B339-3F6D6048322F', CAST(45950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (38, 24, 1, N'18E980AB-452D-42EF-8728-12822AD20C60', CAST(123590.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (39, 140, 1, N'1909CD9B-9C06-4CFB-B8AD-292967E55E2F', CAST(29500.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (40, 89, 1, N'19D1000C-178F-4BBA-9B19-C93804D047AC', CAST(3575.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (41, 192, 2, N'1A210C04-C981-4EA4-83B9-A6E76B5B9BDB', CAST(49500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (42, 300, 1, N'1A861C29-F198-4D34-BDAF-B35E8080320A', CAST(25000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (43, 141, 1, N'1B77D0BA-45C9-4C76-952E-B2FA2859B7AB', CAST(139500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (44, 23, 1, N'1BB4B941-79F4-4E98-9E13-46875CA7EB67', CAST(22600.00 AS Numeric(18, 2)), CAST(600.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (45, 311, 1, N'1C9E6944-A890-4D7B-8F98-32B7276A78B3', CAST(59000.00 AS Numeric(18, 2)), CAST(4500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (46, 303, 2, N'1D5C9493-4BA2-415A-B4D6-7079278CA2DC', CAST(1950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (47, 232, 1, N'1DDF23D7-3CB8-49C7-A19B-2A9C5AB23ADF', CAST(5690.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (48, 235, 1, N'20041639-9549-415A-AEC2-7159352E8CB7', CAST(310000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (49, 30, 1, N'202B3C90-188F-413E-A44A-B99F16F03464', CAST(165000.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (50, 5, 1, N'2189D556-D1C4-4BC1-B0C8-4053319E8E9D', CAST(19950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (51, 227, 1, N'2319EA77-F4D9-4E34-9771-C42DCA3E210C', CAST(189500.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (52, 178, 1, N'23E43063-5402-4946-8830-0723F6B3CE1C', CAST(165000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (53, 43, 1, N'23E7F9FA-67D4-47C1-8D66-F1CFBC33540F', CAST(99500.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (54, 270, 1, N'23FDFA0D-C905-41A6-B95A-D5A3517293D8', CAST(6950.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (55, 172, 1, N'2595D5C0-5002-464B-8F2B-C873FB29B4F9', CAST(99950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (56, 213, 1, N'26122425-FE14-4318-8713-15C8F9EED630', CAST(11550.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (57, 193, 2, N'26199C63-95B5-419B-A827-C0EEAF594A5B', CAST(10500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (58, 198, 1, N'2657F22B-5D29-4A7A-B3F9-3A04C14D7C93', CAST(23600.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (59, 251, 1, N'266404D4-FBC5-4DC6-BB7C-A2ED7246D6D7', CAST(52500.00 AS Numeric(18, 2)), CAST(1575.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (60, 258, 1, N'27C180A1-7C39-4E88-B5DE-ACD0C9594F3C', CAST(135000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (61, 33, 1, N'281946B6-D061-455A-801B-A0EDF3E37530', CAST(12650.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (62, 287, 1, N'2A27FF01-DC3C-4FE2-AC8C-9145C29F651C', CAST(102500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (63, 176, 1, N'2B0FC8E5-82CB-4804-8691-0586F2255E9E', CAST(135000.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (64, 132, 1, N'2C377634-90F1-4BC1-A366-0F0EBD26910D', CAST(86500.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (65, 210, 1, N'2CE57C5E-98DE-402F-884A-A6227FD7FB5F', CAST(56950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (66, 322, 1, N'2E0E8003-F9CC-486D-9D08-D4DAC688C800', CAST(5500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (67, 86, 1, N'2FCD3EBC-CBA7-4B3C-B6A0-A3A011D3A47B', CAST(49500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (68, 175, 1, N'306507B9-D2E1-4C5D-8F01-C93C90C93B6E', CAST(99500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (69, 97, 1, N'30DC26F7-E98B-4FE8-B834-D625EC7E12F3', CAST(85650.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (70, 17, 1, N'325F4D73-D44A-44BD-B109-AD25D924D38F', CAST(22990.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (71, 139, 1, N'32C41EC9-CB3C-4D0F-9C85-2500CE2E4813', CAST(990.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (72, 174, 1, N'332CE8D2-E19F-4656-BCC6-E3E45AD09D85', CAST(56500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (73, 181, 1, N'34A4BB21-60B3-4B0D-8DDB-8189C471A581', CAST(45000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (74, 97, 2, N'34A69512-CDC3-4BEB-ADCB-AAE360CA7CF4', CAST(9950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (75, 18, 2, N'34CEE6C8-985B-4005-AB2F-AD3235C6A16D', CAST(56000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (76, 61, 1, N'356EE84B-F4FD-4923-9423-D58E2863E9A1', CAST(45600.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (77, 248, 1, N'361E0EFF-56B8-4E0A-A1DD-41D4A51BF704', CAST(61500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (78, 91, 2, N'384778FF-C28D-4FE6-9BEF-D787EFDC23CF', CAST(27890.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (79, 161, 1, N'3A0070F8-C340-4B6F-9F36-4A1CBDB39FE9', CAST(2350.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (80, 305, 1, N'3BDD9316-9359-464B-B98E-308494AD3056', CAST(45000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (81, 306, 1, N'3C17F01C-25FF-463B-86AA-1A34FEA02FF2', CAST(56990.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (82, 319, 2, N'3C384AE3-7F59-4CD6-BAFE-5E6EFFD25FAD', CAST(1590.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (83, 278, 1, N'3CD0AFE8-9909-4A5D-BA9F-5C1F71B0DEE3', CAST(5500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (84, 103, 1, N'3CF2C0F8-21E1-4ADE-AE72-AB9DFE3790DD', CAST(99500.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (85, 290, 1, N'3D2E9AD0-972B-4A09-895F-1833655CFB21', CAST(55000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (86, 219, 1, N'3DCFE242-5286-404C-A37E-5207E6F51BB1', CAST(21550.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (87, 98, 1, N'3EDC8773-9603-4D38-9DC9-64E1C4768F7D', CAST(12500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (88, 110, 1, N'3EEC687A-759C-4D8A-8776-E257E8230376', CAST(22500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (89, 32, 1, N'3F3BED8D-1203-4D3E-8AC0-3ACAC73BDE17', CAST(29500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (90, 68, 1, N'420701D6-5F66-4885-8A72-8B54541965A6', CAST(16500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (91, 241, 1, N'43195E1A-46B2-4554-B1A9-C849B1C0B53B', CAST(9950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (92, 309, 1, N'436E43FB-E015-48E4-B549-33F4A0EE8D3F', CAST(25950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (93, 105, 1, N'4537B83B-2444-4389-B2DE-F30E15608163', CAST(123500.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (94, 218, 1, N'457046F9-68AC-468E-9C5E-9C1B957FE9B9', CAST(950.00 AS Numeric(18, 2)), CAST(25.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (95, 118, 1, N'47077B33-09BC-4FF2-B71B-58E243952BAA', CAST(56500.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (96, 286, 1, N'47572651-C884-4C1D-A433-E8641A1A1172', CAST(57600.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (97, 296, 1, N'47693731-F213-4E60-97D6-115A7BD83259', CAST(62500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (98, 291, 1, N'480D88A9-B1E5-4A79-9D2C-C1050C6DA00A', CAST(99500.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (99, 226, 1, N'48437CA9-988E-42EA-94F8-DC2D6DA48BA7', CAST(21500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
GO
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (100, 31, 1, N'486C65E8-5CB9-4A33-9507-E2E5E3CB91CC', CAST(2550.00 AS Numeric(18, 2)), CAST(50.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (101, 133, 1, N'49D19AE8-FBBF-496C-BC1E-9450544DD193', CAST(66500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (102, 78, 1, N'4A40B2AA-A76B-4C08-A59B-19CDE0ED868C', CAST(9950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (103, 148, 1, N'4A4A1D5E-1682-4ACA-A60D-0072693FE190', CAST(61500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (104, 272, 1, N'4AFC6EDF-49EA-4D57-85AF-D60734328922', CAST(33450.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (105, 285, 1, N'4B47A26E-2723-4E06-A661-21271A6759D0', CAST(45000.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (106, 231, 1, N'4BA7F44F-422D-4AD2-84B3-2AE4F0028DB8', CAST(6000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (107, 66, 1, N'4BFD3782-0B79-4F4E-981A-96CEF827497F', CAST(61500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (108, 73, 1, N'4C00023A-47C5-4F98-A9B1-F222EDE2F563', CAST(45900.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (109, 102, 1, N'4C1762AE-F7FD-4F2C-875B-CAC022B0DF63', CAST(9990.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (110, 11, 2, N'4C57F13A-E21B-4AAC-9E9D-A219D4C691C6', CAST(80500.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (111, 289, 1, N'4EE854BF-A9DD-453B-815E-E0692A75A969', CAST(61550.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (112, 47, 1, N'4FFB74AD-C031-4BD9-9589-A87F462E6842', CAST(49580.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (113, 299, 1, N'51784E0D-09DB-4A40-8E92-CB09A0DE4444', CAST(30500.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (114, 49, 1, N'518125AE-9A67-45A6-B3FD-557C785796FC', CAST(22150.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (115, 277, 1, N'519C0ED1-7611-4CDC-8153-5C4B81A7FD0F', CAST(18500.00 AS Numeric(18, 2)), CAST(1950.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (116, 52, 1, N'521659A4-8FF2-441A-8D2E-C584D561301F', CAST(15650.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (117, 112, 1, N'52CE8210-53B8-4C09-B821-6389A09733C5', CAST(85000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (118, 36, 1, N'53C088BA-6E14-4758-826A-56FC57D3EEDA', CAST(65890.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (119, 51, 1, N'54A66D7C-9E0B-40E9-B1B1-CA655F060CDE', CAST(29650.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (120, 3, 1, N'558620F5-B9E8-4FFF-8F73-A83FA9559C41', CAST(19500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (121, 20, 1, N'5672C4AF-78E1-4BA4-B1D1-19383DCBE43C', CAST(12650.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (122, 165, 1, N'57E2BA34-6397-448F-8A8C-1306CC922231', CAST(99500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (123, 156, 1, N'589E8DB1-B2D4-4921-A11B-9A2A80EA73D9', CAST(295000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (124, 230, 1, N'59650ADF-0886-43B4-B360-3A79E0CA327E', CAST(355000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (125, 63, 1, N'5BE0098D-511F-4CF1-B87C-2CE2532F1B31', CAST(102500.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (126, 27, 1, N'5CCF4F6B-43B3-4C7F-B674-6CAFD056E52A', CAST(12500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (127, 150, 1, N'5D11974B-326C-44C5-BA1D-57968CAB0DEE', CAST(255000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (128, 318, 1, N'5D7C9AA9-F0C7-4F8E-8524-6481BE3CC62E', CAST(99500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (129, 265, 1, N'607CA291-F642-4CBD-967B-7A36DF45D150', CAST(26500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (130, 9, 1, N'6081DBE7-9AD6-4C64-A676-61D919E64979', CAST(19600.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (131, 96, 1, N'6120D922-6703-4267-969B-A9A9D3CAE787', CAST(119600.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (132, 267, 1, N'614ED49B-6DA9-4BFE-9560-3DB52A6593CD', CAST(24500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (133, 207, 1, N'61B73BA2-9EA0-4DB9-8D89-6E8D2A5D32DA', CAST(62500.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (134, 254, 1, N'61F8CF9A-F53C-4386-9BF8-578F54547CD2', CAST(269500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (135, 223, 2, N'6218BE0E-185B-4B12-8696-AA976EA81B29', CAST(103650.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (136, 162, 1, N'638FCDD5-AFFF-4DCA-AAEC-17F527FB9D02', CAST(32500.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (137, 135, 1, N'643800B3-AD63-4B67-8ACF-672B91F04C57', CAST(305000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (138, 22, 1, N'646C802F-C868-40F0-AF81-1BF387AFB82B', CAST(15600.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (139, 320, 1, N'6556A473-CE18-428F-8F33-955E80FBA888', CAST(11500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (140, 170, 1, N'658F0B06-2357-4DAA-803C-4DD7F569F270', CAST(29500.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (141, 50, 1, N'65F89D52-9B2D-4363-8A07-4A5CE90197DB', CAST(35000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (142, 55, 1, N'66C9034C-23A3-44F1-B946-2DDA65E684D8', CAST(205000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (143, 53, 1, N'66CCEBEA-00EA-44B3-BBFE-AC5EC2DE456D', CAST(12500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (144, 91, 1, N'66D70810-1EE2-4BCA-B1B4-1E5B86C75002', CAST(19600.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (145, 125, 1, N'6943ADF3-01A4-4281-B0CE-93384FE60418', CAST(12500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (146, 266, 1, N'695E6D94-12E6-49BC-8E23-29AC3EB38D93', CAST(33500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (147, 271, 1, N'6A140D65-C354-48F6-A92E-40FF36CF1216', CAST(10500.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (148, 82, 1, N'6A2699A6-ED27-42A9-B811-06D19EB5FA3C', CAST(3950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (149, 304, 1, N'6AE8BA09-AE75-4CA4-81EE-6CD2B3947120', CAST(69500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (150, 152, 1, N'6AEAC4F1-4C81-4FAA-A97C-3DCC0E6CB5DE', CAST(250000.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (151, 69, 1, N'6BF8C577-E615-4667-A48C-25E8D825AAC6', CAST(66500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (152, 36, 2, N'6C76FDEC-683F-45E1-B027-20ACFD2F501C', CAST(6000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (153, 83, 1, N'70C9BE5C-3CCA-4FB2-B4DE-E5F0A61BB84D', CAST(20950.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (154, 253, 1, N'71C9EDC5-7897-4CCE-9B2F-5B04BEDC36D0', CAST(2495.00 AS Numeric(18, 2)), CAST(45.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (155, 4, 1, N'72443561-FAC4-4C25-B8FF-0C47361DDE2D', CAST(11500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (156, 65, 1, N'72EF5AA5-997C-4AC0-A32E-591D1E009818', CAST(12500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (157, 130, 1, N'7372D1C7-800F-4DE4-B3BC-FFA46CE77099', CAST(156500.00 AS Numeric(18, 2)), CAST(10000.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (158, 122, 1, N'7392B5F6-783C-4D4B-B687-74A98411A7CB', CAST(395000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (159, 297, 1, N'73FB2744-5AD9-42DC-A29C-B9B2FEF8353C', CAST(56890.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (160, 268, 1, N'740A7CB4-BF3F-46FD-98F3-D85748E5B9BA', CAST(99500.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (161, 312, 1, N'7461FB42-ECE2-4C8C-BDBB-EF26AF3069F9', CAST(9500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (162, 121, 1, N'74DD8FE1-B205-4400-A951-1E54E7C22E40', CAST(365000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (163, 280, 1, N'757E7DB7-3688-41FD-AFB6-E49CC56BCCD8', CAST(55000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (164, 171, 1, N'760F5558-3C9E-4B70-A412-0448B90B0D89', CAST(3950.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (165, 206, 1, N'76D2E902-DF33-4BE5-8181-B9DA01869131', CAST(56850.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (166, 242, 1, N'7808CA65-E449-4280-A128-F5B581F47B8F', CAST(39500.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (167, 222, 1, N'790E96BC-2F59-4B8F-9DE2-6BB65F92216B', CAST(120000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (168, 252, 1, N'798C76AF-985B-4B9F-B24A-4B4311AE2A08', CAST(1350.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (169, 147, 1, N'7A12CA8A-DC67-4A4F-B6F4-8B150873523A', CAST(65890.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (170, 45, 1, N'7BABE805-CE07-4C06-AAF1-6B5D83645CD8', CAST(12500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (171, 106, 1, N'7CEA62B1-9CBE-4E13-BECC-54E7EED128EF', CAST(25000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (172, 137, 1, N'7F08368D-B6EA-4DFC-A1EC-B1A1B0221F04', CAST(225000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (173, 183, 1, N'7FCABEE5-E116-4AE3-B7B1-483C2F0D18CA', CAST(55000.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (174, 225, 1, N'7FF88424-96A2-4149-ABF3-21AC9FBCDD4C', CAST(22500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (175, 221, 1, N'808F1237-9F5C-484F-8E14-63FF713A864D', CAST(365000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (176, 214, 1, N'80B21E0F-66E3-4582-838A-D7EC560C7C0B', CAST(12570.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (177, 128, 1, N'84BE4607-F8D7-49DA-8C27-D87FE529DF96', CAST(5680.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (178, 68, 2, N'870C2B0A-A6AE-4F84-91EF-806C985A02E5', CAST(33600.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (179, 247, 1, N'87A6B5EF-1E2B-49CA-85D7-263BC7E32189', CAST(44885.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (180, 223, 1, N'88975E00-70FD-44B6-9A1F-9E3B9CCE4382', CAST(17850.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (181, 39, 1, N'88AFBF67-13A6-4BC5-AE50-8C64F0F25453', CAST(220500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (182, 196, 1, N'896B39D5-8040-4947-94D0-0234B4E78B23', CAST(21600.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (183, 180, 1, N'8979136A-B34A-4CD3-B119-A6B158D15FFF', CAST(32675.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (184, 229, 1, N'89C3293F-F665-4E93-9929-315CBA3DD498', CAST(98950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (185, 189, 1, N'8A275CE2-D116-49F7-8571-FD91F21ADAAA', CAST(235000.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (186, 160, 2, N'8BB5BBD3-E03C-457C-86E2-67199FCB302A', CAST(77500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (187, 164, 1, N'8BB7FF86-2D80-40B7-B216-254C16843529', CAST(8500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (188, 208, 1, N'8BED3FBE-29EA-48AF-A8CE-7770F51A548F', CAST(42500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (189, 71, 1, N'8C1E8506-711C-442A-89A4-EDA28EB5B788', CAST(19500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (190, 215, 1, N'8D9BF815-FAE4-47CE-ADBB-33339D382319', CAST(9890.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (191, 127, 1, N'8F100F91-FE3C-4338-AA52-7BF61A540199', CAST(3500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (192, 46, 2, N'8F278478-CA0B-4CDB-8F02-1A054AAE88A9', CAST(39500.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (193, 308, 1, N'91B4067A-EBDE-4C1E-9370-3E894FD2FD7D', CAST(17850.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (194, 14, 1, N'91CF8133-EF19-4C92-BEFB-6A24FD85EF3A', CAST(195000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (195, 62, 1, N'92D7DE8E-0BA7-4221-B2B1-A01F7FAFDD3E', CAST(6500.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (196, 317, 1, N'92FDF39E-6565-4B68-80BA-02ED30F00A7E', CAST(123500.00 AS Numeric(18, 2)), CAST(3500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (197, 16, 1, N'94FF5451-471C-4F17-BE27-BA55D3ECF5DC', CAST(8695.00 AS Numeric(18, 2)), CAST(95.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (198, 13, 1, N'951195C4-7B69-418B-9AC2-61CCB7FE7C09', CAST(8950.00 AS Numeric(18, 2)), CAST(25.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (199, 256, 1, N'9555FF33-EE29-4A81-854A-69F6485BB216', CAST(25950.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
GO
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (200, 85, 1, N'955E8BC5-C31B-4EE5-A48D-76517063C334', CAST(56500.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (201, 260, 1, N'9743A284-D059-4EEB-98AB-ACDE88C1E9F5', CAST(6590.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (202, 81, 1, N'97AFC7D5-91BF-47E3-8568-01B704E956C2', CAST(3500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (203, 115, 1, N'98299E86-0B98-42D8-A549-37D89435B4E3', CAST(125950.00 AS Numeric(18, 2)), CAST(12500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (204, 234, 2, N'9868BF47-F113-4721-BF95-26FEF8DD51D2', CAST(99500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (205, 313, 1, N'98828061-0C7A-42C2-95D0-3095AD2EF0E4', CAST(8900.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (206, 34, 1, N'98A92DA3-2B99-4625-998B-2BB2FBB8F167', CAST(56950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (207, 77, 1, N'98B3C1C2-7AE2-4A88-A3C9-484483C6EC66', CAST(9500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (208, 12, 1, N'98C1E31A-4258-4F78-95D4-2365167E6F3F', CAST(169500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (209, 70, 1, N'98C3863B-7A70-4FAD-B3C7-2B5702956E18', CAST(45000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (210, 211, 1, N'99DF9E69-9DAF-4D81-8334-D7058F1030E2', CAST(1950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (211, 108, 1, N'9B8B87E1-7770-4136-8EB4-B7173C8783A6', CAST(99500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (212, 199, 1, N'9BFDC1FA-8416-4F58-BE6C-3CCFA7A51860', CAST(99950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (213, 246, 1, N'9CD9439F-E15F-4469-BE82-7A4041633A50', CAST(100000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (214, 75, 1, N'9CFAF367-ED4B-4A3E-8CB2-394F1F7A58C1', CAST(65500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (215, 94, 1, N'9D74A1A9-7342-4FEA-9C21-6AC4EFE92018', CAST(6550.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (216, 240, 1, N'9E98DDEF-D2A3-4BEC-99DD-BEFEFC11E5EE', CAST(2500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (217, 99, 1, N'9FF62C70-89E4-4815-912F-C5DFBF8BDF0F', CAST(12500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (218, 259, 1, N'A0098927-0C7D-4CC8-8022-57A24433EF61', CAST(1250.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (219, 104, 1, N'A017241D-3A92-4EA7-A3EE-22FC119542F8', CAST(60500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (220, 126, 1, N'A08FCF25-5B27-4215-BF50-E94D0F7C8CD6', CAST(2250.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (221, 245, 1, N'A0F4D013-88EB-4692-B5EE-6BA800593036', CAST(55000.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (222, 58, 1, N'A1A4180E-B929-467D-91A6-73D2D0F34C65', CAST(79500.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (223, 38, 1, N'A2112C27-FE1F-48C5-A3BE-A019EE17DDD6', CAST(3650.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (224, 205, 1, N'A21CAFB1-7242-42D1-80AC-E5D26941E2BE', CAST(7500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (225, 233, 1, N'A2201698-CA26-428A-988F-ABB4A8893E21', CAST(56900.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (226, 238, 1, N'A23F2E70-66D3-44A1-982C-ADE1ECA9CC30', CAST(255000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (227, 2, 1, N'A2C3B95E-3005-4840-8CE3-A7BC5F9CFB5F', CAST(220000.00 AS Numeric(18, 2)), CAST(60000.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (228, 250, 1, N'A326183E-7D45-4CF2-A353-7177A3EAB71F', CAST(195000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (229, 302, 1, N'A3E788F8-889C-45E1-A610-881983869F6B', CAST(12500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (230, 294, 1, N'A44EE0A0-B924-4B29-9C05-BA4BFADE084B', CAST(72500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (231, 119, 1, N'A48E5430-ACA4-41FD-BC6F-446BE2B46DF8', CAST(55000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (232, 153, 1, N'A5BDB4E0-1544-449F-8596-D63D70548675', CAST(6500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (233, 228, 1, N'A6FCB276-6311-4B3E-9C99-23F197952F1C', CAST(55450.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (234, 37, 1, N'A7A80CA3-06D6-40AF-A558-09146A650340', CAST(39500.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (235, 200, 1, N'A88F114F-3808-4B2D-92BE-BD43EEA71742', CAST(46900.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (236, 29, 1, N'A926BB6C-FC26-4EBB-997E-2DF7EDC48E92', CAST(159500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (237, 35, 1, N'A9D335E7-2389-4DE1-9484-DC4EC6BA81D4', CAST(56000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (238, 57, 1, N'AAF61ECC-0BAC-4EAF-9E50-01749253329A', CAST(19500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (239, 177, 1, N'ACB85DBA-4914-4222-8D24-6D87B0DAE10A', CAST(89500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (240, 236, 1, N'AF51E444-D0BE-477F-8834-615824E0A89C', CAST(9800.00 AS Numeric(18, 2)), CAST(35.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (241, 182, 1, N'AFAF5C3E-80C9-4C5A-9D2A-CDD238E40264', CAST(5500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (242, 209, 1, N'B0559A26-5CE0-4C70-89EC-C73C0837B1E8', CAST(65450.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (243, 171, 2, N'B09E4DDD-C2DD-45BE-B5F1-19FBF5970352', CAST(29500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (244, 41, 1, N'B165CAEF-FF77-4E63-98C1-59D97F97E7C9', CAST(17500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (245, 264, 1, N'B1ABF9BD-1FBC-4E9A-BCCC-0B9AFEE5CFF1', CAST(6950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (246, 1, 1, N'B1C3B95E-3005-4840-8CE3-A7BC5F9CFB3F', CAST(65000.00 AS Numeric(18, 2)), CAST(2700.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (247, 88, 1, N'B25CB659-C0A2-451E-AADB-7A006414D6E1', CAST(55000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (248, 243, 1, N'B2D76C72-FA30-40AE-9AB9-DFB47560348C', CAST(23500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (249, 54, 1, N'B36188E4-3684-4337-91FE-84BB33736476', CAST(195000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (250, 171, 3, N'B4CC6E9A-8473-4A84-A811-73EABAFDC582', CAST(12500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (251, 195, 1, N'B503DD91-24FA-4F4A-AF49-1EB15347A33D', CAST(45950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (252, 59, 1, N'B5E7DD25-9D69-464C-9327-A8C5E706F534', CAST(14590.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (253, 146, 1, N'B607E8E1-5ECA-4DE2-BC46-909DBF9371D3', CAST(79500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (254, 92, 1, N'B760CF74-6468-4A0D-9485-36C7F7710EB0', CAST(45950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (255, 84, 1, N'B76D6985-E106-4213-AACC-288088795C92', CAST(7500.00 AS Numeric(18, 2)), CAST(75.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (256, 192, 1, N'B822FA7C-5FA5-4F17-A3A6-7199CB00F7F8', CAST(39500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (257, 184, 1, N'B84575EE-2E61-482C-8B72-5A6A90ADC3FE', CAST(49500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (258, 293, 1, N'B8498BEE-D1C5-4D93-981F-640031A3AE6C', CAST(89500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (259, 249, 1, N'B89AF48B-4BB9-409B-876B-941E51D19381', CAST(950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (260, 204, 1, N'B8F3827A-5689-42B9-A1DE-26AFE7E2343E', CAST(12500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (261, 281, 1, N'BA123B46-B5DF-439B-9326-82174419FC14', CAST(1250.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (262, 95, 1, N'BB4B9483-7AE3-47B4-A788-7EB5D12A7516', CAST(76500.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (263, 117, 1, N'BBDFB7CF-FBA6-4463-BC1E-FE79522431EE', CAST(9950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (264, 72, 1, N'BC4D491E-764B-48AE-BEDC-07DE123B7200', CAST(76500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (265, 15, 1, N'BCCB9C13-AEDA-4467-A014-48F0C7A0D6A4', CAST(22950.00 AS Numeric(18, 2)), CAST(950.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (266, 157, 1, N'BD15948E-42F0-41BC-920C-343E0816B0AB', CAST(99500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (267, 64, 1, N'BDC5E621-D976-478D-A620-A0751FCBEF96', CAST(99500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (268, 261, 1, N'BEC34DF7-3E37-4322-A406-04BB5DF2A0FE', CAST(89500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (269, 19, 1, N'BEECAE2C-0A38-473D-893F-7C8917A779C2', CAST(5500.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (270, 220, 1, N'BF9128E0-D61A-4214-8128-44A9880E20C2', CAST(5950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (271, 238, 2, N'BFC6861C-8D2E-40C8-A4F7-07F9E41056DC', CAST(12950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (272, 94, 2, N'C001858B-0B5D-4648-8F0D-80269964C921', CAST(156500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (273, 109, 1, N'C0E2E06D-AE60-4223-9E7C-B8387F2A4335', CAST(39500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (274, 6, 1, N'C1459308-7EA5-4A2D-82BC-38079BB4049B', CAST(29500.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (275, 244, 1, N'C19B3F44-9EA7-49FF-953A-86BF48B55615', CAST(45950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (276, 144, 1, N'C1A812F1-5FA1-48BA-8787-16F2F0A704BC', CAST(79500.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (277, 188, 1, N'C1C9D15D-9E57-4D22-8997-D1333EEC6B13', CAST(19500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (278, 323, 1, N'C2623FF4-88AA-40E9-AF3B-8D009C25027B', CAST(950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (279, 149, 1, N'C4ACB04E-C8D4-465E-8D66-8BA033443D61', CAST(12500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (280, 234, 3, N'C7086D43-16DA-444F-A461-76DA9C479425', CAST(123500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (281, 203, 1, N'C72ABA1C-D1FA-4A4B-9E16-9FE066D509BA', CAST(11990.00 AS Numeric(18, 2)), CAST(900.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (282, 324, 1, N'C7569243-BDDB-4250-901E-EA6034824106', CAST(145000.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (283, 295, 1, N'C8C871B4-F08D-445A-BCD1-ACFEC616A113', CAST(56950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (284, 303, 1, N'C8F49B5E-EDDB-42D0-BE0F-8C4181A6C81D', CAST(1150.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (285, 194, 1, N'C9D8FCFE-4A88-479C-A2CA-E2474AF4D8DF', CAST(11500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (286, 142, 1, N'CD06C0DF-D3A2-4593-BF40-7DAE6B73F58C', CAST(295000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (287, 319, 1, N'CD2E20D3-1A10-4460-AC3B-FAC658F5F6F4', CAST(54500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (288, 42, 1, N'CE0A56A6-8218-4F4C-A0E2-63F3DC9E4AE6', CAST(8800.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (289, 8, 1, N'CEDFB8D2-BD98-4A08-BC46-406D23940527', CAST(76000.00 AS Numeric(18, 2)), CAST(5500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (290, 114, 1, N'CF9A23D7-6F8A-4CA6-A037-95EA7385B539', CAST(22500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (291, 169, 1, N'D05D6642-FABF-4F56-8A7E-D8C47A8AAB70', CAST(5650.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (292, 269, 1, N'D0B8D738-B33D-4F7F-BA25-46EC06DEB8E2', CAST(99990.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (293, 300, 2, N'D0F51768-8924-4EF5-A3E9-B31AC7129BFB', CAST(25500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (294, 212, 1, N'D231E90A-140A-4623-AA79-16970966DDF3', CAST(1150.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (295, 168, 1, N'D32D55B7-3546-4CCA-B4C0-DBA976572CA2', CAST(12950.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (296, 159, 1, N'D3C15454-EF60-415F-860D-99D41F0A485F', CAST(45000.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (297, 10, 1, N'D63C8CC9-DB19-4B9C-9C8E-6C6370812041', CAST(36500.00 AS Numeric(18, 2)), CAST(2500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (298, 173, 1, N'D69ABA72-1B0D-4073-8B7D-D6CA65C4DDF7', CAST(335000.00 AS Numeric(18, 2)), CAST(1250.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (299, 46, 1, N'D7BF8DD9-1841-4FDE-8469-66B09FA30A74', CAST(9950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
GO
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (300, 51, 2, N'D93AF620-4F69-475A-98ED-829E0F8A3A40', CAST(45500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (301, 185, 1, N'DB2AF439-6293-4925-B905-1A57A0118B1A', CAST(250000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (302, 298, 1, N'DB742D0B-E562-41F4-AC94-8C58C2B0B69C', CAST(33600.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (303, 102, 2, N'DB8869B2-1EC0-48D5-9DA6-FDF1665155F0', CAST(46500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (304, 102, 3, N'DD651733-FE5C-46B9-AC97-727F8CD170A6', CAST(9500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (305, 90, 1, N'DD6A0129-40CF-449F-8427-1C97BF14B2BD', CAST(35250.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (306, 116, 1, N'DD8D9340-29B0-4E0D-89B3-BD33B70E087D', CAST(8850.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (307, 113, 1, N'DE44149E-1225-4B7C-97E5-8089A4F21C1C', CAST(1250.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (308, 160, 1, N'DF5411FC-24C5-4CAB-89DF-54741054D8DD', CAST(36500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (309, 56, 1, N'E00D10E9-7F7F-49A9-BDC0-4C2611580B4E', CAST(66500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (310, 158, 1, N'E0760EF4-3939-4063-821F-5923EF8760B4', CAST(33500.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (311, 93, 1, N'E1350CBE-B916-4F18-B5BF-F7D53A31205A', CAST(9950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (312, 310, 1, N'E166158C-F3BA-47DE-A499-A703210CF128', CAST(29500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (313, 28, 1, N'E264504D-3451-4670-AAB8-E4C66F2387B0', CAST(12500.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (314, 131, 1, N'E267042F-449B-4CA9-8BDE-5C197DC8A647', CAST(56500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (315, 101, 1, N'E368D03E-239C-499F-A41A-CC4D2AE1AFF8', CAST(55000.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (316, 314, 1, N'E519F3CF-BE4B-44CF-98D5-80EC33EC6CE1', CAST(11590.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (317, 179, 1, N'E59BFE04-E70B-4BAC-9269-ADC311ED0032', CAST(22600.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (318, 274, 1, N'E66B3E09-F02D-484A-8B9F-A8CD7833CD6B', CAST(2400.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (319, 276, 1, N'E68BB825-0487-44CA-AE6C-7C650F81E22B', CAST(2350.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (320, 315, 1, N'E6923E8C-C07A-430F-B80D-7D5F329055AB', CAST(8500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (321, 67, 1, N'E6E23C74-39AF-4A44-BAAE-7CD48B0F6161', CAST(79500.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (322, 7, 1, N'E6E6270A-60B0-4817-AA57-17F26B2B8DAF', CAST(49500.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (323, 120, 1, N'E869D5E4-CAC0-48ED-8961-03D0405EA2FD', CAST(56950.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (324, 301, 1, N'E8FF8444-2B18-45A0-84AC-F776755E06ED', CAST(39500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (325, 257, 1, N'EA1B19C6-631A-4683-9E29-1BC601FC850E', CAST(9990.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (326, 129, 1, N'EB59DB36-5E67-4AF1-AE8A-46E8999EEF45', CAST(8550.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (327, 191, 1, N'EBE7AD85-117F-4781-A5E5-13920EE2B546', CAST(245000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (328, 100, 1, N'EC25FA02-2692-42E1-85A0-71F0775C8F8A', CAST(56890.00 AS Numeric(18, 2)), CAST(2450.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (329, 155, 1, N'ECC534C7-B2DD-425C-98D3-98D2332B373C', CAST(950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (330, 193, 1, N'ECD53BA8-3C63-4938-92C4-C955AEA6C4BC', CAST(23500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (331, 136, 1, N'EDCCE461-5DA8-4E2E-8F08-798431841575', CAST(45000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (332, 292, 1, N'EE92EE4A-977E-4BC6-BEFF-512CC468944C', CAST(56800.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (333, 273, 1, N'EF8621F7-41EB-4C2D-ADBD-D4287083D41F', CAST(72500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (334, 262, 1, N'F075AC9E-1124-4194-A05F-683F9D553335', CAST(18500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (335, 321, 1, N'F166C930-3101-42E9-8AE8-189F47FA0014', CAST(17950.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (336, 25, 1, N'F2DE934E-62C3-45F6-AFA8-2FFA963F5360', CAST(22950.00 AS Numeric(18, 2)), CAST(50.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (337, 11, 1, N'F3A2712D-20CA-495D-9F6A-8A4CA195248D', CAST(8500.00 AS Numeric(18, 2)), CAST(50.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (338, 288, 1, N'F4443E46-3EAC-4C10-902C-71257DEEE229', CAST(39500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (339, 234, 1, N'F556C096-7EFE-4827-9AFF-2FD0416B1C9B', CAST(145000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (340, 216, 1, N'F6C384B6-B768-4031-AC12-81C8CE37049E', CAST(56950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (341, 102, 4, N'F810FAB0-6BAE-4AC0-BDBC-F14A71AC35B9', CAST(125500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (342, 151, 1, N'F8B48177-FB78-4245-935F-FB6FBCE8D870', CAST(255950.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (343, 21, 1, N'F95052DB-3E09-4070-ADA4-5114CCAD96C0', CAST(8950.00 AS Numeric(18, 2)), CAST(950.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (344, 217, 1, N'F9EF8BCC-5744-4EBC-91AD-739775C597D9', CAST(45950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (345, 237, 1, N'FAB39B43-A811-4410-A69A-707C35C767E7', CAST(15950.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (346, 282, 1, N'FCB80D65-7D65-41E4-9081-6C92D0C7F1F5', CAST(345000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (347, 18, 1, N'FDCDF3F0-F0AD-4E7F-8793-8B146700D035', CAST(19500.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)))
INSERT [Data].[SalesDetails] ([SalesDetailsID], [SalesID], [LineItemNumber], [StockID], [SalePrice], [LineItemDiscount]) VALUES (348, 255, 1, N'FF62897D-E06C-4BC1-B5EA-E6BE415B0CD1', CAST(195000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [Data].[SalesDetails] OFF
GO
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'009A5323-23E5-48BE-95DB-BA94E1897419', 51, 20000.0000, 1360.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2017-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'00DDC5C0-E266-49E4-A785-E4F8BC3C9B24', 89, 15600.0000, 2000.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-08-28' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'00E07EB4-4A3A-434F-B3FC-76A312BEEF5D', 12, 6040.0000, 500.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2017-12-09' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'01B087C6-00D1-40B2-808F-B4B5BC1E344D', 54, 17200.0000, 500.0000, 500.0000, 150.0000, 1, 5, N'', CAST(N'2017-02-04' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'0318C525-58CA-438E-A5A5-BA854855A664', 24, 66072.0000, 1490.0000, 457.0000, 750.0000, 1, 6, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'03AC7842-CA66-4AC0-92AD-F538494D1FAE', 35, 146000.0000, 5500.0000, 1500.0000, 1950.0000, 1, 6, N'', CAST(N'2018-02-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'0487C263-79B7-4F2B-8D0E-B0BAA41D7F24', 25, 47600.0000, 500.0000, 500.0000, 550.0000, 1, 1, N'', CAST(N'2018-12-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'055F7639-30EA-4975-A8CB-29F5C1C1C48E', 86, 4400.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-05-28' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'0588AA57-B6B5-47F5-910F-5A1099B0476D', 23, 34360.0000, 970.0000, 750.0000, 550.0000, 1, 7, N'', CAST(N'2017-03-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'05AB94D5-2F8D-4B06-878D-615956C94EC2', 37, 130000.0000, 3950.0000, 3150.0000, 1950.0000, 1, 9, N'', CAST(N'2017-04-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'05D4115C-3F27-4059-BDC8-C0C3FFC85E8B', 11, 40960.0000, 1360.0000, 500.0000, 550.0000, 1, 1, N'', CAST(N'2017-11-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'05F6C06A-9CD8-448B-9F67-FDBC0A7CEDCE', 53, 2860.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'06FD2864-8415-44A5-B022-B98BEFB7E490', 90, 7400.0000, 500.0000, 750.0000, 150.0000, 1, 10, N'', CAST(N'2017-05-18' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'07E4BA14-7B78-4B11-9A11-1520460A5631', 6, 124000.0000, 3950.0000, 3150.0000, 1950.0000, 1, 1, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'07F0D746-085B-4FB9-9F82-6CEAC851FBC3', 51, 14000.0000, 1360.0000, 225.0000, 150.0000, 0, 6, N'', CAST(N'2016-05-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'08B3555E-47A2-4365-AED8-2DF054FF73E2', 62, 176400.0000, 9250.0000, 2200.0000, 1950.0000, 1, 9, N'', CAST(N'2017-04-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'09FA3947-726D-4987-B9DD-2F4CF7CD7C45', 26, 100000.0000, 500.0000, 1500.0000, 750.0000, 1, 6, N'', CAST(N'2016-12-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'0A059F54-46DE-4A25-8B5D-D7373AEE6F91', 94, 2000.0000, 500.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2018-10-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'0B0E0FC2-E72B-4BD4-9C46-1AF98F17BEC4', 87, 10200.0000, 970.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2016-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'0B3AEBF5-0997-447D-B0E8-B399B7343742', 14, 44480.0000, 660.0000, 750.0000, 550.0000, 1, 6, N'', CAST(N'2017-03-12' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'0BE222D6-9254-4FC8-892D-76563CA81F9B', 32, 79600.0000, 2175.0000, 750.0000, 750.0000, 1, 10, N'', CAST(N'2016-06-06' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'0C3EBD09-B9DF-414D-AD00-90F5819812D0', 85, 36000.0000, 500.0000, 750.0000, 550.0000, 1, 2, N'', CAST(N'2017-05-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'0CC75388-9A95-4F14-8D9A-8373E3B44D8A', 24, 55600.0000, 1490.0000, 1500.0000, 750.0000, 1, 10, N'', CAST(N'2015-11-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'0E2AECED-5A41-412A-9414-DE7217C0B6EB', 72, 69200.0000, 2175.0000, 750.0000, 750.0000, 1, 9, N'', CAST(N'2018-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'100EE806-DFE5-4C5E-9AB4-8F881615F8BD', 87, 4544.0000, 500.0000, 150.0000, 150.0000, 1, 4, N'', CAST(N'2016-08-26' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'102A734C-3212-4708-85A5-A96FE8E14641', 18, 135600.0000, 9250.0000, 1500.0000, 1950.0000, 1, 3, N'', CAST(N'2016-12-07' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'10AD713C-C997-48BB-A5FB-F0B5FD26479B', 13, 12600.0000, 1360.0000, 750.0000, 150.0000, 1, 8, N'', CAST(N'2017-09-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'114760E3-FC54-4C31-B323-BC4B83AB80D0', 9, 102800.0000, 3950.0000, 2200.0000, 1950.0000, 1, 2, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'11790E1E-859C-4E05-B6B3-6D72DDCC8DAE', 6, 82360.0000, 2175.0000, 2200.0000, 750.0000, 1, 1, N'', CAST(N'2016-04-26' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'11BCE306-33ED-4C8D-9198-2A4B653D9F8A', 55, 5200.0000, 500.0000, 750.0000, 150.0000, 1, 8, N'', CAST(N'2017-02-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'126C36BB-9C33-4BC5-9127-F941731DD0C8', 32, 73720.0000, 2175.0000, 225.0000, 750.0000, 1, 2, N'', CAST(N'2016-08-22' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'13F9FBD7-9342-4A2D-A249-E3AD6AE9A9CB', 74, 54800.0000, 500.0000, 1500.0000, 750.0000, 1, 5, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'15108517-AD0C-4FF2-A7D4-57679C374A68', 3, 124000.0000, 9250.0000, 750.0000, 1950.0000, 1, 9, N'', CAST(N'2017-09-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'155E940E-7AA7-47EA-B83F-B3521F0B5718', 11, 55120.0000, 500.0000, 750.0000, 750.0000, 1, 5, N'', CAST(N'2016-09-09' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'15A09123-FE51-47D2-A7B0-600CB300F826', 100, 1200.0000, 500.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'170FAF32-4223-4806-B483-D89F4D38AC16', 27, 100000.0000, 500.0000, 2200.0000, 750.0000, 1, 6, N'', CAST(N'2016-08-22' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'17FA511D-1C85-4F74-A164-B4EE39F48565', 24, 90872.0000, 500.0000, 225.0000, 750.0000, 1, 7, N'', CAST(N'2018-07-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'1860F37A-EBC7-42E9-B339-3F6D6048322F', 11, 36760.0000, 2000.0000, 500.0000, 550.0000, 1, 1, N'', CAST(N'2017-12-09' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'18974E49-6B03-4C6E-BA0C-D564CFF868E0', 31, 62000.0000, 2000.0000, 1500.0000, 750.0000, 1, 5, N'', CAST(N'2016-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'18E980AB-452D-42EF-8728-12822AD20C60', 26, 98872.0000, 2175.0000, 2200.0000, 750.0000, 1, 1, N'', CAST(N'2015-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'1909CD9B-9C06-4CFB-B8AD-292967E55E2F', 68, 23600.0000, 970.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2017-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'19D1000C-178F-4BBA-9B19-C93804D047AC', 73, 2860.0000, 500.0000, 750.0000, 150.0000, 1, 10, N'', CAST(N'2016-09-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'1A210C04-C981-4EA4-83B9-A6E76B5B9BDB', 11, 39600.0000, 500.0000, 500.0000, 550.0000, 1, 10, N'', CAST(N'2016-07-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'1A861C29-F198-4D34-BDAF-B35E8080320A', 66, 20000.0000, 1360.0000, 457.0000, 150.0000, 1, 6, N'', CAST(N'2018-09-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'1B77D0BA-45C9-4C76-952E-B2FA2859B7AB', 41, 111600.0000, 9250.0000, 2200.0000, 1950.0000, 1, 3, N'', CAST(N'2017-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'1BB4B941-79F4-4E98-9E13-46875CA7EB67', 76, 18080.0000, 660.0000, 750.0000, 150.0000, 0, 9, N'', CAST(N'2015-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'1C9E6944-A890-4D7B-8F98-32B7276A78B3', 74, 47200.0000, 2000.0000, 750.0000, 550.0000, 0, 2, N'', CAST(N'2018-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'1D5C9493-4BA2-415A-B4D6-7079278CA2DC', 95, 1560.0000, 500.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2018-10-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'1D997989-769F-4879-B7E1-837015CEEFC5', 85, 19600.0000, 660.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'1DDF23D7-3CB8-49C7-A19B-2A9C5AB23ADF', 54, 4552.0000, 500.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2018-03-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'20041639-9549-415A-AEC2-7159352E8CB7', 8, 248000.0000, 9250.0000, 7900.0000, 1950.0000, 0, 10, N'', CAST(N'2018-03-08' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'202B3C90-188F-413E-A44A-B99F16F03464', 2, 132000.0000, 3950.0000, 2200.0000, 1950.0000, 1, 7, N'', CAST(N'2015-12-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2189D556-D1C4-4BC1-B0C8-4053319E8E9D', 13, 15960.0000, 1360.0000, 500.0000, 150.0000, 1, 9, N'', CAST(N'2015-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2309FF52-564A-4A2C-B6EB-D94AA321D687', 23, 31600.0000, 1360.0000, 500.0000, 550.0000, 0, 1, N'', CAST(N'2017-12-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2319EA77-F4D9-4E34-9771-C42DCA3E210C', 34, 151600.0000, 500.0000, 1500.0000, 1950.0000, 1, 2, N'', CAST(N'2016-10-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'23E43063-5402-4946-8830-0723F6B3CE1C', 37, 132000.0000, 9250.0000, 3150.0000, 1950.0000, 1, 5, N'', CAST(N'2017-08-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'23E7F9FA-67D4-47C1-8D66-F1CFBC33540F', 9, 79600.0000, 500.0000, 750.0000, 750.0000, 1, 1, N'', CAST(N'2016-05-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'23FDFA0D-C905-41A6-B95A-D5A3517293D8', 51, 5560.0000, 500.0000, 1050.0000, 150.0000, 1, 1, N'', CAST(N'2018-07-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2595D5C0-5002-464B-8F2B-C873FB29B4F9', 41, 79960.0000, 1490.0000, 750.0000, 750.0000, 1, 2, N'', CAST(N'2017-06-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'26122425-FE14-4318-8713-15C8F9EED630', 54, 9240.0000, 500.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'26199C63-95B5-419B-A827-C0EEAF594A5B', 51, 8400.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2017-11-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2657F22B-5D29-4A7A-B3F9-3A04C14D7C93', 55, 18880.0000, 1360.0000, 750.0000, 150.0000, 0, 7, N'', CAST(N'2017-12-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'266404D4-FBC5-4DC6-BB7C-A2ED7246D6D7', 21, 42000.0000, 500.0000, 750.0000, 550.0000, 0, 6, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'26A3D067-DCEA-4FF1-9A97-E7AEE0D2BC14', 24, 43000.0000, 2000.0000, 750.0000, 550.0000, 1, 3, N'', CAST(N'2015-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'27C180A1-7C39-4E88-B5DE-ACD0C9594F3C', 9, 108000.0000, 5500.0000, 5600.0000, 1950.0000, 1, 3, N'', CAST(N'2018-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'281946B6-D061-455A-801B-A0EDF3E37530', 13, 10120.0000, 500.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2016-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2866BF16-7A79-4DB7-8657-30958E4035A9', 74, 45512.0000, 500.0000, 500.0000, 550.0000, 1, 9, N'', CAST(N'2017-06-23' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2A27FF01-DC3C-4FE2-AC8C-9145C29F651C', 27, 82000.0000, 2175.0000, 1500.0000, 750.0000, 1, 1, N'', CAST(N'2018-08-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2B0FC8E5-82CB-4804-8691-0586F2255E9E', 38, 108000.0000, 2000.0000, 1500.0000, 1950.0000, 1, 10, N'', CAST(N'2017-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2C377634-90F1-4BC1-A366-0F0EBD26910D', 29, 69200.0000, 2000.0000, 1500.0000, 750.0000, 1, 10, N'', CAST(N'2017-03-08' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2CE57C5E-98DE-402F-884A-A6227FD7FB5F', 22, 45560.0000, 500.0000, 1500.0000, 550.0000, 1, 8, N'', CAST(N'2017-12-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2D512849-C35D-4B54-BDC8-C5523C1ABF86', 72, 44000.0000, 500.0000, 457.0000, 550.0000, 1, 1, N'', CAST(N'2018-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2E0E8003-F9CC-486D-9D08-D4DAC688C800', 65, 4400.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-12-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'2FCD3EBC-CBA7-4B3C-B6A0-A3A011D3A47B', 27, 39600.0000, 660.0000, 500.0000, 550.0000, 1, 3, N'', CAST(N'2016-09-06' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'306507B9-D2E1-4C5D-8F01-C93C90C93B6E', 29, 79600.0000, 2175.0000, 750.0000, 750.0000, 1, 7, N'', CAST(N'2017-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'30DC26F7-E98B-4FE8-B834-D625EC7E12F3', 33, 68520.0000, 2175.0000, 750.0000, 750.0000, 0, 10, N'', CAST(N'2016-10-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'30EC553A-ADEA-4503-B748-C908A979EC45', 71, 17880.0000, 970.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'325F4D73-D44A-44BD-B109-AD25D924D38F', 75, 18392.0000, 390.0000, 150.0000, 150.0000, 1, 7, N'', CAST(N'2015-07-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'32C41EC9-CB3C-4D0F-9C85-2500CE2E4813', 65, 792.0000, 500.0000, 150.0000, 150.0000, 0, 3, N'', CAST(N'2017-03-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'332CE8D2-E19F-4656-BCC6-E3E45AD09D85', 25, 45200.0000, 500.0000, 750.0000, 550.0000, 1, 10, N'', CAST(N'2017-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'34A4BB21-60B3-4B0D-8DDB-8189C471A581', 47, 36000.0000, 2000.0000, 500.0000, 550.0000, 1, 7, N'', CAST(N'2017-08-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'34A69512-CDC3-4BEB-ADCB-AAE360CA7CF4', 89, 7960.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'34CEE6C8-985B-4005-AB2F-AD3235C6A16D', 24, 44800.0000, 1785.0000, 500.0000, 550.0000, 1, 4, N'', CAST(N'2015-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'356EE84B-F4FD-4923-9423-D58E2863E9A1', 25, 36480.0000, 500.0000, 500.0000, 550.0000, 1, 5, N'', CAST(N'2016-07-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'361E0EFF-56B8-4E0A-A1DD-41D4A51BF704', 78, 49200.0000, 500.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'373B7D39-B5A3-4018-883C-AC81EF3B5D8F', 24, 38280.0000, 660.0000, 750.0000, 550.0000, 1, 9, N'', CAST(N'2016-02-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'384778FF-C28D-4FE6-9BEF-D787EFDC23CF', 74, 22312.0000, 970.0000, 500.0000, 150.0000, 1, 1, N'', CAST(N'2016-09-15' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'39CEB089-BC4F-4724-A47B-CDB0E2401714', 52, 12440.0000, 1360.0000, 750.0000, 150.0000, 1, 6, N'', CAST(N'2018-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3A0070F8-C340-4B6F-9F36-4A1CBDB39FE9', 65, 1880.0000, 500.0000, 225.0000, 150.0000, 1, 3, N'', CAST(N'2017-05-26' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3A8161E3-C69D-4CC0-83DA-18EDE07CC83A', 36, 45592.0000, 970.0000, 750.0000, 550.0000, 1, 9, N'', CAST(N'2017-04-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3BDD9316-9359-464B-B98E-308494AD3056', 25, 36000.0000, 500.0000, 750.0000, 550.0000, 1, 10, N'', CAST(N'2018-10-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3C17F01C-25FF-463B-86AA-1A34FEA02FF2', 28, 45592.0000, 970.0000, 457.0000, 550.0000, 1, 1, N'', CAST(N'2018-10-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3C384AE3-7F59-4CD6-BAFE-5E6EFFD25FAD', 95, 1272.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-12-07' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3CD0AFE8-9909-4A5D-BA9F-5C1F71B0DEE3', 84, 4400.0000, 500.0000, 750.0000, 150.0000, 0, 2, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3CF2C0F8-21E1-4ADE-AE72-AB9DFE3790DD', 35, 79600.0000, 1490.0000, 750.0000, 750.0000, 1, 5, N'', CAST(N'2016-12-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3D2907ED-A866-4E81-B7CB-723EA2254718', 84, 12480.0000, 1360.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3D2E9AD0-972B-4A09-895F-1833655CFB21', 26, 44000.0000, 1360.0000, 1500.0000, 550.0000, 1, 2, N'', CAST(N'2018-08-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3D993E95-26AF-416D-B89E-688873C03AA7', 88, 12760.0000, 660.0000, 750.0000, 150.0000, 0, 2, N'', CAST(N'2016-10-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3DCFE242-5286-404C-A37E-5207E6F51BB1', 74, 17240.0000, 970.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3EDC8773-9603-4D38-9DC9-64E1C4768F7D', 88, 10000.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-10-29' AS Date), CAST(N'12:55:00' AS Time))
GO
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3EEC687A-759C-4D8A-8776-E257E8230376', 16, 18000.0000, 1360.0000, 750.0000, 150.0000, 1, 8, N'', CAST(N'2016-12-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'3F3BED8D-1203-4D3E-8AC0-3ACAC73BDE17', 11, 23600.0000, 1360.0000, 500.0000, 150.0000, 0, 1, N'', CAST(N'2016-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'420701D6-5F66-4885-8A72-8B54541965A6', 12, 13200.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2016-08-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'43195E1A-46B2-4554-B1A9-C849B1C0B53B', 53, 7960.0000, 500.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2017-11-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'436E43FB-E015-48E4-B549-33F4A0EE8D3F', 71, 20760.0000, 1360.0000, 457.0000, 150.0000, 1, 1, N'', CAST(N'2018-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4537B83B-2444-4389-B2DE-F30E15608163', 17, 98800.0000, 2000.0000, 750.0000, 750.0000, 0, 1, N'', CAST(N'2016-12-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'457046F9-68AC-468E-9C5E-9C1B957FE9B9', 96, 760.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'47077B33-09BC-4FF2-B71B-58E243952BAA', 28, 45200.0000, 500.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2017-01-20' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'47572651-C884-4C1D-A433-E8641A1A1172', 28, 46080.0000, 2000.0000, 1500.0000, 550.0000, 1, 7, N'', CAST(N'2018-07-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'47693731-F213-4E60-97D6-115A7BD83259', 45, 50000.0000, 500.0000, 225.0000, 550.0000, 1, 4, N'', CAST(N'2018-09-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'480D88A9-B1E5-4A79-9D2C-C1050C6DA00A', 30, 79600.0000, 2000.0000, 750.0000, 750.0000, 1, 10, N'', CAST(N'2018-08-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4831A9DA-09BD-4AC3-8984-947F284CD4A8', 22, 43992.0000, 970.0000, 500.0000, 550.0000, 1, 6, N'', CAST(N'2017-03-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'48437CA9-988E-42EA-94F8-DC2D6DA48BA7', 59, 17200.0000, 500.0000, 750.0000, 150.0000, 0, 1, N'', CAST(N'2018-02-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'486C65E8-5CB9-4A33-9507-E2E5E3CB91CC', 51, 2040.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2016-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'49D19AE8-FBBF-496C-BC1E-9450544DD193', 27, 53200.0000, 2175.0000, 1500.0000, 750.0000, 0, 1, N'', CAST(N'2017-03-08' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4A40B2AA-A76B-4C08-A59B-19CDE0ED868C', 88, 7960.0000, 500.0000, 225.0000, 150.0000, 1, 2, N'', CAST(N'2016-08-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4A4A1D5E-1682-4ACA-A60D-0072693FE190', 21, 49200.0000, 1360.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2017-05-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4AFC6EDF-49EA-4D57-85AF-D60734328922', 45, 26760.0000, 1360.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2018-07-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4B47A26E-2723-4E06-A661-21271A6759D0', 26, 36000.0000, 1360.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2018-07-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4BA7F44F-422D-4AD2-84B3-2AE4F0028DB8', 56, 4800.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-03-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4BFD3782-0B79-4F4E-981A-96CEF827497F', 29, 49200.0000, 1360.0000, 750.0000, 550.0000, 1, 9, N'', CAST(N'2016-08-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4C00023A-47C5-4F98-A9B1-F222EDE2F563', 26, 36720.0000, 500.0000, 500.0000, 550.0000, 0, 9, N'', CAST(N'2016-08-20' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4C1762AE-F7FD-4F2C-875B-CAC022B0DF63', 88, 7992.0000, 500.0000, 750.0000, 150.0000, 0, 1, N'', CAST(N'2016-11-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4C57F13A-E21B-4AAC-9E9D-A219D4C691C6', 32, 64400.0000, 500.0000, 750.0000, 750.0000, 1, 3, N'', CAST(N'2015-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4EE854BF-A9DD-453B-815E-E0692A75A969', 25, 49240.0000, 660.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2018-08-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'4FFB74AD-C031-4BD9-9589-A87F462E6842', 24, 39664.0000, 660.0000, 500.0000, 550.0000, 1, 1, N'', CAST(N'2016-05-28' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'51451AC8-A35F-4597-B4BC-94E92C150C3D', 21, 37520.0000, 2000.0000, 750.0000, 550.0000, 1, 9, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'51784E0D-09DB-4A40-8E92-CB09A0DE4444', 47, 24400.0000, 1360.0000, 750.0000, 150.0000, 1, 10, N'', CAST(N'2018-09-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'518125AE-9A67-45A6-B3FD-557C785796FC', 11, 17720.0000, 1360.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2016-05-28' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'519C0ED1-7611-4CDC-8153-5C4B81A7FD0F', 82, 14800.0000, 970.0000, 1050.0000, 150.0000, 1, 8, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'521659A4-8FF2-441A-8D2E-C584D561301F', 13, 12520.0000, 500.0000, 225.0000, 150.0000, 1, 7, N'', CAST(N'2016-06-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'52CE8210-53B8-4C09-B821-6389A09733C5', 38, 68000.0000, 1490.0000, 1500.0000, 750.0000, 1, 1, N'', CAST(N'2016-12-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'52F665EA-2D6D-4ECA-8A14-553522A45B04', 13, 12760.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'532B985F-94AC-45DF-AE17-431FBCC66D0C', 21, 39600.0000, 970.0000, 750.0000, 550.0000, 1, 10, N'', CAST(N'2018-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'53C088BA-6E14-4758-826A-56FC57D3EEDA', 32, 52712.0000, 1490.0000, 1500.0000, 750.0000, 1, 4, N'', CAST(N'2016-02-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'54A66D7C-9E0B-40E9-B1B1-CA655F060CDE', 75, 23720.0000, 660.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2016-06-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'558620F5-B9E8-4FFF-8F73-A83FA9559C41', 11, 15600.0000, 660.0000, 0.0000, 150.0000, 1, 3, N'An absolute example of the pinnacle of British engineering. This is a wonderful piece of kit.', CAST(N'2015-01-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'5672C4AF-78E1-4BA4-B1D1-19383DCBE43C', 87, 10120.0000, 320.0000, 750.0000, 150.0000, 1, 6, N'', CAST(N'2015-08-24' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'57137FAF-3144-4CB7-BAAB-BA533A710E72', 74, 29200.0000, 500.0000, 500.0000, 550.0000, 1, 4, N'', CAST(N'2017-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'579AD98F-B7A5-456A-8F17-5B77A5479767', 9, 125200.0000, 9250.0000, 1500.0000, 1950.0000, 0, 7, N'', CAST(N'2017-02-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'57E2BA34-6397-448F-8A8C-1306CC922231', 25, 79600.0000, 2175.0000, 750.0000, 750.0000, 1, 6, N'', CAST(N'2017-06-09' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'589E8DB1-B2D4-4921-A11B-9A2A80EA73D9', 80, 236000.0000, 9250.0000, 3150.0000, 1950.0000, 1, 10, N'', CAST(N'2017-05-20' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'59650ADF-0886-43B4-B360-3A79E0CA327E', 63, 284000.0000, 9250.0000, 2200.0000, 1950.0000, 1, 2, N'', CAST(N'2018-02-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'5BE0098D-511F-4CF1-B87C-2CE2532F1B31', 26, 82000.0000, 2175.0000, 1500.0000, 750.0000, 1, 8, N'', CAST(N'2016-07-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'5CCF4F6B-43B3-4C7F-B674-6CAFD056E52A', 86, 10000.0000, 500.0000, 225.0000, 150.0000, 1, 10, N'', CAST(N'2015-12-22' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'5D11974B-326C-44C5-BA1D-57968CAB0DEE', 10, 204000.0000, 9250.0000, 1500.0000, 1950.0000, 1, 1, N'', CAST(N'2017-05-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'5D7C9AA9-F0C7-4F8E-8524-6481BE3CC62E', 25, 79600.0000, 1490.0000, 750.0000, 750.0000, 1, 7, N'', CAST(N'2018-12-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'5F898C04-BDFB-437B-A640-AE520F14031E', 91, 23200.0000, 500.0000, 750.0000, 150.0000, 1, 5, N'', CAST(N'2017-03-12' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'607CA291-F642-4CBD-967B-7A36DF45D150', 75, 21200.0000, 500.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2018-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6081DBE7-9AD6-4C64-A676-61D919E64979', 11, 15680.0000, 890.0000, 500.0000, 150.0000, 1, 2, N'', CAST(N'2015-04-04' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6120D922-6703-4267-969B-A9A9D3CAE787', 35, 95680.0000, 1490.0000, 2200.0000, 750.0000, 0, 6, N'', CAST(N'2016-10-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'614ED49B-6DA9-4BFE-9560-3DB52A6593CD', 72, 19600.0000, 1360.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2018-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'61B73BA2-9EA0-4DB9-8D89-6E8D2A5D32DA', 21, 50000.0000, 500.0000, 750.0000, 550.0000, 1, 3, N'', CAST(N'2017-12-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'61F8CF9A-F53C-4386-9BF8-578F54547CD2', 7, 215600.0000, 5500.0000, 1500.0000, 1950.0000, 1, 5, N'', CAST(N'2018-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6218BE0E-185B-4B12-8696-AA976EA81B29', 26, 82920.0000, 1490.0000, 750.0000, 750.0000, 1, 8, N'', CAST(N'2018-02-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'62611547-0F2D-41B1-BA32-E34AB67E10A3', 21, 26800.0000, 1360.0000, 750.0000, 550.0000, 0, 4, N'', CAST(N'2016-06-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'638FCDD5-AFFF-4DCA-AAEC-17F527FB9D02', 45, 26000.0000, 1360.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2017-05-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'643800B3-AD63-4B67-8ACF-672B91F04C57', 19, 244000.0000, 3950.0000, 3150.0000, 1950.0000, 0, 6, N'', CAST(N'2017-03-12' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'646C802F-C868-40F0-AF81-1BF387AFB82B', 74, 12480.0000, 1100.0000, 500.0000, 150.0000, 1, 9, N'', CAST(N'2015-10-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6556A473-CE18-428F-8F33-955E80FBA888', 87, 9200.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-12-15' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'658F0B06-2357-4DAA-803C-4DD7F569F270', 75, 23600.0000, 500.0000, 150.0000, 150.0000, 1, 1, N'', CAST(N'2017-06-22' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'65F89D52-9B2D-4363-8A07-4A5CE90197DB', 74, 28000.0000, 500.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2016-06-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'66C9034C-23A3-44F1-B946-2DDA65E684D8', 3, 164000.0000, 9250.0000, 750.0000, 1950.0000, 1, 1, N'', CAST(N'2016-07-07' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'66CCEBEA-00EA-44B3-BBFE-AC5EC2DE456D', 51, 10000.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2016-07-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'66D70810-1EE2-4BCA-B1B4-1E5B86C75002', 74, 15680.0000, 1360.0000, 150.0000, 150.0000, 1, 7, N'', CAST(N'2016-09-15' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6943ADF3-01A4-4281-B0CE-93384FE60418', 88, 10000.0000, 500.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2016-10-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'695E6D94-12E6-49BC-8E23-29AC3EB38D93', 71, 26800.0000, 2000.0000, 750.0000, 550.0000, 0, 1, N'', CAST(N'2018-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6A140D65-C354-48F6-A92E-40FF36CF1216', 54, 8400.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-07-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6A2699A6-ED27-42A9-B811-06D19EB5FA3C', 89, 3160.0000, 500.0000, 150.0000, 150.0000, 1, 1, N'', CAST(N'2016-09-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6AE8BA09-AE75-4CA4-81EE-6CD2B3947120', 23, 55600.0000, 2000.0000, 457.0000, 750.0000, 1, 2, N'', CAST(N'2018-10-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6AEAC4F1-4C81-4FAA-A97C-3DCC0E6CB5DE', 7, 200000.0000, 3950.0000, 3150.0000, 1950.0000, 1, 1, N'', CAST(N'2017-05-12' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6BF8C577-E615-4667-A48C-25E8D825AAC6', 11, 53200.0000, 2175.0000, 1500.0000, 750.0000, 1, 3, N'', CAST(N'2016-08-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6C76FDEC-683F-45E1-B027-20ACFD2F501C', 51, 4800.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2016-02-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'6FF2BEFA-53A6-40CB-A427-ECD8197D0CC5', 71, 24400.0000, 1360.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-10-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7005E3EC-5DBF-4409-8545-AC401CF204DB', 44, 340000.0000, 2000.0000, 2200.0000, 1950.0000, 1, 4, N'', CAST(N'2017-12-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'70C9BE5C-3CCA-4FB2-B4DE-E5F0A61BB84D', 11, 16760.0000, 1360.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2016-09-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'71C9EDC5-7897-4CCE-9B2F-5B04BEDC36D0', 98, 1996.0000, 500.0000, 750.0000, 150.0000, 1, 4, N'', CAST(N'2018-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'72443561-FAC4-4C25-B8FF-0C47361DDE2D', 12, 9200.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2015-02-14' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'72EF5AA5-997C-4AC0-A32E-591D1E009818', 28, 10000.0000, 500.0000, 750.0000, 150.0000, 1, 5, N'', CAST(N'2016-08-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7372D1C7-800F-4DE4-B3BC-FFA46CE77099', 78, 125200.0000, 2000.0000, 1500.0000, 1950.0000, 1, 2, N'', CAST(N'2017-03-08' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7392B5F6-783C-4D4B-B687-74A98411A7CB', 10, 316000.0000, 9250.0000, 2200.0000, 1950.0000, 1, 3, N'', CAST(N'2017-02-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'73FB2744-5AD9-42DC-A29C-B9B2FEF8353C', 45, 45512.0000, 1360.0000, 750.0000, 550.0000, 1, 10, N'', CAST(N'2018-09-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'740A7CB4-BF3F-46FD-98F3-D85748E5B9BA', 31, 79600.0000, 500.0000, 1050.0000, 750.0000, 1, 7, N'', CAST(N'2018-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7461FB42-ECE2-4C8C-BDBB-EF26AF3069F9', 87, 7600.0000, 500.0000, 750.0000, 150.0000, 1, 6, N'', CAST(N'2018-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'74DD8FE1-B205-4400-A951-1E54E7C22E40', 10, 292000.0000, 3950.0000, 750.0000, 1950.0000, 1, 1, N'', CAST(N'2017-02-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'74F717DA-B4DA-44F2-857A-F062AC60052E', 13, 15600.0000, 660.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-08-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'757E7DB7-3688-41FD-AFB6-E49CC56BCCD8', 25, 44000.0000, 1360.0000, 1500.0000, 550.0000, 1, 10, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'760F5558-3C9E-4B70-A412-0448B90B0D89', 96, 3160.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2017-06-23' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'76D2E902-DF33-4BE5-8181-B9DA01869131', 22, 45480.0000, 500.0000, 1500.0000, 550.0000, 1, 4, N'', CAST(N'2017-12-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7808CA65-E449-4280-A128-F5B581F47B8F', 45, 31600.0000, 500.0000, 750.0000, 550.0000, 1, 6, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'790E96BC-2F59-4B8F-9DE2-6BB65F92216B', 41, 96000.0000, 2175.0000, 750.0000, 750.0000, 1, 1, N'', CAST(N'2018-02-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'798C76AF-985B-4B9F-B24A-4B4311AE2A08', 65, 1080.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7A12CA8A-DC67-4A4F-B6F4-8B150873523A', 64, 52712.0000, 500.0000, 750.0000, 750.0000, 1, 2, N'', CAST(N'2017-05-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7BABE805-CE07-4C06-AAF1-6B5D83645CD8', 52, 10000.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-05-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7CEA62B1-9CBE-4E13-BECC-54E7EED128EF', 18, 20000.0000, 1360.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2016-12-07' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7F08368D-B6EA-4DFC-A1EC-B1A1B0221F04', 24, 180000.0000, 5500.0000, 3150.0000, 1950.0000, 1, 1, N'', CAST(N'2016-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7FCABEE5-E116-4AE3-B7B1-483C2F0D18CA', 85, 44000.0000, 500.0000, 500.0000, 550.0000, 1, 1, N'', CAST(N'2017-08-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'7FF88424-96A2-4149-ABF3-21AC9FBCDD4C', 57, 18000.0000, 1360.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-02-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'808F1237-9F5C-484F-8E14-63FF713A864D', 63, 284000.0000, 9250.0000, 7500.0000, 1950.0000, 1, 9, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'80B21E0F-66E3-4582-838A-D7EC560C7C0B', 87, 10056.0000, 2000.0000, 500.0000, 150.0000, 1, 1, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
GO
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'837C835A-5341-46C7-A282-14612449DDB0', 46, 18800.0000, 2000.0000, 500.0000, 150.0000, 1, 1, N'', CAST(N'2017-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'84BE4607-F8D7-49DA-8C27-D87FE529DF96', 89, 4544.0000, 500.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2017-02-28' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'86450D0C-EAA5-4B83-A9DA-55D742E9C2D8', 86, 9352.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2015-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'870C2B0A-A6AE-4F84-91EF-806C985A02E5', 11, 26880.0000, 500.0000, 500.0000, 550.0000, 1, 1, N'', CAST(N'2016-08-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'87A6B5EF-1E2B-49CA-85D7-263BC7E32189', 24, 35908.0000, 2000.0000, 750.0000, 550.0000, 1, 3, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'88975E00-70FD-44B6-9A1F-9E3B9CCE4382', 15, 14280.0000, 1360.0000, 150.0000, 150.0000, 1, 3, N'', CAST(N'2018-02-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'88AFBF67-13A6-4BC5-AE50-8C64F0F25453', 18, 176400.0000, 5500.0000, 3150.0000, 1950.0000, 0, 2, N'', CAST(N'2016-04-17' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'896B39D5-8040-4947-94D0-0234B4E78B23', 12, 17280.0000, 1360.0000, 750.0000, 150.0000, 0, 9, N'', CAST(N'2017-11-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'8979136A-B34A-4CD3-B119-A6B158D15FFF', 46, 26140.0000, 660.0000, 500.0000, 550.0000, 1, 5, N'', CAST(N'2017-08-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'89C3293F-F665-4E93-9929-315CBA3DD498', 36, 79160.0000, 1490.0000, 750.0000, 750.0000, 1, 2, N'', CAST(N'2018-02-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'8A275CE2-D116-49F7-8571-FD91F21ADAAA', 18, 188000.0000, 500.0000, 1500.0000, 1950.0000, 1, 1, N'', CAST(N'2017-10-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'8BB5BBD3-E03C-457C-86E2-67199FCB302A', 25, 62000.0000, 1490.0000, 1500.0000, 750.0000, 1, 4, N'', CAST(N'2017-05-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'8BB7FF86-2D80-40B7-B216-254C16843529', 87, 6800.0000, 500.0000, 750.0000, 150.0000, 1, 6, N'', CAST(N'2017-06-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'8BD326B3-8DE8-4DC9-9F96-FD132C5E1BF2', 2, 172000.0000, 750.0000, 150.0000, 1950.0000, 1, 9, N'', CAST(N'2015-04-04' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'8BED3FBE-29EA-48AF-A8CE-7770F51A548F', 22, 34000.0000, 2000.0000, 150.0000, 550.0000, 1, 1, N'', CAST(N'2017-12-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'8C1E8506-711C-442A-89A4-EDA28EB5B788', 13, 15600.0000, 500.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2016-08-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'8D9BF815-FAE4-47CE-ADBB-33339D382319', 89, 7912.0000, 500.0000, 225.0000, 150.0000, 1, 1, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'8F100F91-FE3C-4338-AA52-7BF61A540199', 98, 2800.0000, 500.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2017-02-28' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'8F278478-CA0B-4CDB-8F02-1A054AAE88A9', 77, 31600.0000, 2000.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2016-05-28' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'91B4067A-EBDE-4C1E-9370-3E894FD2FD7D', 73, 14280.0000, 970.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'91CF8133-EF19-4C92-BEFB-6A24FD85EF3A', 2, 156000.0000, 6000.0000, 1500.0000, 1950.0000, 1, 6, N'', CAST(N'2015-06-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'92D7DE8E-0BA7-4221-B2B1-A01F7FAFDD3E', 88, 5200.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-07-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'92FDF39E-6565-4B68-80BA-02ED30F00A7E', 26, 98800.0000, 2000.0000, 3150.0000, 750.0000, 1, 1, N'', CAST(N'2018-12-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'94FF5451-471C-4F17-BE27-BA55D3ECF5DC', 51, 6956.0000, 400.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2015-07-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'951195C4-7B69-418B-9AC2-61CCB7FE7C09', 13, 7160.0000, 500.0000, 750.0000, 150.0000, 1, 6, N'', CAST(N'2015-05-26' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'9555FF33-EE29-4A81-854A-69F6485BB216', 85, 20760.0000, 1360.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'955E8BC5-C31B-4EE5-A48D-76517063C334', 26, 45200.0000, 500.0000, 1500.0000, 550.0000, 1, 5, N'', CAST(N'2016-09-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'9743A284-D059-4EEB-98AB-ACDE88C1E9F5', 86, 5272.0000, 500.0000, 750.0000, 150.0000, 1, 5, N'', CAST(N'2017-06-08' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'97AFC7D5-91BF-47E3-8568-01B704E956C2', 90, 2800.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-09-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'98299E86-0B98-42D8-A549-37D89435B4E3', 3, 100760.0000, 9250.0000, 2200.0000, 1950.0000, 0, 1, N'', CAST(N'2017-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'9868BF47-F113-4721-BF95-26FEF8DD51D2', 1, 79600.0000, 500.0000, 1500.0000, 750.0000, 1, 10, N'', CAST(N'2018-03-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'98828061-0C7A-42C2-95D0-3095AD2EF0E4', 87, 7120.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2018-11-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'98A92DA3-2B99-4625-998B-2BB2FBB8F167', 31, 45560.0000, 2000.0000, 750.0000, 550.0000, 0, 8, N'', CAST(N'2016-01-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'98B3C1C2-7AE2-4A88-A3C9-484483C6EC66', 15, 7600.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-08-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'98C1E31A-4258-4F78-95D4-2365167E6F3F', 3, 135600.0000, 5500.0000, 2200.0000, 1950.0000, 1, 1, N'', CAST(N'2015-05-15' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'98C3863B-7A70-4FAD-B3C7-2B5702956E18', 23, 36000.0000, 500.0000, 150.0000, 550.0000, 1, 9, N'', CAST(N'2016-08-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'99DF9E69-9DAF-4D81-8334-D7058F1030E2', 99, 1560.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'9B8B87E1-7770-4136-8EB4-B7173C8783A6', 34, 79600.0000, 2175.0000, 750.0000, 750.0000, 1, 1, N'', CAST(N'2016-12-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'9BFDC1FA-8416-4F58-BE6C-3CCFA7A51860', 33, 79960.0000, 1490.0000, 750.0000, 750.0000, 1, 1, N'', CAST(N'2017-12-07' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'9CD9439F-E15F-4469-BE82-7A4041633A50', 26, 80000.0000, 500.0000, 750.0000, 750.0000, 1, 2, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'9CFAF367-ED4B-4A3E-8CB2-394F1F7A58C1', 28, 52400.0000, 500.0000, 750.0000, 750.0000, 1, 6, N'', CAST(N'2016-08-22' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'9D74A1A9-7342-4FEA-9C21-6AC4EFE92018', 87, 5240.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-09-18' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'9E98DDEF-D2A3-4BEC-99DD-BEFEFC11E5EE', 56, 2000.0000, 500.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'9FF62C70-89E4-4815-912F-C5DFBF8BDF0F', 22, 10000.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A0098927-0C7D-4CC8-8022-57A24433EF61', 95, 1000.0000, 500.0000, 225.0000, 150.0000, 1, 9, N'', CAST(N'2017-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A017241D-3A92-4EA7-A3EE-22FC119542F8', 36, 48400.0000, 500.0000, 1500.0000, 550.0000, 1, 7, N'', CAST(N'2016-12-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A08FCF25-5B27-4215-BF50-E94D0F7C8CD6', 56, 1800.0000, 500.0000, 750.0000, 150.0000, 1, 4, N'', CAST(N'2017-02-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A0F4D013-88EB-4692-B5EE-6BA800593036', 25, 44000.0000, 500.0000, 750.0000, 550.0000, 1, 2, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A1A4180E-B929-467D-91A6-73D2D0F34C65', 32, 63600.0000, 2000.0000, 1500.0000, 750.0000, 1, 2, N'', CAST(N'2016-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A2112C27-FE1F-48C5-A3BE-A019EE17DDD6', 17, 2920.0000, 500.0000, 750.0000, 150.0000, 1, 6, N'', CAST(N'2016-03-19' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A21CAFB1-7242-42D1-80AC-E5D26941E2BE', 13, 6000.0000, 500.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2017-12-20' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A2201698-CA26-428A-988F-ABB4A8893E21', 25, 45520.0000, 1360.0000, 500.0000, 550.0000, 1, 10, N'', CAST(N'2018-03-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A23F2E70-66D3-44A1-982C-ADE1ECA9CC30', 18, 204000.0000, 2000.0000, 150.0000, 1950.0000, 1, 1, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A2C3B95E-3005-4840-8CE3-A7BC5F9CFB5F', 3, 176000.0000, 5500.0000, 2200.0000, 1950.0000, 1, 2, N'', CAST(N'2015-01-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A326183E-7D45-4CF2-A353-7177A3EAB71F', 5, 156000.0000, 9250.0000, 750.0000, 1950.0000, 1, 3, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A3E788F8-889C-45E1-A610-881983869F6B', 69, 10000.0000, 500.0000, 457.0000, 150.0000, 1, 8, N'', CAST(N'2018-09-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A44EE0A0-B924-4B29-9C05-BA4BFADE084B', 32, 58000.0000, 1490.0000, 225.0000, 750.0000, 1, 3, N'', CAST(N'2018-08-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A48E5430-ACA4-41FD-BC6F-446BE2B46DF8', 29, 44000.0000, 500.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2017-01-21' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A4A2F089-526E-4C69-AACC-F58488B2E1C7', 25, 36400.0000, 500.0000, 750.0000, 550.0000, 0, 6, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A5BDB4E0-1544-449F-8596-D63D70548675', 54, 5200.0000, 500.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2017-05-15' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A6FCB276-6311-4B3E-9C99-23F197952F1C', 32, 44360.0000, 490.0000, 225.0000, 550.0000, 1, 9, N'', CAST(N'2015-09-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A7A80CA3-06D6-40AF-A558-09146A650340', 12, 31600.0000, 500.0000, 1500.0000, 550.0000, 1, 6, N'', CAST(N'2016-03-15' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A88F114F-3808-4B2D-92BE-BD43EEA71742', 22, 37520.0000, 500.0000, 1500.0000, 550.0000, 1, 10, N'', CAST(N'2017-12-07' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A926BB6C-FC26-4EBB-997E-2DF7EDC48E92', 3, 127600.0000, 2000.0000, 3150.0000, 1950.0000, 1, 10, N'', CAST(N'2015-12-24' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'A9D335E7-2389-4DE1-9484-DC4EC6BA81D4', 24, 44800.0000, 1360.0000, 500.0000, 550.0000, 1, 3, N'', CAST(N'2016-01-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'AAF61ECC-0BAC-4EAF-9E50-01749253329A', 15, 15600.0000, 1360.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2016-07-09' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'AB327B58-DD8E-46F9-BF23-DE6D1C0F7AD8', 28, 62800.0000, 500.0000, 750.0000, 750.0000, 1, 9, N'', CAST(N'2017-01-21' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'ACB85DBA-4914-4222-8D24-6D87B0DAE10A', 39, 71600.0000, 500.0000, 750.0000, 750.0000, 1, 3, N'', CAST(N'2017-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'AF51E444-D0BE-477F-8834-615824E0A89C', 13, 7840.0000, 500.0000, 750.0000, 150.0000, 1, 4, N'', CAST(N'2018-03-08' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'AFAF5C3E-80C9-4C5A-9D2A-CDD238E40264', 58, 4400.0000, 500.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2017-08-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B0559A26-5CE0-4C70-89EC-C73C0837B1E8', 25, 52360.0000, 500.0000, 1500.0000, 750.0000, 1, 1, N'', CAST(N'2017-12-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B09E4DDD-C2DD-45BE-B5F1-19FBF5970352', 85, 23600.0000, 1360.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2017-06-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B165CAEF-FF77-4E63-98C1-59D97F97E7C9', 11, 14000.0000, 2000.0000, 500.0000, 150.0000, 1, 3, N'', CAST(N'2016-04-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B1ABF9BD-1FBC-4E9A-BCCC-0B9AFEE5CFF1', 86, 5560.0000, 500.0000, 457.0000, 150.0000, 1, 9, N'', CAST(N'2018-06-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B1C3B95E-3005-4840-8CE3-A7BC5F9CFB3F', 2, 52000.0000, 2175.0000, 1500.0000, 750.0000, 1, 9, N'Superb Car! Wish I could afford a second one!', CAST(N'2015-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B25CB659-C0A2-451E-AADB-7A006414D6E1', 28, 44000.0000, 500.0000, 150.0000, 550.0000, 1, 10, N'', CAST(N'2016-09-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B2D76C72-FA30-40AE-9AB9-DFB47560348C', 46, 18800.0000, 1360.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B36188E4-3684-4337-91FE-84BB33736476', 2, 156000.0000, 3950.0000, 3150.0000, 1950.0000, 1, 1, N'', CAST(N'2016-07-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B4CC6E9A-8473-4A84-A811-73EABAFDC582', 52, 10000.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2017-06-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B503DD91-24FA-4F4A-AF49-1EB15347A33D', 21, 36760.0000, 500.0000, 150.0000, 550.0000, 1, 1, N'', CAST(N'2017-11-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B56F7C8F-0452-49C2-BEE2-C4C53BF38AD8', 25, 28760.0000, 500.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B5E7DD25-9D69-464C-9327-A8C5E706F534', 86, 11672.0000, 500.0000, 750.0000, 150.0000, 1, 10, N'', CAST(N'2016-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B607E8E1-5ECA-4DE2-BC46-909DBF9371D3', 75, 63600.0000, 2175.0000, 750.0000, 750.0000, 0, 1, N'', CAST(N'2017-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B760CF74-6468-4A0D-9485-36C7F7710EB0', 11, 36760.0000, 970.0000, 750.0000, 550.0000, 1, 7, N'', CAST(N'2016-09-16' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B76D6985-E106-4213-AACC-288088795C92', 13, 6000.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2016-09-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B822FA7C-5FA5-4F17-A3A6-7199CB00F7F8', 93, 31600.0000, 970.0000, 500.0000, 550.0000, 1, 1, N'', CAST(N'2017-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B84575EE-2E61-482C-8B72-5A6A90ADC3FE', 21, 39600.0000, 1360.0000, 500.0000, 550.0000, 1, 6, N'', CAST(N'2017-08-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B8498BEE-D1C5-4D93-981F-640031A3AE6C', 31, 71600.0000, 1490.0000, 750.0000, 750.0000, 1, 5, N'', CAST(N'2018-08-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B89AF48B-4BB9-409B-876B-941E51D19381', 98, 760.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'B8F3827A-5689-42B9-A1DE-26AFE7E2343E', 13, 10000.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2017-12-19' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BA123B46-B5DF-439B-9326-82174419FC14', 98, 1000.0000, 500.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BB4B9483-7AE3-47B4-A788-7EB5D12A7516', 33, 61200.0000, 2175.0000, 750.0000, 750.0000, 1, 4, N'', CAST(N'2016-10-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BBDFB7CF-FBA6-4463-BC1E-FE79522431EE', 87, 7960.0000, 500.0000, 750.0000, 150.0000, 1, 8, N'', CAST(N'2017-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BC4D491E-764B-48AE-BEDC-07DE123B7200', 32, 61200.0000, 2000.0000, 750.0000, 750.0000, 1, 8, N'', CAST(N'2016-08-20' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BCA945A6-8F87-4A00-93ED-6F2A08F8F923', 94, 1276.0000, 500.0000, 225.0000, 150.0000, 0, 9, N'', CAST(N'2017-12-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BCCB9C13-AEDA-4467-A014-48F0C7A0D6A4', 45, 18360.0000, 550.0000, 500.0000, 150.0000, 1, 9, N'', CAST(N'2015-06-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BD15948E-42F0-41BC-920C-343E0816B0AB', 70, 79600.0000, 1490.0000, 750.0000, 750.0000, 1, 7, N'', CAST(N'2017-05-21' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BDC5E621-D976-478D-A620-A0751FCBEF96', 74, 79600.0000, 2000.0000, 750.0000, 750.0000, 1, 4, N'', CAST(N'2016-08-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BEC34DF7-3E37-4322-A406-04BB5DF2A0FE', 14, 71600.0000, 1490.0000, 750.0000, 750.0000, 1, 1, N'', CAST(N'2018-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BEECAE2C-0A38-473D-893F-7C8917A779C2', 86, 4400.0000, 500.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2015-08-01' AS Date), CAST(N'12:55:00' AS Time))
GO
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BF9128E0-D61A-4214-8128-44A9880E20C2', 52, 4760.0000, 500.0000, 225.0000, 150.0000, 1, 1, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'BFC6861C-8D2E-40C8-A4F7-07F9E41056DC', 48, 10360.0000, 1360.0000, 750.0000, 150.0000, 1, 6, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C001858B-0B5D-4648-8F0D-80269964C921', 3, 125200.0000, 2200.0000, 3150.0000, 1950.0000, 1, 3, N'', CAST(N'2015-09-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C0E2E06D-AE60-4223-9E7C-B8387F2A4335', 14, 31600.0000, 500.0000, 500.0000, 550.0000, 1, 4, N'', CAST(N'2016-12-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C1459308-7EA5-4A2D-82BC-38079BB4049B', 22, 23600.0000, 500.0000, 750.0000, 150.0000, 1, 7, N'', CAST(N'2015-03-05' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C19B3F44-9EA7-49FF-953A-86BF48B55615', 24, 36760.0000, 500.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C1A812F1-5FA1-48BA-8787-16F2F0A704BC', 35, 63600.0000, 500.0000, 750.0000, 750.0000, 1, 9, N'', CAST(N'2017-04-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C1C9D15D-9E57-4D22-8997-D1333EEC6B13', 15, 15600.0000, 1360.0000, 750.0000, 150.0000, 0, 1, N'', CAST(N'2017-10-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C2623FF4-88AA-40E9-AF3B-8D009C25027B', 100, 760.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-12-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C4ACB04E-C8D4-465E-8D66-8BA033443D61', 12, 10000.0000, 500.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2017-05-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C7086D43-16DA-444F-A461-76DA9C479425', 5, 98800.0000, 2175.0000, 1500.0000, 750.0000, 1, 5, N'', CAST(N'2018-03-08' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C72ABA1C-D1FA-4A4B-9E16-9FE066D509BA', 12, 9592.0000, 500.0000, 750.0000, 150.0000, 1, 6, N'', CAST(N'2017-12-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C7569243-BDDB-4250-901E-EA6034824106', 1, 116000.0000, 3950.0000, 0.0000, 1950.0000, 1, 1, N'', CAST(N'2018-12-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C82D133F-3442-464B-A16A-D5419A9E1CDF', 3, 125560.0000, 2000.0000, 750.0000, 1950.0000, 1, 9, N'', CAST(N'2016-02-27' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C8C871B4-F08D-445A-BCD1-ACFEC616A113', 30, 45560.0000, 970.0000, 750.0000, 550.0000, 0, 9, N'', CAST(N'2018-08-31' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C8F49B5E-EDDB-42D0-BE0F-8C4181A6C81D', 94, 920.0000, 500.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2018-09-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'C9D8FCFE-4A88-479C-A2CA-E2474AF4D8DF', 52, 9200.0000, 500.0000, 150.0000, 150.0000, 1, 2, N'', CAST(N'2017-11-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'CD06C0DF-D3A2-4593-BF40-7DAE6B73F58C', 63, 236000.0000, 5500.0000, 750.0000, 1950.0000, 1, 1, N'', CAST(N'2017-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'CD2E20D3-1A10-4460-AC3B-FAC658F5F6F4', 24, 43600.0000, 970.0000, 289.0000, 550.0000, 1, 1, N'', CAST(N'2018-12-07' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'CDF97188-5367-4CCF-94DF-AC41093B9A48', 89, 6000.0000, 500.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2018-02-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'CE0A56A6-8218-4F4C-A0E2-63F3DC9E4AE6', 13, 7040.0000, 140.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2015-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'CEDFB8D2-BD98-4A08-BC46-406D23940527', 24, 60800.0000, 3250.0000, 750.0000, 750.0000, 0, 4, N'', CAST(N'2015-03-26' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'CF66838B-8A21-4084-9771-07A82CDBEBD8', 86, 7160.0000, 500.0000, 228.0000, 150.0000, 1, 5, N'', CAST(N'2018-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'CF9A23D7-6F8A-4CA6-A037-95EA7385B539', 45, 18000.0000, 500.0000, 750.0000, 150.0000, 1, 10, N'', CAST(N'2017-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'D05D6642-FABF-4F56-8A7E-D8C47A8AAB70', 52, 4520.0000, 500.0000, 150.0000, 150.0000, 1, 1, N'', CAST(N'2017-06-21' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'D0B8D738-B33D-4F7F-BA25-46EC06DEB8E2', 21, 79992.0000, 2000.0000, 750.0000, 750.0000, 1, 10, N'', CAST(N'2018-07-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'D0F51768-8924-4EF5-A3E9-B31AC7129BFB', 67, 20400.0000, 1360.0000, 750.0000, 150.0000, 1, 5, N'', CAST(N'2018-09-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'D231E90A-140A-4623-AA79-16970966DDF3', 56, 920.0000, 500.0000, 750.0000, 150.0000, 0, 1, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'D32D55B7-3546-4CCA-B4C0-DBA976572CA2', 91, 10360.0000, 1360.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2017-06-12' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'D3C15454-EF60-415F-860D-99D41F0A485F', 21, 36000.0000, 500.0000, 750.0000, 550.0000, 1, 7, N'', CAST(N'2017-05-23' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'D63C8CC9-DB19-4B9C-9C8E-6C6370812041', 23, 29200.0000, 1950.0000, 500.0000, 550.0000, 1, 2, N'', CAST(N'2015-04-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'D69ABA72-1B0D-4073-8B7D-D6CA65C4DDF7', 63, 268000.0000, 2000.0000, 2200.0000, 1950.0000, 0, 10, N'', CAST(N'2017-07-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'D7BF8DD9-1841-4FDE-8469-66B09FA30A74', 76, 7960.0000, 500.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2016-05-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'D93AF620-4F69-475A-98ED-829E0F8A3A40', 24, 36400.0000, 500.0000, 750.0000, 550.0000, 1, 9, N'', CAST(N'2016-06-04' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'DB2AF439-6293-4925-B905-1A57A0118B1A', 2, 200000.0000, 500.0000, 2200.0000, 1950.0000, 1, 1, N'', CAST(N'2017-09-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'DB742D0B-E562-41F4-AC94-8C58C2B0B69C', 46, 26880.0000, 2000.0000, 457.0000, 550.0000, 1, 5, N'', CAST(N'2018-09-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'DB8869B2-1EC0-48D5-9DA6-FDF1665155F0', 25, 37200.0000, 2000.0000, 750.0000, 550.0000, 1, 3, N'', CAST(N'2016-11-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'DD651733-FE5C-46B9-AC97-727F8CD170A6', 89, 7600.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-11-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'DD6A0129-40CF-449F-8427-1C97BF14B2BD', 73, 28200.0000, 500.0000, 750.0000, 550.0000, 1, 3, N'', CAST(N'2016-09-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'DD8D9340-29B0-4E0D-89B3-BD33B70E087D', 89, 7080.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2017-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'DE3096AD-76F9-4AAF-B2E1-49FA8E2C377F', 2, 176000.0000, 1000.0000, 3150.0000, 1950.0000, 1, 1, N'', CAST(N'2015-03-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'DE44149E-1225-4B7C-97E5-8089A4F21C1C', 99, 1000.0000, 500.0000, 750.0000, 150.0000, 1, 10, N'', CAST(N'2017-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'DF5411FC-24C5-4CAB-89DF-54741054D8DD', 22, 29200.0000, 500.0000, 500.0000, 550.0000, 1, 1, N'', CAST(N'2017-05-24' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E00D10E9-7F7F-49A9-BDC0-4C2611580B4E', 14, 53200.0000, 1490.0000, 750.0000, 750.0000, 1, 1, N'', CAST(N'2016-07-08' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E010830C-E636-49F7-ABA6-2DFDF502A587', 96, 1800.0000, 500.0000, 750.0000, 150.0000, 0, 4, N'', CAST(N'2018-02-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E0760EF4-3939-4063-821F-5923EF8760B4', 60, 26800.0000, 500.0000, 750.0000, 550.0000, 1, 1, N'', CAST(N'2017-05-22' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E1350CBE-B916-4F18-B5BF-F7D53A31205A', 12, 7960.0000, 500.0000, 150.0000, 150.0000, 1, 1, N'', CAST(N'2016-09-17' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E166158C-F3BA-47DE-A499-A703210CF128', 75, 23600.0000, 660.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E264504D-3451-4670-AAB8-E4C66F2387B0', 13, 10000.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2015-12-23' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E267042F-449B-4CA9-8BDE-5C197DC8A647', 25, 45200.0000, 660.0000, 750.0000, 550.0000, 0, 10, N'', CAST(N'2017-03-08' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E368D03E-239C-499F-A41A-CC4D2AE1AFF8', 24, 44000.0000, 660.0000, 500.0000, 550.0000, 1, 10, N'', CAST(N'2016-11-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E519F3CF-BE4B-44CF-98D5-80EC33EC6CE1', 86, 9272.0000, 500.0000, 250.0000, 150.0000, 1, 1, N'', CAST(N'2018-11-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E59BFE04-E70B-4BAC-9269-ADC311ED0032', 48, 18080.0000, 1360.0000, 500.0000, 150.0000, 1, 1, N'', CAST(N'2017-08-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E66B3E09-F02D-484A-8B9F-A8CD7833CD6B', 98, 1920.0000, 500.0000, 750.0000, 150.0000, 1, 4, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E68BB825-0487-44CA-AE6C-7C650F81E22B', 98, 1880.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E6923E8C-C07A-430F-B80D-7D5F329055AB', 86, 6800.0000, 500.0000, 750.0000, 150.0000, 1, 9, N'', CAST(N'2018-11-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E6E23C74-39AF-4A44-BAAE-7CD48B0F6161', 25, 63600.0000, 1490.0000, 750.0000, 750.0000, 1, 9, N'', CAST(N'2016-08-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E6E6270A-60B0-4817-AA57-17F26B2B8DAF', 23, 39600.0000, 2500.0000, 1500.0000, 550.0000, 1, 1, N'FAbulous motor!', CAST(N'2015-03-15' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E869D5E4-CAC0-48ED-8961-03D0405EA2FD', 28, 45560.0000, 1360.0000, 750.0000, 550.0000, 1, 7, N'', CAST(N'2017-01-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E8FF8444-2B18-45A0-84AC-F776755E06ED', 68, 31600.0000, 970.0000, 750.0000, 550.0000, 1, 7, N'', CAST(N'2018-09-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'E9FE6FE1-1957-4BD4-8643-D8326BC43255', 46, 18760.0000, 500.0000, 750.0000, 150.0000, 1, 6, N'', CAST(N'2017-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'EA1B19C6-631A-4683-9E29-1BC601FC850E', 86, 7992.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2018-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'EB59DB36-5E67-4AF1-AE8A-46E8999EEF45', 87, 6840.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2017-02-28' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'EBE7AD85-117F-4781-A5E5-13920EE2B546', 19, 196000.0000, 500.0000, 3150.0000, 1950.0000, 1, 3, N'', CAST(N'2017-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'EC25FA02-2692-42E1-85A0-71F0775C8F8A', 23, 45512.0000, 2000.0000, 750.0000, 550.0000, 1, 10, N'', CAST(N'2016-11-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'ECC534C7-B2DD-425C-98D3-98D2332B373C', 100, 760.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2017-05-19' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'ECD53BA8-3C63-4938-92C4-C955AEA6C4BC', 91, 18800.0000, 1360.0000, 500.0000, 150.0000, 1, 1, N'', CAST(N'2017-11-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'EDCCE461-5DA8-4E2E-8F08-798431841575', 24, 36000.0000, 1250.0000, 750.0000, 550.0000, 1, 7, N'', CAST(N'2015-04-30' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'EE92EE4A-977E-4BC6-BEFF-512CC468944C', 33, 45440.0000, 500.0000, 750.0000, 550.0000, 1, 10, N'', CAST(N'2018-08-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'EF8621F7-41EB-4C2D-ADBD-D4287083D41F', 26, 58000.0000, 2175.0000, 1500.0000, 750.0000, 1, 7, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F0235F1B-636C-4E8B-8617-927F45DA97DB', 76, 20400.0000, 660.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2016-08-03' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F075AC9E-1124-4194-A05F-683F9D553335', 54, 14800.0000, 500.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2018-05-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F166C930-3101-42E9-8AE8-189F47FA0014', 54, 14360.0000, 2000.0000, 1050.0000, 150.0000, 1, 7, N'', CAST(N'2018-12-16' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F187F74F-3909-4291-A15B-F793AB88DE3B', 5, 156000.0000, 5500.0000, 1500.0000, 1950.0000, 1, 1, N'', CAST(N'2017-01-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F1997A16-CB98-4D67-BCA3-DD22D990D1D2', 92, 1800.0000, 500.0000, 750.0000, 150.0000, 1, 3, N'', CAST(N'2017-10-29' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F287EE1D-48C6-4E75-9595-E0AE235FBEA8', 86, 7600.0000, 500.0000, 330.0000, 150.0000, 1, 6, N'', CAST(N'2018-11-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F2DE934E-62C3-45F6-AFA8-2FFA963F5360', 11, 18360.0000, 500.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2015-11-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F3A2712D-20CA-495D-9F6A-8A4CA195248D', 13, 6800.0000, 250.0000, 225.0000, 150.0000, 1, 2, N'', CAST(N'2015-04-15' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F4443E46-3EAC-4C10-902C-71257DEEE229', 21, 31600.0000, 970.0000, 750.0000, 550.0000, 1, 2, N'', CAST(N'2018-08-02' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F556C096-7EFE-4827-9AFF-2FD0416B1C9B', 20, 116000.0000, 9250.0000, 1500.0000, 1950.0000, 1, 1, N'', CAST(N'2018-03-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F5F70D13-C9BD-48E6-A903-ABC5F289A758', 69, 18120.0000, 500.0000, 750.0000, 150.0000, 1, 2, N'', CAST(N'2018-02-10' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F6C384B6-B768-4031-AC12-81C8CE37049E', 32, 45560.0000, 2000.0000, 500.0000, 550.0000, 1, 7, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F810FAB0-6BAE-4AC0-BDBC-F14A71AC35B9', 26, 100400.0000, 3950.0000, 1500.0000, 1950.0000, 1, 9, N'', CAST(N'2016-12-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F8B48177-FB78-4245-935F-FB6FBCE8D870', 8, 204760.0000, 5500.0000, 750.0000, 1950.0000, 1, 2, N'', CAST(N'2017-05-11' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F95052DB-3E09-4070-ADA4-5114CCAD96C0', 12, 7160.0000, 360.0000, 750.0000, 150.0000, 1, 1, N'', CAST(N'2015-09-28' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'F9EF8BCC-5744-4EBC-91AD-739775C597D9', 85, 36760.0000, 660.0000, 1500.0000, 550.0000, 1, 5, N'', CAST(N'2018-01-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'FAB39B43-A811-4410-A69A-707C35C767E7', 15, 12760.0000, 500.0000, 500.0000, 150.0000, 0, 10, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'FBF39066-2C13-469D-B913-EBCF22CCFD63', 4, 156000.0000, 2000.0000, 2200.0000, 1950.0000, 0, 1, N'', CAST(N'2018-04-01' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'FCB80D65-7D65-41E4-9081-6C92D0C7F1F5', 63, 276000.0000, 5500.0000, 457.0000, 1950.0000, 1, 9, N'', CAST(N'2018-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'FDCDF3F0-F0AD-4E7F-8793-8B146700D035', 76, 15600.0000, 290.0000, 750.0000, 150.0000, 1, 10, N'', CAST(N'2015-07-25' AS Date), CAST(N'12:55:00' AS Time))
INSERT [Data].[Stock] ([StockCode], [ModelID], [Cost], [RepairsCost], [PartsCost], [TransportInCost], [IsRHD], [ColorID], [BuyerComments], [DateBought], [TimeBought]) VALUES (N'FF62897D-E06C-4BC1-B5EA-E6BE415B0CD1', 8, 156000.0000, 3950.0000, 1500.0000, 1950.0000, 1, 6, N'', CAST(N'2018-05-01' AS Date), CAST(N'12:55:00' AS Time))
GO
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulia', 20000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR7', 15600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'924', 6040.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulietta', 17200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 66072.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Phantom', 146000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 47600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 4400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB5', 34360.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Wraith', 130000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 40960.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'1750', 2860.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'GT6', 7400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Mondial', 124000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulia', 14000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bugatti', N'Veyron', 176400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 100000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Trabant', N'500', 2000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 10200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'959', 44480.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Flying Spur', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Noble', N'M600', 36000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 55600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'Mark X', 69200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 4544.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lamborghini', N'Diabolo', 135600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 12600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'360', 102800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Mondial', 82360.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Austin', N'Lichfield', 5200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Flying Spur', 73720.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK120', 54800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'355', 124000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 55120.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Reliant', N'Robin', 1200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vantage', 100000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 90872.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 36760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Continental', 62000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 98872.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Delahaye', N'145', 23600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XJ12', 2860.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 39600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Citroen', N'Traaction Avant', 20000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Silver Seraph', 111600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XJS', 18080.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK120', 47200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Trabant', N'600', 1560.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Noble', N'M600', 19600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulietta', 4552.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'F50', 248000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Testarossa', 132000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 15960.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB5', 31600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Brooklands', 151600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Wraith', 132000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'360', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulia', 5560.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Silver Seraph', 79960.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulietta', 9240.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulia', 8400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Austin', N'Lichfield', 18880.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 42000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 43000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'360', 108000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 10120.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK120', 45512.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vantage', 82000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Silver Shadow', 108000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Rapide', 69200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB4', 45560.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'Mark X', 44000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Citroen', N'Rosalie', 4400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vantage', 39600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Rapide', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Arnage', 68520.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'Mark V', 17880.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK150', 18392.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Citroen', N'Rosalie', 792.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 45200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'500SL', 36000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR7', 7960.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 44800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 36480.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lagonda', N'V12', 49200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 38280.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK120', 22312.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Spider', 12440.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Citroen', N'Rosalie', 1880.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Ghost', 45592.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 36000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vanquish', 45592.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Trabant', N'600', 1272.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Noble', N'M14', 4400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Phantom', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Noble', N'M14', 12480.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 44000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR6', 12760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK120', 17240.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR6', 10000.0000)
GO
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'Boxster', 18000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 23600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'924', 13200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'1750', 7960.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'Mark V', 20760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lamborghini', N'Countach', 98800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'205', 760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vanquish', 45200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vanquish', 46080.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'280SL', 50000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Mulsanne', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB4', 43992.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'BMW', N'Alpina', 17200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulia', 2040.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vantage', 53200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR6', 7960.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 49200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'280SL', 26760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 36000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Austin', N'Princess', 4800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Rapide', 49200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 36720.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR6', 7992.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Flying Spur', 64400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 49240.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 39664.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 37520.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'500SL', 24400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 17720.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Morgan', N'Plus 4', 14800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 12520.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Silver Shadow', 68000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 12760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 39600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Flying Spur', 52712.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK150', 23720.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 15600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 10120.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK120', 29200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'360', 125200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'McLaren', N'P1', 236000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bugatti', N'57C', 284000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 82000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Enzo', 204000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'Roadster', 23200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK150', 21200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 15680.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Phantom', 95680.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'Mark X', 19600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 50000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'F40', 215600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 82920.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 26800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'280SL', 26000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lamborghini', N'Jarama', 244000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK120', 12480.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 9200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK150', 23600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK120', 28000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'355', 164000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulia', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK120', 15680.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR6', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'Mark V', 26800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulietta', 8400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR7', 3160.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB5', 55600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'F40', 200000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 53200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulia', 4800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'Mark V', 24400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Maybach', N'Exelero', 340000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 16760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'404', 1996.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'924', 9200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vanquish', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lagonda', N'V12', 125200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Enzo', 316000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'280SL', 45512.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Continental', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 7600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Enzo', 292000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 15600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 44000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'205', 3160.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB4', 45480.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'280SL', 31600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Silver Seraph', 96000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Citroen', N'Rosalie', 1080.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Citroen', N'Torpedo', 52712.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Spider', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lamborghini', N'Diabolo', 20000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 180000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Noble', N'M600', 44000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Austin', N'Cambridge', 18000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 10056.0000)
GO
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'350SL', 18800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR7', 4544.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 9352.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 26880.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 35908.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'928', 14280.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lamborghini', N'Diabolo', 176400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'924', 17280.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'350SL', 26140.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Ghost', 79160.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lamborghini', N'Diabolo', 188000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 62000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 6800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Testarossa', 172000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB4', 34000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 15600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR7', 7912.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'404', 2800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'E-Type', 31600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XJ12', 14280.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Testarossa', 156000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR6', 5200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 98800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulia', 6956.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 7160.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Noble', N'M600', 20760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 45200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 5272.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'GT6', 2800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'355', 100760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Daytona', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 7120.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Continental', 45560.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'928', 7600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'355', 135600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB5', 36000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'203', 1560.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Brooklands', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Arnage', 79960.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 80000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vanquish', 52400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 5240.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Austin', N'Princess', 2000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB4', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Trabant', N'600', 1000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Ghost', 48400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Austin', N'Princess', 1800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 44000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Flying Spur', 63600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lamborghini', N'Countach', 2920.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 6000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 45520.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lamborghini', N'Diabolo', 204000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'355', 176000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Dino', 156000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Delahaye', N'175', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Flying Spur', 58000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Rapide', 44000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 36400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulietta', 5200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Flying Spur', 44360.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'924', 31600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB4', 37520.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'355', 127600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 44800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'928', 15600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vanquish', 62800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Corniche', 71600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 7840.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'BMW', N'Isetta', 4400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 52360.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Noble', N'M600', 23600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 14000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 5560.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Testarossa', 52000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vanquish', 44000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Spider', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 36760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 28760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 11672.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK150', 63600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 36760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR3A', 31600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 39600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Continental', 71600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'404', 760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'404', 1000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Arnage', 61200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 7960.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Flying Spur', 61200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Trabant', N'500', 1276.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'280SL', 18360.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Delorean', N'DMC 12', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK120', 79600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'959', 71600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 4400.0000)
GO
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Spider', 4760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'250SL', 10360.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'355', 125200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'959', 31600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB4', 23600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 36760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Rolls Royce', N'Phantom', 63600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'928', 15600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Reliant', N'Robin', 760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'924', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Dino', 98800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'924', 9592.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Daytona', 116000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'355', 125560.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Mulsanne', 45560.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Trabant', N'500', 920.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Spider', 9200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bugatti', N'57C', 236000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 43600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR7', 6000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 7040.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 60800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 7160.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'280SL', 18000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Spider', 4520.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 79992.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Delahaye', N'135', 20400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Austin', N'Princess', 920.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'Roadster', 10360.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 36000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB5', 29200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bugatti', N'57C', 268000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XJS', 7960.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 36400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Testarossa', 200000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'350SL', 26880.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 37200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR7', 7600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XJ12', 28200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR7', 7080.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Testarossa', 176000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'203', 1000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB4', 29200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'959', 53200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'205', 1800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'BMW', N'E30', 26800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'924', 7960.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XK150', 23600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 10000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 45200.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 44000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 9272.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'250SL', 18080.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'404', 1920.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Peugeot', N'404', 1880.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 6800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB9', 63600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB5', 39600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Vanquish', 45560.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Delahaye', N'145', 31600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Mercedes', N'350SL', 18760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 7992.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR5', 6840.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lamborghini', N'Jarama', 196000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB5', 45512.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'Roadster', 18800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB6', 36000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Arnage', 45440.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 58000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XJS', 20400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulietta', 14800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Alfa Romeo', N'Giulietta', 14360.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'Dino', 156000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'Stag', 1800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Triumph', N'TR4', 7600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'911', 18360.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'944', 6800.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'DB2', 31600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Lamborghini', N'400GT', 116000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Delahaye', N'175', 18120.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bentley', N'Flying Spur', 45560.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Aston Martin', N'Virage', 100400.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'F50', 204760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'924', 7160.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Noble', N'M600', 36760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Porsche', N'928', 12760.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'308', 156000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Bugatti', N'57C', 276000.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Jaguar', N'XJS', 15600.0000)
INSERT [Output].[StockPrices] ([MakeName], [ModelName], [Cost]) VALUES (N'Ferrari', N'F50', 156000.0000)
GO
SET IDENTITY_INSERT [Reference].[Budget] ON 

INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (1, 100000.0000, 2015, 1, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (2, 100000.0000, 2015, 2, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (3, 125000.0000, 2015, 3, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (4, 125000.0000, 2015, 4, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (5, 200000.0000, 2015, 5, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (6, 150000.0000, 2015, 6, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (7, 10000.0000, 2015, 7, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (8, 50000.0000, 2015, 8, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (9, 50000.0000, 2015, 9, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (10, 50000.0000, 2015, 10, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (11, 50000.0000, 2015, 11, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (12, 50000.0000, 2015, 12, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (13, 200000.0000, 2016, 1, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (14, 200000.0000, 2016, 2, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (15, 200000.0000, 2016, 4, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (16, 200000.0000, 2016, 5, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (17, 200000.0000, 2016, 6, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (18, 300000.0000, 2016, 7, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (19, 300000.0000, 2016, 8, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (20, 300000.0000, 2016, 9, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (21, 300000.0000, 2016, 10, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (22, 300000.0000, 2016, 11, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (23, 450000.0000, 2016, 12, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (24, 450000.0000, 2017, 1, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (25, 450000.0000, 2017, 2, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (26, 600000.0000, 2017, 3, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (27, 600000.0000, 2017, 4, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (28, 1000000.0000, 2017, 5, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (29, 600000.0000, 2017, 6, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (30, 600000.0000, 2017, 7, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (31, 150000.0000, 2017, 8, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (32, 450000.0000, 2017, 9, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (33, 250000.0000, 2017, 10, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (34, 600000.0000, 2017, 11, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (35, 300000.0000, 2017, 12, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (36, 450000.0000, 2018, 1, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (37, 450000.0000, 2018, 2, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (38, 450000.0000, 2018, 3, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (39, 500000.0000, 2018, 4, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (40, 500000.0000, 2018, 5, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (41, 500000.0000, 2018, 6, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (42, 500000.0000, 2018, 7, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (43, 500000.0000, 2018, 8, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (44, 500000.0000, 2018, 9, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (45, 700000.0000, 2018, 10, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (46, 250000.0000, 2018, 11, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (47, 500000.0000, 2018, 12, N'TotalSales', N'Sales')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (48, 250000.0000, 2015, 1, N'Black', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (49, 250000.0000, 2015, 1, N'Blue', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (50, 111500.0000, 2015, 1, N'British Racing Green', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (51, 132000.0000, 2015, 1, N'Canary Yellow', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (52, 250000.0000, 2015, 1, N'Green', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (53, 50000.0000, 2015, 1, N'Night Blue', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (54, 250000.0000, 2015, 1, N'Red', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (55, 50000.0000, 2015, 1, N'Silver', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (56, 250000.0000, 2016, 1, N'Black', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (57, 250000.0000, 2016, 1, N'Blue', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (58, 50000.0000, 2016, 1, N'British Racing Green', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (59, 50000.0000, 2016, 1, N'Canary Yellow', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (60, 50000.0000, 2016, 1, N'Dark Purple', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (61, 250000.0000, 2016, 1, N'Green', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (62, 400000.0000, 2016, 1, N'Night Blue', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (63, 50000.0000, 2016, 1, N'Pink', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (64, 500000.0000, 2016, 1, N'Red', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (65, 450000.0000, 2016, 1, N'Silver', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (66, 500000.0000, 2017, 1, N'Black', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (67, 500000.0000, 2017, 1, N'Blue', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (68, 869990.0000, 2017, 1, N'British Racing Green', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (69, 50000.0000, 2017, 1, N'Canary Yellow', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (70, 50000.0000, 2017, 1, N'Dark Purple', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (71, 500000.0000, 2017, 1, N'Green', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (72, 500000.0000, 2017, 1, N'Night Blue', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (73, 50000.0000, 2017, 1, N'Pink', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (74, 500000.0000, 2017, 1, N'Red', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (75, 800000.0000, 2017, 1, N'Silver', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (76, 500000.0000, 2018, 1, N'Black', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (77, 500000.0000, 2018, 1, N'Blue', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (78, 500000.0000, 2018, 1, N'British Racing Green', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (79, 50000.0000, 2018, 1, N'Canary Yellow', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (80, 500000.0000, 2018, 1, N'Dark Purple', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (81, 500000.0000, 2018, 1, N'Green', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (82, 500000.0000, 2018, 1, N'Night Blue', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (83, 50000.0000, 2018, 1, N'Pink', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (84, 50000.0000, 2018, 1, N'Red', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (85, 50000.0000, 2018, 1, N'Silver', N'Color')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (86, 100000.0000, 2016, 8, N'Belgium', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (87, 15500.0000, 2017, 2, N'Belgium', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (88, 100000.0000, 2017, 3, N'Belgium', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (89, 45950.0000, 2017, 7, N'Belgium', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (90, 34000.0000, 2017, 11, N'Belgium', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (91, 950.0000, 2018, 1, N'Belgium', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (92, 6950.0000, 2018, 6, N'Belgium', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (93, 19950.0000, 2015, 2, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (94, 19600.0000, 2015, 4, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (95, 8950.0000, 2015, 5, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (96, 22950.0000, 2015, 6, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (97, 75500.0000, 2015, 7, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (98, 2550.0000, 2016, 1, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (99, 39500.0000, 2016, 2, N'France', N'Country')
GO
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (100, 49580.0000, 2016, 5, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (101, 180150.0000, 2016, 6, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (102, 231500.0000, 2016, 8, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (103, 51065.0000, 2016, 9, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (104, 100000.0000, 2016, 12, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (105, 80250.0000, 2017, 1, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (106, 100000.0000, 2017, 2, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (107, 109150.0000, 2017, 3, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (108, 360000.0000, 2017, 4, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (109, 698450.0000, 2017, 5, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (110, 29500.0000, 2017, 6, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (111, 291450.0000, 2017, 7, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (112, 77675.0000, 2017, 8, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (113, 100000.0000, 2017, 9, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (114, 100000.0000, 2017, 10, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (115, 62700.0000, 2017, 11, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (116, 7550.0000, 2017, 12, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (117, 250000.0000, 2018, 1, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (118, 250000.0000, 2018, 2, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (119, 250000.0000, 2018, 3, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (120, 9950.0000, 2018, 4, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (121, 359000.0000, 2018, 5, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (122, 345000.0000, 2018, 7, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (123, 250000.0000, 2018, 9, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (124, 154450.0000, 2018, 10, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (125, 8900.0000, 2018, 11, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (126, 5500.0000, 2018, 12, N'France', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (127, 11500.0000, 2015, 2, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (128, 71890.0000, 2016, 2, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (129, 99500.0000, 2016, 4, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (130, 81000.0000, 2016, 8, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (131, 25000.0000, 2016, 12, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (132, 250000.0000, 2017, 3, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (133, 45000.0000, 2017, 5, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (134, 99500.0000, 2017, 6, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (135, 23600.0000, 2017, 12, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (136, 11550.0000, 2018, 1, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (137, 99500.0000, 2018, 8, N'Germany', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (138, 14590.0000, 2016, 7, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (139, 54950.0000, 2016, 8, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (140, 12500.0000, 2016, 10, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (141, 99500.0000, 2016, 12, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (142, 147500.0000, 2017, 5, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (143, 44500.0000, 2017, 6, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (144, 250000.0000, 2017, 11, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (145, 46900.0000, 2017, 12, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (146, 195000.0000, 2018, 4, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (147, 135000.0000, 2018, 5, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (148, 100000.0000, 2018, 7, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (149, 12500.0000, 2018, 9, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (150, 123500.0000, 2018, 12, N'Italy', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (151, 79500.0000, 2016, 7, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (152, 12750.0000, 2016, 8, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (153, 68900.0000, 2016, 9, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (154, 132100.0000, 2016, 10, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (155, 39500.0000, 2016, 12, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (156, 29500.0000, 2017, 4, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (157, 78390.0000, 2017, 5, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (158, 12950.0000, 2017, 6, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (159, 250000.0000, 2017, 9, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (160, 89000.0000, 2017, 11, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (161, 111940.0000, 2017, 12, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (162, 45950.0000, 2018, 1, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (163, 373690.0000, 2018, 3, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (164, 114400.0000, 2018, 4, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (165, 128500.0000, 2018, 7, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (166, 57600.0000, 2018, 8, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (167, 56890.0000, 2018, 9, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (168, 11500.0000, 2018, 12, N'Spain', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (169, 285000.0000, 2015, 1, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (170, 19500.0000, 2015, 2, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (171, 155000.0000, 2015, 3, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (172, 89000.0000, 2015, 4, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (173, 364500.0000, 2015, 5, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (174, 31685.0000, 2015, 7, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (175, 37200.0000, 2015, 9, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (176, 22600.0000, 2015, 10, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (177, 22950.0000, 2015, 11, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (178, 69500.0000, 2015, 12, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (179, 263950.0000, 2016, 1, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (180, 59650.0000, 2016, 2, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (181, 141750.0000, 2016, 4, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (182, 49450.0000, 2016, 5, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (183, 57150.0000, 2016, 6, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (184, 501650.0000, 2016, 7, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (185, 354780.0000, 2016, 8, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (186, 447150.0000, 2016, 9, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (187, 172100.0000, 2016, 10, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (188, 111890.0000, 2016, 11, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (189, 414490.0000, 2016, 12, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (190, 457850.0000, 2017, 1, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (191, 8750.0000, 2017, 2, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (192, 557620.0000, 2017, 3, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (193, 295000.0000, 2017, 4, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (194, 606700.0000, 2017, 5, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (195, 83150.0000, 2017, 6, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (196, 524000.0000, 2017, 7, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (197, 60500.0000, 2017, 8, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (198, 19500.0000, 2017, 10, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (199, 25000.0000, 2017, 11, N'United Kingdom', N'Country')
GO
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (200, 146000.0000, 2017, 12, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (201, 295420.0000, 2018, 1, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (202, 476450.0000, 2018, 2, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (203, 9800.0000, 2018, 3, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (204, 653785.0000, 2018, 4, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (205, 66125.0000, 2018, 5, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (206, 150500.0000, 2018, 6, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (207, 318290.0000, 2018, 7, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (208, 258550.0000, 2018, 8, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (209, 189450.0000, 2018, 9, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (210, 52950.0000, 2018, 10, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (211, 8500.0000, 2018, 11, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (212, 301540.0000, 2018, 12, N'United Kingdom', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (213, 36500.0000, 2015, 4, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (214, 5500.0000, 2015, 8, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (215, 123590.0000, 2015, 10, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (216, 172150.0000, 2016, 1, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (217, 17500.0000, 2016, 4, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (218, 12500.0000, 2016, 7, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (219, 92150.0000, 2016, 8, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (220, 21500.0000, 2017, 2, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (221, 250000.0000, 2017, 5, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (222, 22600.0000, 2017, 8, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (223, 65250.0000, 2017, 9, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (224, 12500.0000, 2017, 12, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (225, 65450.0000, 2018, 1, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (226, 182500.0000, 2018, 2, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (227, 56900.0000, 2018, 3, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (228, 97000.0000, 2018, 4, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (229, 195000.0000, 2018, 5, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (230, 33500.0000, 2018, 6, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (231, 55000.0000, 2018, 7, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (232, 158590.0000, 2018, 8, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (233, 89500.0000, 2018, 9, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (234, 152990.0000, 2018, 10, N'United States', N'Country')
INSERT [Reference].[Budget] ([BudgetKey], [BudgetValue], [Year], [Month], [BudgetDetail], [BudgetElement]) VALUES (235, 77450.0000, 2018, 12, N'United States', N'Country')
SET IDENTITY_INSERT [Reference].[Budget] OFF
GO
SET IDENTITY_INSERT [Reference].[Color] ON 

INSERT [Reference].[Color] ([ColorID], [Color]) VALUES (1, N'BLACK')
INSERT [Reference].[Color] ([ColorID], [Color]) VALUES (2, N'BLUE')
INSERT [Reference].[Color] ([ColorID], [Color]) VALUES (3, N'BRITISH RACING GREEN')
INSERT [Reference].[Color] ([ColorID], [Color]) VALUES (4, N'CANARY YELLOW')
INSERT [Reference].[Color] ([ColorID], [Color]) VALUES (5, N'DARK PURPLE')
INSERT [Reference].[Color] ([ColorID], [Color]) VALUES (6, N'GREEN')
INSERT [Reference].[Color] ([ColorID], [Color]) VALUES (7, N'NIGHT BLUE')
INSERT [Reference].[Color] ([ColorID], [Color]) VALUES (8, N'PINK')
INSERT [Reference].[Color] ([ColorID], [Color]) VALUES (9, N'RED')
INSERT [Reference].[Color] ([ColorID], [Color]) VALUES (10, N'SILVER')
SET IDENTITY_INSERT [Reference].[Color] OFF
GO
SET IDENTITY_INSERT [Reference].[Country] ON 

INSERT [Reference].[Country] ([CountryID], [CountryName], [CountryISO2], [CountryISO3], [SalesRegion]) VALUES (1, N'Belgium', N'BE        ', N'BEL       ', N'EMEA')
INSERT [Reference].[Country] ([CountryID], [CountryName], [CountryISO2], [CountryISO3], [SalesRegion]) VALUES (2, N'France', N'FR        ', N'FRA       ', N'EMEA')
INSERT [Reference].[Country] ([CountryID], [CountryName], [CountryISO2], [CountryISO3], [SalesRegion]) VALUES (3, N'Germany', N'DE        ', N'DEU       ', N'EMEA')
INSERT [Reference].[Country] ([CountryID], [CountryName], [CountryISO2], [CountryISO3], [SalesRegion]) VALUES (4, N'Italy', N'IT        ', N'ITA       ', N'EMEA')
INSERT [Reference].[Country] ([CountryID], [CountryName], [CountryISO2], [CountryISO3], [SalesRegion]) VALUES (5, N'Spain', N'ES        ', N'ESP       ', N'EMEA')
INSERT [Reference].[Country] ([CountryID], [CountryName], [CountryISO2], [CountryISO3], [SalesRegion]) VALUES (6, N'United Kingdom', N'GB        ', N'GBR       ', N'EMEA')
INSERT [Reference].[Country] ([CountryID], [CountryName], [CountryISO2], [CountryISO3], [SalesRegion]) VALUES (7, N'United States', N'US        ', N'USA       ', N'North America')
INSERT [Reference].[Country] ([CountryID], [CountryName], [CountryISO2], [CountryISO3], [SalesRegion]) VALUES (8, N'China', N'CN        ', N'CHN       ', N'Asia')
INSERT [Reference].[Country] ([CountryID], [CountryName], [CountryISO2], [CountryISO3], [SalesRegion]) VALUES (9, N'India', N'IN        ', N'IND       ', N'Asia')
INSERT [Reference].[Country] ([CountryID], [CountryName], [CountryISO2], [CountryISO3], [SalesRegion]) VALUES (10, N'Switzerland', N'CH        ', N'CHF       ', N'EMEA')
SET IDENTITY_INSERT [Reference].[Country] OFF
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-01-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-02-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-03-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-10' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-04-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-05-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-06-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-19' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-07-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-08-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-09-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-27' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-10-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-11-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2015-12-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-01-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-04' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-02-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-03-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-04-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-14' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-05-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-06-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-07-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-22' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-08-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-09-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-10-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-11-30' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2016-12-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-01-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-02-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-10' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-03-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-04-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-05-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-18' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-06-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-07-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-08-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-26' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-09-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-10-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-11-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2017-12-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-04' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-01-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-02-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-03-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-14' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-04-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-05-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-06-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-23' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-07-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-08-31' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-09-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-10-31' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-11-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-01' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-02' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-03' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-04' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-05' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-06' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-07' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-08' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-09' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-10' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-11' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-12' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-13' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-14' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-15' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-16' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-17' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-18' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-19' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-20' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-21' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-22' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-23' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-24' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-25' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-26' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-27' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-28' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-29' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-30' AS Date), N'USD', 1.0000)
INSERT [Reference].[Forex] ([ExchangeDate], [ISOCurrency], [ExchangeRate]) VALUES (CAST(N'2018-12-31' AS Date), N'USD', 1.0000)
GO
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Ferrari', N'Sports')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Porsche', N'Sports,Tourer')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Lamborghini', N'Sports')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Aston Martin', N'Sports,Tourer')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Bentley', N'Tourer,Chauffer,Prestige')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Rolls Royce', N'Chauffer,Prestige')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Maybach', N'Chauffer,Prestige')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Mercedes', N'Tourer,Sports')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Alfa Romeo', N'Sports')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Austin', N'Relic')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'BMW', N'Sports,Tourer')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Bugatti', N'Sports')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Citroen', N'Family')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Delahaye', N'Family')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Delorean', N'Sports,Family')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Jaguar', N'Sports,Family')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Lagonda', N'Sports')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'McLaren', N'Sports')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Morgan', N'Sports')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Noble', N'Sports')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Triumph', N'Sports')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Trabant', N'Family')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Peugeot', N'Family')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Reliant', N'Family')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Riley', N'Family')
INSERT [Reference].[MarketingCategories] ([MakeName], [MarketingType]) VALUES (N'Cadillac', N'Family')
GO
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Magic Motors', N'GB        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Snazzy Roadsters', N'GB        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Birmingham Executive Prestige Vehicles', N'GB        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'WunderKar', N'DE        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Casseroles Chromes', N'FR        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Le Luxe en Motion', N'CH        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Eat My Exhaust Ltd', N'GB        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'M. Pierre Dubois', N'FR        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Sondra Horowitz', N'US        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Wonderland Wheels', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'London Executive Prestige Vehicles', N'GB        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Glittering Prize Cars Ltd', N'GB        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'La Bagnole de Luxe', N'FR        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Convertible Dreams', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Alexei Tolstoi', N'GB        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'SuperSport S.A.R.L.', N'FR        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Theo Kowalski', N'US        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Peter McLuckie', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Posh Vehicles Ltd', N'GB        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Jason B. Wight', N'US        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Silver HubCaps', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Stan Collywobble', N'GB        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Glitz', N'DE        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Matterhorn Motors', N'CH        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'King Leer Cars', N'GB        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Honest Pete Motors', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Peter Smith', N'GB        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Vive La Vitesse', N'FR        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Liverpool Executive Prestige Vehicles', N'GB        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Mrs. Ivana Telford', N'GB        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Kieran O''Harris', N'GB        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Prestige Imports', N'ES        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Prestissimo!', N'IT        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Diplomatic Cars', N'BE        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Laurent Saint Yves', N'FR        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Screamin'' Wheels', N'US        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Screamin'' Wheels', N'GB        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Executive Motor Delight', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Alicia Almodovar', N'ES        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Ronaldo Bianco', N'IT        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Sport.Car', N'IT        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Autos Sportivos', N'ES        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Le Luxe en Motion', N'FR        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Screamin'' Wheels Corp', N'US        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Pierre Blanc', N'GB        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Capots Reluisants S.A.', N'FR        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Stefano DiLonghi', N'IT        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Antonio Maura', N'ES        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Stefan Van Helsing', N'BE        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Mme Anne Duport', N'FR        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Clubbing Cars', N'GB        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Jean-Yves Truffaut', N'FR        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Mr. Evan Telford', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Ralph Obermann', N'DE        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'ImpressTheNeighbours.Com', N'GB        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Wladimir Lacroix', N'FR        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Raimondo Delattre', N'CH        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Boris Spry', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Andrea Tarbuck', N'GB        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Beltway Prestige Driving', N'GB        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Bling Motors', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Smooth Rocking Chrome', N'IT        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'YO! Speed!', N'ES        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Stephany Rousso', N'US        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'My Shiny Sports Car Ltd.', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Flash Voitures', N'BE        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Paul Blasio', N'US        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Mary Blackhouse', N'GB        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Maurice Dujardin', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Leslie Whittington', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Mike Beeton', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Melissa Bertrand', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'El Sport', N'ES        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Bling Bling S.A.', N'FR        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Bravissima!', N'IT        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Jayden Jones', N'US        ', N'Some')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Expensive Shine', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Steve Docherty', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Rodolph Legler', N'DE        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Pete Spring', N'GB        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Khader El Ghannam', N'FR        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Jacques Mitterand', N'FR        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Francoise LeBrun', N'CH        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Alex McWhirter', N'GB        ', N'None')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Francois Chirac', N'FR        ', N'Immense')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Andy Cheshire', N'GB        ', N'Lots')
INSERT [Reference].[MarketingInformation] ([CUST], [Country], [SpendCapacity]) VALUES (N'Jimmy McFiddler', N'GB        ', N'Lots')
GO
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'F50', N'£204760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'F50', N'£248000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'F40', N'£215600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Enzo', N'£316000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'355', N'£124000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Enzo', N'£292000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Testarossa', N'£132000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'355', N'£176000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'355', N'£127600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'F40', N'£200000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'F50', N'£156000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'355', N'£125200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Mondial', N'£82360.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Mondial', N'£124000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'355', N'£164000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Testarossa', N'£156000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'355', N'£135600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Testarossa', N'£200000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Testarossa', N'£52000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'355', N'£100760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Enzo', N'£204000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Daytona', N'£116000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'360', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'360', N'£108000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Dino', N'£156000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'360', N'£102800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Daytona', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Ferrari', N'Dino', N'£98800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£53200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£15960.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'959', N'£44480.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£15680.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£7160.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£40960.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£10000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£14000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£10120.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'924', N'£17280.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£6800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£15600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£6000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£12600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£26880.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'924', N'£13200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£23600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£36760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£18360.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'959', N'£53200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'928', N'£15600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£17720.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'924', N'£7960.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£16760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'924', N'£7160.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£7040.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£7840.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'928', N'£7600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£12520.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£55120.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'924', N'£9592.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'911', N'£39600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'924', N'£10000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'959', N'£31600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'928', N'£12760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'924', N'£6040.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'959', N'£71600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'Boxster', N'£18000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'924', N'£31600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'924', N'£9200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Porsche', N'944', N'£15600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lamborghini', N'Diabolo', N'£188000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lamborghini', N'Diabolo', N'£135600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lamborghini', N'Diabolo', N'£20000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lamborghini', N'Jarama', N'£244000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lamborghini', N'Jarama', N'£196000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lamborghini', N'400GT', N'£116000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lamborghini', N'Countach', N'£2920.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lamborghini', N'Diabolo', N'£204000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lamborghini', N'Countach', N'£98800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vantage', N'£100000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Rapide', N'£69200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB5', N'£55600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB4', N'£29200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB9', N'£62000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vanquish', N'£52400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£98872.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB9', N'£47600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB9', N'£44000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£36000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vanquish', N'£45592.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£90872.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB9', N'£52360.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vanquish', N'£44000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB2', N'£36760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£45200.00')
GO
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB2', N'£39600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB5', N'£29200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB9', N'£45520.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£36720.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£44000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Rapide', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£60800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB5', N'£39600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB5', N'£45512.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB9', N'£36480.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vantage', N'£39600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB2', N'£50000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£82000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£55600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vanquish', N'£10000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB9', N'£37200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£100400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vanquish', N'£45560.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB4', N'£45480.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB9', N'£45200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£44800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB5', N'£34360.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Rapide', N'£44000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB2', N'£79992.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£180000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£100000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB4', N'£34000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£80000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£43600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB4', N'£45560.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB2', N'£31600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£58000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vantage', N'£82000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB4', N'£23600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vantage', N'£53200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB9', N'£49240.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£44000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB9', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£35908.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB4', N'£10000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Virage', N'£98800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB4', N'£37520.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB2', N'£42000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vanquish', N'£46080.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£36760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Rapide', N'£49200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB2', N'£36000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB5', N'£36000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB2', N'£49200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£66072.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£36400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£36000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'Vanquish', N'£45200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Aston Martin', N'DB6', N'£39664.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Brooklands', N'£151600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Flying Spur', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Flying Spur', N'£58000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Mulsanne', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Flying Spur', N'£52712.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Flying Spur', N'£63600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Flying Spur', N'£61200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Mulsanne', N'£45560.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Flying Spur', N'£45560.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Flying Spur', N'£64400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Continental', N'£71600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Flying Spur', N'£73720.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Arnage', N'£79960.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Arnage', N'£68520.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Brooklands', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Continental', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Arnage', N'£61200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bentley', N'Continental', N'£45560.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Silver Seraph', N'£79960.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Silver Seraph', N'£111600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Silver Shadow', N'£108000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Ghost', N'£48400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Silver Seraph', N'£96000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Phantom', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Phantom', N'£146000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Phantom', N'£95680.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Ghost', N'£79160.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Phantom', N'£63600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Wraith', N'£130000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Corniche', N'£71600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Rolls Royce', N'Silver Shadow', N'£68000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'350SL', N'£26880.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'350SL', N'£26140.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'500SL', N'£36000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'280SL', N'£18360.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'280SL', N'£45512.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'500SL', N'£24400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'250SL', N'£18080.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'280SL', N'£26760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'280SL', N'£50000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'350SL', N'£18800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'250SL', N'£10360.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'280SL', N'£26000.00')
GO
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Mercedes', N'280SL', N'£31600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulia', N'£8400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Spider', N'£10000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Spider', N'£9200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'1750', N'£7960.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulia', N'£2040.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulia', N'£4800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulietta', N'£14360.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulietta', N'£17200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulia', N'£10000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulietta', N'£14800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Spider', N'£4520.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulia', N'£14000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Spider', N'£4760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulia', N'£6956.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulia', N'£20000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulietta', N'£9240.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulietta', N'£5200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulietta', N'£4552.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulietta', N'£8400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Alfa Romeo', N'Giulia', N'£5560.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Austin', N'Princess', N'£4800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Austin', N'Lichfield', N'£18880.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Austin', N'Princess', N'£920.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Austin', N'Cambridge', N'£18000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Austin', N'Lichfield', N'£5200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Austin', N'Princess', N'£1800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Austin', N'Princess', N'£2000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'BMW', N'Alpina', N'£17200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'BMW', N'E30', N'£26800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'BMW', N'Isetta', N'£4400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bugatti', N'57C', N'£276000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bugatti', N'Veyron', N'£176400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bugatti', N'57C', N'£284000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bugatti', N'57C', N'£236000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Bugatti', N'57C', N'£268000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Citroen', N'Traaction Avant', N'£20000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Citroen', N'Rosalie', N'£4400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Citroen', N'Torpedo', N'£52712.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Citroen', N'Rosalie', N'£792.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Citroen', N'Rosalie', N'£1080.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Delahaye', N'135', N'£20400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Delahaye', N'175', N'£10000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Delahaye', N'145', N'£23600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Delahaye', N'145', N'£31600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Delorean', N'DMC 12', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK120', N'£47200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'Mark V', N'£20760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK120', N'£17240.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK150', N'£23720.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK120', N'£79600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK150', N'£23600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'Mark V', N'£26800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XJS', N'£7960.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'E-Type', N'£31600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'Mark X', N'£19600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XJ12', N'£28200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK150', N'£21200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'Mark X', N'£69200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XJ12', N'£14280.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK120', N'£54800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK120', N'£28000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK120', N'£12480.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK150', N'£18392.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XJS', N'£18080.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XJS', N'£15600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK120', N'£15680.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK120', N'£22312.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XJ12', N'£2860.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Jaguar', N'XK150', N'£63600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lagonda', N'V12', N'£49200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Lagonda', N'V12', N'£125200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'McLaren', N'P1', N'£236000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Morgan', N'Plus 4', N'£14800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Noble', N'M600', N'£23600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Noble', N'M600', N'£36760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Noble', N'M14', N'£4400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Noble', N'M600', N'£20760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Noble', N'M600', N'£36000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Noble', N'M600', N'£44000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR6', N'£10000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'Roadster', N'£18800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR4', N'£5560.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR7', N'£7912.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR5', N'£7120.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR5', N'£6840.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR4', N'£4400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR4', N'£6800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR5', N'£7960.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR5', N'£10120.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'GT6', N'£2800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR7', N'£4544.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR5', N'£7600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR5', N'£5240.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR6', N'£7992.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR7', N'£7600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR5', N'£4544.00')
GO
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'GT6', N'£7400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR6', N'£5200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR6', N'£10000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR5', N'£10200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR4', N'£5272.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR4', N'£7992.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR5', N'£10056.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR7', N'£7960.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR4', N'£4400.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR4', N'£11672.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR6', N'£7960.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR5', N'£9200.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'Roadster', N'£10360.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Triumph', N'TR3A', N'£31600.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Trabant', N'500', N'£920.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Trabant', N'500', N'£2000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Trabant', N'600', N'£1560.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Trabant', N'600', N'£1000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Trabant', N'600', N'£1272.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Peugeot', N'205', N'£3160.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Peugeot', N'205', N'£760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Peugeot', N'203', N'£1560.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Peugeot', N'203', N'£1000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Peugeot', N'404', N'£1000.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Peugeot', N'404', N'£1920.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Peugeot', N'404', N'£760.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Peugeot', N'404', N'£1996.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Peugeot', N'404', N'£2800.00')
INSERT [SourceData].[SalesInPounds] ([MakeName], [ModelName], [VehicleCost]) VALUES (N'Reliant', N'Robin', N'£760.00')
GO
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Ferrari', N'2 000,00 USD', N'255950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Ferrari', N'2 000,00 USD', N'310000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Ferrari', N'2 000,00 USD', N'269500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Ferrari', N'2 000,00 USD', N'395000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Ferrari', N'2 000,00 USD', N'155000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Ferrari', N'2 000,00 USD', N'365000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'132000.00', N'165000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'176000.00', N'220000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Ferrari', N'127600.00', N'159500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Ferrari', N'200000.00', N'250000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Ferrari', N'156000.00', N'195000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'125200.00', N'156500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'82360.00', N'102950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'124000.00', N'155000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'164000.00', N'205000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'156000.00', N'195000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'135600.00', N'169500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Ferrari', N'200000.00', N'250000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'52000.00', N'65000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'100760.00', N'125950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'204000.00', N'255000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Ferrari', N'116000.00', N'145000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Ferrari', N'79600.00', N'99500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Ferrari', N'108000.00', N'135000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Ferrari', N'156000.00', N'195000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Ferrari', N'102800.00', N'128500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Ferrari', N'79600.00', N'99500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Ferrari', N'98800.00', N'123500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Porsche', N'53200.00', N'66500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Porsche', N'15960.00', N'19950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Porsche', N'44480.00', N'55600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Porsche', N'15680.00', N'19600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Porsche', N'7160.00', N'8950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Porsche', N'40960.00', N'51200.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Porsche', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Porsche', N'14000.00', N'17500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Porsche', N'10120.00', N'12650.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'17280.00', N'21600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'6800.00', N'8500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'15600.00', N'19500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'6000.00', N'7500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Porsche', N'12600.00', N'15750.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'26880.00', N'33600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'13200.00', N'16500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'23600.00', N'29500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'36760.00', N'45950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'18360.00', N'22950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'53200.00', N'66500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'17720.00', N'22150.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'7960.00', N'9950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'16760.00', N'20950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'7160.00', N'8950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'7040.00', N'8800.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'7840.00', N'9800.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'7600.00', N'9500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Porsche', N'12520.00', N'15650.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Porsche', N'55120.00', N'68900.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Porsche', N'9592.00', N'11990.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Porsche', N'39600.00', N'49500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Porsche', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Porsche', N'31600.00', N'39500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Porsche', N'12760.00', N'15950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Porsche', N'6040.00', N'7550.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Porsche', N'71600.00', N'89500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Porsche', N'18000.00', N'22500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Porsche', N'31600.00', N'39500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Porsche', N'9200.00', N'11500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Porsche', N'15600.00', N'19500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Lamborghini', N'188000.00', N'235000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Lamborghini', N'135600.00', N'169500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Lamborghini', N'20000.00', N'25000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Lamborghini', N'244000.00', N'305000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Lamborghini', N'196000.00', N'245000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Lamborghini', N'116000.00', N'145000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Lamborghini', N'2920.00', N'3650.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Lamborghini', N'204000.00', N'255000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Lamborghini', N'98800.00', N'123500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Belgium', N'Aston Martin', N'100000.00', N'125000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Belgium', N'Aston Martin', N'69200.00', N'86500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Aston Martin', N'55600.00', N'69500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Aston Martin', N'29200.00', N'36500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Aston Martin', N'62000.00', N'77500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Aston Martin', N'52400.00', N'65500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Aston Martin', N'98872.00', N'123590.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Aston Martin', N'47600.00', N'59500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Aston Martin', N'44000.00', N'55000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Aston Martin', N'36000.00', N'45000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Aston Martin', N'45592.00', N'56990.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Aston Martin', N'90872.00', N'113590.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Aston Martin', N'52360.00', N'65450.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'44000.00', N'55000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'36760.00', N'45950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'45200.00', N'56500.00')
GO
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Aston Martin', N'39600.00', N'49500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Aston Martin', N'29200.00', N'36500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Aston Martin', N'45520.00', N'56900.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'36720.00', N'45900.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'44000.00', N'55000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'79600.00', N'99500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'60800.00', N'76000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'39600.00', N'49500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'45512.00', N'56890.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'36480.00', N'45600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'50000.00', N'62500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'82000.00', N'102500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'55600.00', N'69500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'37200.00', N'46500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'100400.00', N'125500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'45560.00', N'56950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'45480.00', N'56850.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'45200.00', N'56500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'44800.00', N'56000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'34360.00', N'42950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'79992.00', N'99990.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'180000.00', N'225000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'100000.00', N'125000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'34000.00', N'42500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'80000.00', N'100000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'43600.00', N'54500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'31600.00', N'39500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'58000.00', N'72500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'23600.00', N'29500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'53200.00', N'66500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'49240.00', N'61550.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Aston Martin', N'35908.00', N'44885.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Aston Martin', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Aston Martin', N'98800.00', N'123500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Aston Martin', N'37520.00', N'46900.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Aston Martin', N'42000.00', N'52500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Aston Martin', N'46080.00', N'57600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Aston Martin', N'36760.00', N'45950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Aston Martin', N'79600.00', N'99500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Aston Martin', N'49200.00', N'61500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Aston Martin', N'36000.00', N'45000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Aston Martin', N'36000.00', N'45000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Aston Martin', N'49200.00', N'61500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Aston Martin', N'66072.00', N'82590.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Aston Martin', N'36400.00', N'45500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Aston Martin', N'36000.00', N'45000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Aston Martin', N'45200.00', N'56500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Aston Martin', N'44800.00', N'56000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Aston Martin', N'39664.00', N'49580.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Bentley', N'151600.00', N'189500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Bentley', N'79600.00', N'99500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Bentley', N'58000.00', N'72500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Bentley', N'79600.00', N'99500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Bentley', N'52712.00', N'65890.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Bentley', N'63600.00', N'79500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Bentley', N'61200.00', N'76500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Bentley', N'45560.00', N'56950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Bentley', N'64400.00', N'80500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Bentley', N'71600.00', N'89500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Bentley', N'73720.00', N'92150.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Bentley', N'79960.00', N'99950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Bentley', N'68520.00', N'85650.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Bentley', N'79600.00', N'99500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Rolls Royce', N'79960.00', N'99950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Rolls Royce', N'111600.00', N'139500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Rolls Royce', N'108000.00', N'135000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Rolls Royce', N'48400.00', N'60500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Rolls Royce', N'96000.00', N'120000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Rolls Royce', N'79600.00', N'99500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Rolls Royce', N'146000.00', N'182500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Rolls Royce', N'95680.00', N'119600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Rolls Royce', N'79160.00', N'98950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Rolls Royce', N'63600.00', N'79500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Rolls Royce', N'130000.00', N'162500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Rolls Royce', N'71600.00', N'89500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Rolls Royce', N'68000.00', N'85000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Mercedes', N'26880.00', N'33600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Mercedes', N'26140.00', N'32675.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Mercedes', N'36000.00', N'45000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Mercedes', N'18360.00', N'22950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Mercedes', N'45512.00', N'56890.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Mercedes', N'24400.00', N'30500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Mercedes', N'18080.00', N'22600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Mercedes', N'26760.00', N'33450.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Mercedes', N'50000.00', N'62500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Mercedes', N'18800.00', N'23500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Mercedes', N'10360.00', N'12950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Mercedes', N'26000.00', N'32500.00')
GO
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Mercedes', N'31600.00', N'39500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Belgium', N'Alfa Romeo', N'8400.00', N'10500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Belgium', N'Alfa Romeo', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Alfa Romeo', N'9200.00', N'11500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Alfa Romeo', N'7960.00', N'9950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Alfa Romeo', N'2040.00', N'2550.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Alfa Romeo', N'4800.00', N'6000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Alfa Romeo', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Alfa Romeo', N'14360.00', N'17950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Alfa Romeo', N'17200.00', N'21500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Alfa Romeo', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Alfa Romeo', N'14800.00', N'18500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Alfa Romeo', N'4520.00', N'5650.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Alfa Romeo', N'14000.00', N'17500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Alfa Romeo', N'4760.00', N'5950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Alfa Romeo', N'6956.00', N'8695.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Alfa Romeo', N'20000.00', N'25000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Alfa Romeo', N'9240.00', N'11550.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Alfa Romeo', N'5200.00', N'6500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Alfa Romeo', N'4552.00', N'5690.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Alfa Romeo', N'8400.00', N'10500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Alfa Romeo', N'5560.00', N'6950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Austin', N'4800.00', N'6000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Germany', N'Austin', N'18880.00', N'23600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Austin', N'920.00', N'1150.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Austin', N'18000.00', N'22500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Austin', N'5200.00', N'6500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Austin', N'1800.00', N'2250.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Austin', N'2000.00', N'2500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'BMW', N'17200.00', N'21500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'BMW', N'26800.00', N'33500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'BMW', N'4400.00', N'5500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Bugatti', N'276000.00', N'345000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Bugatti', N'176400.00', N'220500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Bugatti', N'284000.00', N'365000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Bugatti', N'284000.00', N'355000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Bugatti', N'236000.00', N'295000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Bugatti', N'268000.00', N'335000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Citroen', N'20000.00', N'25000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Citroen', N'4400.00', N'5500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Citroen', N'52712.00', N'65890.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Citroen', N'792.00', N'990.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Citroen', N'1080.00', N'1350.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Delahaye', N'20400.00', N'25500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Delahaye', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Delahaye', N'23600.00', N'29500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Delahaye', N'31600.00', N'39500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Delorean', N'79600.00', N'99500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Jaguar', N'47200.00', N'59000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Jaguar', N'20760.00', N'25950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Jaguar', N'17240.00', N'21550.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Jaguar', N'23720.00', N'29650.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Jaguar', N'79600.00', N'99500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Jaguar', N'23600.00', N'29500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Jaguar', N'26800.00', N'33500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'7960.00', N'9950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'31600.00', N'39500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'19600.00', N'24500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'28200.00', N'35250.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'21200.00', N'26500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Jaguar', N'69200.00', N'86500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'14280.00', N'17850.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'54800.00', N'68500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'28000.00', N'35000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'12480.00', N'15600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'18392.00', N'22990.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'18080.00', N'22600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Jaguar', N'15600.00', N'19500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Jaguar', N'15680.00', N'19600.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Jaguar', N'22312.00', N'27890.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Jaguar', N'2860.00', N'3575.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Jaguar', N'63600.00', N'79500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Jaguar', N'23600.00', N'29500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Lagonda', N'49200.00', N'61500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Lagonda', N'125200.00', N'156500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'McLaren', N'236000.00', N'295000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Morgan', N'14800.00', N'18500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Belgium', N'Noble', N'23600.00', N'29500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Noble', N'36760.00', N'45950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Noble', N'4400.00', N'5500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Noble', N'20760.00', N'25950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Noble', N'36000.00', N'45000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Noble', N'44000.00', N'55000.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Belgium', N'Triumph', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Belgium', N'Triumph', N'18800.00', N'23500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Belgium', N'Triumph', N'5560.00', N'6950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Triumph', N'7912.00', N'9890.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Triumph', N'7120.00', N'8900.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Triumph', N'6840.00', N'8550.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Triumph', N'4400.00', N'5500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'6800.00', N'8500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'7960.00', N'9950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'10120.00', N'12650.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'2800.00', N'3500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'4544.00', N'5680.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United States', N'Triumph', N'7600.00', N'9500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'5240.00', N'6550.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'7992.00', N'9990.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'7600.00', N'9500.00')
GO
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'7400.00', N'9250.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'5200.00', N'6500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Triumph', N'10000.00', N'12500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Triumph', N'10200.00', N'12750.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'5272.00', N'6590.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'7992.00', N'9990.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'10056.00', N'12570.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Triumph', N'7960.00', N'9950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Triumph', N'4400.00', N'5500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Triumph', N'11672.00', N'14590.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Triumph', N'7960.00', N'9950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Triumph', N'9200.00', N'11500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Triumph', N'10360.00', N'12950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Spain', N'Triumph', N'31600.00', N'39500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Trabant', N'920.00', N'1150.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Trabant', N'2000.00', N'2500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Trabant', N'1560.00', N'1950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Trabant', N'1000.00', N'1250.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Trabant', N'1272.00', N'1590.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Belgium', N'Peugeot', N'3160.00', N'3950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Belgium', N'Peugeot', N'760.00', N'950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Peugeot', N'1560.00', N'1950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'France', N'Peugeot', N'1000.00', N'1250.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'Italy', N'Peugeot', N'1000.00', N'1250.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Peugeot', N'1920.00', N'2400.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Peugeot', N'760.00', N'950.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Peugeot', N'1996.00', N'2495.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Peugeot', N'2800.00', N'3500.00')
INSERT [SourceData].[SalesText] ([CountryName], [MakeName], [Cost], [SalePrice]) VALUES (N'United Kingdom', N'Reliant', N'760.00', N'950.00')
GO
ALTER TABLE [Data].[Customer] ADD  DEFAULT ('') FOR [CustomerName]
GO
ALTER TABLE [Data].[Customer] ADD  DEFAULT ('') FOR [Address1]
GO
ALTER TABLE [Data].[Customer] ADD  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [Data].[Customer] ADD  DEFAULT ('Unknown') FOR [Town]
GO
ALTER TABLE [Data].[Customer] ADD  DEFAULT ('') FOR [PostCode]
GO
ALTER TABLE [Data].[Customer] ADD  DEFAULT ((0)) FOR [CountryID]
GO
ALTER TABLE [Data].[Customer] ADD  DEFAULT ((0)) FOR [IsReseller]
GO
ALTER TABLE [Data].[Customer] ADD  DEFAULT ((0)) FOR [IsCreditRisk]
GO
ALTER TABLE [Data].[Make] ADD  DEFAULT ('') FOR [MakeName]
GO
ALTER TABLE [Data].[Make] ADD  DEFAULT ((0)) FOR [CountryID]
GO
ALTER TABLE [Data].[Model] ADD  DEFAULT ((0)) FOR [MakeID]
GO
ALTER TABLE [Data].[Model] ADD  DEFAULT ('') FOR [ModelName]
GO
ALTER TABLE [Data].[Model] ADD  DEFAULT ('') FOR [ModelVariant]
GO
ALTER TABLE [Data].[Model] ADD  DEFAULT ('') FOR [YearFirstProduced]
GO
ALTER TABLE [Data].[Model] ADD  DEFAULT ('') FOR [YearLastProduced]
GO
ALTER TABLE [Data].[PivotTable] ADD  DEFAULT ((0)) FOR [2015]
GO
ALTER TABLE [Data].[PivotTable] ADD  DEFAULT ((0)) FOR [2016]
GO
ALTER TABLE [Data].[PivotTable] ADD  DEFAULT ((0)) FOR [2017]
GO
ALTER TABLE [Data].[PivotTable] ADD  DEFAULT ((0)) FOR [2018]
GO
ALTER TABLE [Data].[Sales] ADD  DEFAULT ('') FOR [InvoiceNumber]
GO
ALTER TABLE [Data].[Sales] ADD  DEFAULT ((0)) FOR [TotalSalePrice]
GO
ALTER TABLE [Data].[Sales] ADD  DEFAULT (getdate()) FOR [SaleDate]
GO
ALTER TABLE [Data].[SalesDetails] ADD  DEFAULT ((0)) FOR [LineItemNumber]
GO
ALTER TABLE [Data].[SalesDetails] ADD  DEFAULT ('') FOR [StockID]
GO
ALTER TABLE [Data].[SalesDetails] ADD  DEFAULT ((0)) FOR [SalePrice]
GO
ALTER TABLE [Data].[SalesDetails] ADD  DEFAULT ((0)) FOR [LineItemDiscount]
GO
ALTER TABLE [Data].[Stock] ADD  DEFAULT ((0)) FOR [ModelID]
GO
ALTER TABLE [Data].[Stock] ADD  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [Data].[Stock] ADD  DEFAULT ((0)) FOR [RepairsCost]
GO
ALTER TABLE [Data].[Stock] ADD  DEFAULT ((0)) FOR [PartsCost]
GO
ALTER TABLE [Data].[Stock] ADD  DEFAULT ((0)) FOR [TransportInCost]
GO
ALTER TABLE [Data].[Stock] ADD  DEFAULT ((0)) FOR [IsRHD]
GO
ALTER TABLE [Data].[Stock] ADD  DEFAULT ((0)) FOR [ColorID]
GO
ALTER TABLE [Data].[Stock] ADD  DEFAULT ('') FOR [BuyerComments]
GO
ALTER TABLE [Data].[Stock] ADD  DEFAULT (getdate()) FOR [DateBought]
GO
ALTER TABLE [Data].[Stock] ADD  DEFAULT ('00:00:00') FOR [TimeBought]
GO
ALTER TABLE [Output].[StockPrices] ADD  DEFAULT ('') FOR [MakeName]
GO
ALTER TABLE [Output].[StockPrices] ADD  DEFAULT ('') FOR [ModelName]
GO
ALTER TABLE [Output].[StockPrices] ADD  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [Reference].[Budget] ADD  DEFAULT ((0)) FOR [BudgetValue]
GO
ALTER TABLE [Reference].[Budget] ADD  DEFAULT ((0)) FOR [Year]
GO
ALTER TABLE [Reference].[Budget] ADD  DEFAULT ((0)) FOR [Month]
GO
ALTER TABLE [Reference].[Budget] ADD  DEFAULT ('') FOR [BudgetDetail]
GO
ALTER TABLE [Reference].[Budget] ADD  DEFAULT ('') FOR [BudgetElement]
GO
ALTER TABLE [Reference].[Color] ADD  DEFAULT ('') FOR [Color]
GO
ALTER TABLE [Reference].[Country] ADD  DEFAULT ('') FOR [CountryName]
GO
ALTER TABLE [Reference].[Country] ADD  DEFAULT ('') FOR [CountryISO2]
GO
ALTER TABLE [Reference].[Country] ADD  DEFAULT ('') FOR [CountryISO3]
GO
ALTER TABLE [Reference].[Country] ADD  DEFAULT ('') FOR [SalesRegion]
GO
ALTER TABLE [Reference].[Forex] ADD  DEFAULT (getdate()) FOR [ExchangeDate]
GO
ALTER TABLE [Reference].[Forex] ADD  DEFAULT ('') FOR [ISOCurrency]
GO
ALTER TABLE [Reference].[Forex] ADD  DEFAULT ((0)) FOR [ExchangeRate]
GO
ALTER TABLE [Reference].[MarketingCategories] ADD  DEFAULT ('') FOR [MakeName]
GO
ALTER TABLE [Reference].[MarketingCategories] ADD  DEFAULT ('') FOR [MarketingType]
GO
ALTER TABLE [Reference].[MarketingInformation] ADD  DEFAULT ('') FOR [CUST]
GO
ALTER TABLE [Reference].[MarketingInformation] ADD  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [Reference].[MarketingInformation] ADD  DEFAULT ('') FOR [SpendCapacity]
GO
ALTER TABLE [SourceData].[SalesInPounds] ADD  DEFAULT ('') FOR [MakeName]
GO
ALTER TABLE [SourceData].[SalesInPounds] ADD  DEFAULT ('') FOR [ModelName]
GO
ALTER TABLE [SourceData].[SalesInPounds] ADD  DEFAULT ('') FOR [VehicleCost]
GO
ALTER TABLE [SourceData].[SalesInPounds_Cleaned] ADD  DEFAULT ('') FOR [CustomerID]
GO
ALTER TABLE [SourceData].[SalesInPounds_Cleaned] ADD  DEFAULT ('') FOR [StockID]
GO
ALTER TABLE [SourceData].[SalesInPounds_Cleaned] ADD  DEFAULT (getdate()) FOR [SaleDate]
GO
ALTER TABLE [SourceData].[SalesInPounds_Cleaned] ADD  DEFAULT ((0)) FOR [SalePriceGBP]
GO
ALTER TABLE [SourceData].[SalesInPounds_Cleaned] ADD  DEFAULT ((0)) FOR [ConvertedUSD]
GO
ALTER TABLE [SourceData].[SalesText] ADD  DEFAULT ('') FOR [CountryName]
GO
ALTER TABLE [SourceData].[SalesText] ADD  DEFAULT ('') FOR [MakeName]
GO
ALTER TABLE [SourceData].[SalesText] ADD  DEFAULT ('') FOR [Cost]
GO
ALTER TABLE [SourceData].[SalesText] ADD  DEFAULT ('') FOR [SalePrice]
GO
ALTER TABLE [Data].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Country] FOREIGN KEY([CountryID])
REFERENCES [Reference].[Country] ([CountryID])
GO
ALTER TABLE [Data].[Customer] CHECK CONSTRAINT [FK_Customer_Country]
GO
ALTER TABLE [Data].[Make]  WITH CHECK ADD  CONSTRAINT [FK_Make_Country] FOREIGN KEY([CountryID])
REFERENCES [Reference].[Country] ([CountryID])
GO
ALTER TABLE [Data].[Make] CHECK CONSTRAINT [FK_Make_Country]
GO
ALTER TABLE [Data].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Make] FOREIGN KEY([MakeID])
REFERENCES [Data].[Make] ([MakeID])
GO
ALTER TABLE [Data].[Model] CHECK CONSTRAINT [FK_Model_Make]
GO
ALTER TABLE [Data].[PivotTable]  WITH CHECK ADD  CONSTRAINT [FK_PivotTable_Color] FOREIGN KEY([ColorID])
REFERENCES [Reference].[Color] ([ColorID])
GO
ALTER TABLE [Data].[PivotTable] CHECK CONSTRAINT [FK_PivotTable_Color]
GO
ALTER TABLE [Data].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customer] FOREIGN KEY([CustomerID])
REFERENCES [Data].[Customer] ([CustomerID])
GO
ALTER TABLE [Data].[Sales] CHECK CONSTRAINT [FK_Sales_Customer]
GO
ALTER TABLE [Data].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SalesDetails_Sales] FOREIGN KEY([SalesID])
REFERENCES [Data].[Sales] ([SalesID])
GO
ALTER TABLE [Data].[SalesDetails] CHECK CONSTRAINT [FK_SalesDetails_Sales]
GO
ALTER TABLE [Data].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SalesDetails_Stock] FOREIGN KEY([StockID])
REFERENCES [Data].[Stock] ([StockCode])
GO
ALTER TABLE [Data].[SalesDetails] CHECK CONSTRAINT [FK_SalesDetails_Stock]
GO
ALTER TABLE [Data].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Color] FOREIGN KEY([ColorID])
REFERENCES [Reference].[Color] ([ColorID])
GO
ALTER TABLE [Data].[Stock] CHECK CONSTRAINT [FK_Stock_Color]
GO
ALTER TABLE [Data].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Model] FOREIGN KEY([ModelID])
REFERENCES [Data].[Model] ([ModelID])
GO
ALTER TABLE [Data].[Stock] CHECK CONSTRAINT [FK_Stock_Model]
GO
/****** Object:  StoredProcedure [Process].[usp_TrackWorkFlow]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Process].[usp_TrackWorkFlow]
    @WorkFlowStepDescription NVARCHAR(100),
    @UserAuthorizationKey INT,
    @WorkFlowStepTableRowCount INT
AS
BEGIN
    -- Stub: In a real system, log or track workflow steps here
    PRINT 'Workflow: ' + @WorkFlowStepDescription;
END;
GO
/****** Object:  StoredProcedure [Project2.5].[DropForeignKeysFromStarSchemaData]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Recreate Drop-FKs Procedure
CREATE PROCEDURE [Project2.5].[DropForeignKeysFromStarSchemaData]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ForeignKeyName VARCHAR(255);
    DECLARE @TableName NVARCHAR(255);
    DECLARE @SQL NVARCHAR(MAX);

    DECLARE ForeignKeyCursor CURSOR FOR 
        SELECT fk.name AS ForeignKeyName,
               QUOTENAME(OBJECT_SCHEMA_NAME(fk.parent_object_id)) + '.' + QUOTENAME(OBJECT_NAME(fk.parent_object_id)) AS TableName
        FROM sys.foreign_keys AS fk
        INNER JOIN sys.tables AS t 
            ON fk.parent_object_id = t.object_id
        WHERE OBJECT_SCHEMA_NAME(fk.parent_object_id) IN ('Data', 'Reference', 'DataTransfer', 'SourceData', 'Output');  -- match same schema filter

    OPEN ForeignKeyCursor;
    FETCH NEXT FROM ForeignKeyCursor INTO @ForeignKeyName, @TableName;

    WHILE @@FETCH_STATUS = 0 
    BEGIN
        SET @SQL = 'ALTER TABLE ' + @TableName + ' DROP CONSTRAINT ' + QUOTENAME(@ForeignKeyName) + ';';
        EXEC(@SQL);

        FETCH NEXT FROM ForeignKeyCursor INTO @ForeignKeyName, @TableName;
    END

    CLOSE ForeignKeyCursor;
    DEALLOCATE ForeignKeyCursor;

    EXEC [Process].[usp_TrackWorkFlow]
         @WorkFlowStepDescription = 'Drop Foreign Keys.',
         @UserAuthorizationKey = @UserAuthorizationKey,
         @WorkFlowStepTableRowCount = -1;
END;
GO
/****** Object:  StoredProcedure [Project2.5].[TruncateStarSchemaData]    Script Date: 5/18/2025 10:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Recreate Truncate Procedure
CREATE PROCEDURE [Project2.5].[TruncateStarSchemaData]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE TableCursor CURSOR FOR
        SELECT DISTINCT '[' + TABLE_SCHEMA + '].[' + TABLE_NAME + ']' AS FullyQualifiedTableName
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_TYPE = 'BASE TABLE'
          AND TABLE_SCHEMA IN ('Data', 'Reference', 'DataTransfer', 'SourceData', 'Output'); -- updated schema list

    OPEN TableCursor;

    DECLARE @TableName NVARCHAR(255);
    DECLARE @SQL NVARCHAR(MAX);

    FETCH NEXT FROM TableCursor INTO @TableName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @SQL = 'TRUNCATE TABLE ' + @TableName;
        EXEC(@SQL);

        FETCH NEXT FROM TableCursor INTO @TableName;
    END

    CLOSE TableCursor;
    DEALLOCATE TableCursor;

    EXEC [Process].[usp_TrackWorkFlow]
         @WorkFlowStepDescription = 'Truncate Star Schema Data.',
         @UserAuthorizationKey = @UserAuthorizationKey,
         @WorkFlowStepTableRowCount = -1;
END;
GO
USE [master]
GO
ALTER DATABASE [PrestigeCars_3NF] SET  READ_WRITE 
GO
