#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Views](Views.md) > dbo.vw_YearlySales

# ![Views](../../../../Images/View32.png) [dbo].[vw_YearlySales]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |
| Created | 5:37:46 pm Sunday, 18 May 2025 |
| Last Modified | 5:37:46 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MakeName | nvarchar(100) | 200 |
| ModelName | nvarchar(150) | 300 |
| CustomerName | nvarchar(150) | 300 |
| CountryName | nvarchar(150) | 300 |
| Cost | money | 8 |
| RepairsCost | money | 8 |
| PartsCost | money | 8 |
| TransportInCost | money | 8 |
| SalePrice | numeric(18,2) | 9 |
| SaleDate | datetime | 8 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [dbo].[vw_YearlySales] AS
SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate
FROM Reference.YearlySales;
GO

```


---

## <a name="#uses"></a>Uses

* [[Reference].[YearlySales]](../Tables/Reference_YearlySales.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

