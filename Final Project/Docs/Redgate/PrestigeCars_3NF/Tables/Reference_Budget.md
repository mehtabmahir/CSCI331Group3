#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Reference.Budget

# ![Tables](../../../../Images/Table32.png) [Reference].[Budget]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 235 |
| Created | 5:33:23 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:23 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK__Budget__FE758E37B8D256FE: BudgetKey](../../../../Images/pkcluster.png)](#indexes) | BudgetKey | int | 4 | NOT NULL | 1 - 1 |
|  | BudgetValue | money | 8 | NULL allowed |  |
|  | Year | int | 4 | NULL allowed |  |
|  | Month | tinyint | 1 | NULL allowed |  |
|  | BudgetDetail | nvarchar(50) | 100 | NULL allowed |  |
|  | BudgetElement | nvarchar(50) | 100 | NULL allowed |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__Budget__FE758E37B8D256FE: BudgetKey](../../../../Images/pkcluster.png)](#indexes) | PK__Budget__FE758E37B8D256FE | BudgetKey | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Reference].[Budget]
(
[BudgetKey] [int] NOT NULL IDENTITY(1, 1),
[BudgetValue] [money] NULL,
[Year] [int] NULL,
[Month] [tinyint] NULL,
[BudgetDetail] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BudgetElement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Reference].[Budget] ADD CONSTRAINT [PK__Budget__FE758E37B8D256FE] PRIMARY KEY CLUSTERED ([BudgetKey]) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [Reference](../Security/Schemas/dbo_Reference.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[fn_BudgetByYearMonth]](../Programmability/Functions/Table-valued_Functions/dbo_fn_BudgetByYearMonth.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

