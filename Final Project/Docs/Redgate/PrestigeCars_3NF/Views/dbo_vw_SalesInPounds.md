#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Views](Views.md) > dbo.vw_SalesInPounds

# ![Views](../../../../Images/View32.png) [dbo].[vw_SalesInPounds]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| MakeName | nvarchar(100) | 200 |
| ModelName | nvarchar(150) | 300 |
| VehicleCost | varchar(51) | 51 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [dbo].[vw_SalesInPounds] AS
SELECT MakeName, ModelName, VehicleCost
FROM SourceData.SalesInPounds;
GO

```


---

## <a name="#uses"></a>Uses

* [[SourceData].[SalesInPounds]](../Tables/SourceData_SalesInPounds.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

