#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Reference.Forex

# ![Tables](../../../../Images/Table32.png) [Reference].[Forex]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Heap | YES |
| Row Count (~) | 1461 |
| Created | 5:33:23 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:23 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|
| ExchangeDate | date | 3 | NULL allowed |
| ISOCurrency | char(3) | 3 | NULL allowed |
| ExchangeRate | money | 8 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Reference].[Forex]
(
[ExchangeDate] [date] NULL,
[ISOCurrency] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExchangeRate] [money] NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [Reference](../Security/Schemas/dbo_Reference.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

