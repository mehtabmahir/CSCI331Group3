#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Views](Views.md) > dbo.vw_SalesCategory

# ![Views](../../../../Images/View32.png) [dbo].[vw_SalesCategory]

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
| LowerThreshold | int | 4 |
| UpperThreshold | int | 4 |
| CategoryDescription | nvarchar(50) | 100 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
-- Views for reference and source tables (simple select aliases)
CREATE VIEW [dbo].[vw_SalesCategory] AS
SELECT LowerThreshold, UpperThreshold, CategoryDescription
FROM Reference.SalesCategory;
GO

```


---

## <a name="#uses"></a>Uses

* [[Reference].[SalesCategory]](../Tables/Reference_SalesCategory.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

