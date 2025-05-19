#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > SourceData.SalesText

# ![Tables](../../../../Images/Table32.png) [SourceData].[SalesText]

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
| CountryName | nvarchar(150) | 300 | NULL allowed |
| MakeName | nvarchar(100) | 200 | NULL allowed |
| Cost | varchar(20) | 20 | NULL allowed |
| SalePrice | varchar(20) | 20 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [SourceData].[SalesText]
(
[CountryName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MakeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cost] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalePrice] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [SourceData](../Security/Schemas/dbo_SourceData.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[vw_SalesText]](../Views/dbo_vw_SalesText.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

