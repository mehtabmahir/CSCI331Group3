#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > SourceData.SalesInPounds

# ![Tables](../../../../Images/Table32.png) [SourceData].[SalesInPounds]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 330 |
| Created | 5:33:59 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:59 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| MakeName | nvarchar(100) | 200 | NULL allowed |
| ModelName | nvarchar(150) | 300 | NULL allowed |
| VehicleCost | varchar(51) | 51 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [SourceData].[SalesInPounds]
(
[MakeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModelName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VehicleCost] [varchar] (51) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [SourceData](../Security/Schemas/dbo_SourceData.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[vw_SalesInPounds]](../Views/dbo_vw_SalesInPounds.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

