#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Reference.MarketingInformation

# ![Tables](../../../../Images/Table32.png) [Reference].[MarketingInformation]

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
| CUST | nvarchar(150) | 300 | NULL allowed |
| Country | nchar(10) | 20 | NULL allowed |
| SpendCapacity | varchar(25) | 25 | NULL allowed |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Reference].[MarketingInformation]
(
[CUST] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpendCapacity] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [Reference](../Security/Schemas/dbo_Reference.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

