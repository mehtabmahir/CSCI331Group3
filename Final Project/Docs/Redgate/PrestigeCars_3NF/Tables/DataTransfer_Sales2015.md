#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > DataTransfer.Sales2015

# ![Tables](../../../../Images/Table32.png) [DataTransfer].[Sales2015]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MakeName | nvarchar(100) | 200 | NULL allowed |
| ModelName | nvarchar(150) | 300 | NULL allowed |
| CustomerName | nvarchar(150) | 300 | NULL allowed |
| CountryName | nvarchar(150) | 300 | NULL allowed |
| Cost | money | 8 | NULL allowed |
| RepairsCost | money | 8 | NULL allowed |
| PartsCost | money | 8 | NULL allowed |
| TransportInCost | money | 8 | NULL allowed |
| SalePrice | numeric(18,2) | 9 | NULL allowed |
| SaleDate | datetime | 8 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [DataTransfer].[Sales2015]
(
[MakeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModelName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountryName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cost] [money] NULL,
[RepairsCost] [money] NULL,
[PartsCost] [money] NULL,
[TransportInCost] [money] NULL,
[SalePrice] [numeric] (18, 2) NULL,
[SaleDate] [datetime] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [DataTransfer](../Security/Schemas/dbo_DataTransfer.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[fn_GetAllSales]](../Programmability/Functions/Table-valued_Functions/dbo_fn_GetAllSales.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

