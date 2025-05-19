#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > SourceData.SalesInPounds_Cleaned

# ![Tables](../../../../Images/Table32.png) [SourceData].[SalesInPounds_Cleaned]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 0 |
| Created | 5:33:59 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:59 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK__SalesInP__8FFAD9B5B2B61882: SalesInPoundsID](../../../../Images/pkcluster.png)](#indexes) | SalesInPoundsID | [[dbo].[UDT_SalesID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalesID.md) | 4 | NOT NULL | 1 - 1 |
|  | CustomerID | [[dbo].[UDT_CustomerID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CustomerID.md) | 10 | NULL allowed |  |
|  | StockID | [[dbo].[UDT_StockCode]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_StockCode.md) | 100 | NULL allowed |  |
|  | SaleDate | [[dbo].[UDT_SaleDate]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SaleDate.md) | 8 | NULL allowed |  |
|  | SalePriceGBP | [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md) | 9 | NULL allowed |  |
|  | ConvertedUSD | [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md) | 9 | NULL allowed |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__SalesInP__8FFAD9B5B2B61882: SalesInPoundsID](../../../../Images/pkcluster.png)](#indexes) | PK__SalesInP__8FFAD9B5B2B61882 | SalesInPoundsID | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [SourceData].[SalesInPounds_Cleaned]
(
[SalesInPoundsID] [dbo].[UDT_SalesID] NOT NULL IDENTITY(1, 1),
[CustomerID] [dbo].[UDT_CustomerID] NULL,
[StockID] [dbo].[UDT_StockCode] NULL,
[SaleDate] [dbo].[UDT_SaleDate] NULL,
[SalePriceGBP] [dbo].[UDT_SalePrice] NULL,
[ConvertedUSD] [dbo].[UDT_SalePrice] NULL
) ON [PRIMARY]
GO
ALTER TABLE [SourceData].[SalesInPounds_Cleaned] ADD CONSTRAINT [PK__SalesInP__8FFAD9B5B2B61882] PRIMARY KEY CLUSTERED ([SalesInPoundsID]) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[UDT_CustomerID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CustomerID.md)
* [[dbo].[UDT_SaleDate]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SaleDate.md)
* [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md)
* [[dbo].[UDT_SalesID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalesID.md)
* [[dbo].[UDT_StockCode]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_StockCode.md)
* [SourceData](../Security/Schemas/dbo_SourceData.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

