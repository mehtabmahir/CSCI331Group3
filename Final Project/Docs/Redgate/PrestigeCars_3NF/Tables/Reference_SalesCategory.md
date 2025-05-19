#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Reference.SalesCategory

# ![Tables](../../../../Images/Table32.png) [Reference].[SalesCategory]

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
| LowerThreshold | int | 4 | NULL allowed |
| UpperThreshold | int | 4 | NULL allowed |
| CategoryDescription | nvarchar(50) | 100 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Reference].[SalesCategory]
(
[LowerThreshold] [int] NULL,
[UpperThreshold] [int] NULL,
[CategoryDescription] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [Reference](../Security/Schemas/dbo_Reference.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[vw_SalesCategory]](../Views/dbo_vw_SalesCategory.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

