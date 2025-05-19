#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Output.StockPrices

# ![Tables](../../../../Images/Table32.png) [Output].[StockPrices]

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
| Cost | money | 8 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Output].[StockPrices]
(
[MakeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModelName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cost] [money] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [Output](../Security/Schemas/dbo_Output.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[fn_StockPricesByMake]](../Programmability/Functions/Table-valued_Functions/dbo_fn_StockPricesByMake.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

