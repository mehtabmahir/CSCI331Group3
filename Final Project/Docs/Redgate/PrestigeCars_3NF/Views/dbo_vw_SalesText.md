#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Views](Views.md) > dbo.vw_SalesText

# ![Views](../../../../Images/View32.png) [dbo].[vw_SalesText]

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
| CountryName | nvarchar(150) | 300 |
| MakeName | nvarchar(100) | 200 |
| Cost | varchar(20) | 20 |
| SalePrice | varchar(20) | 20 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [dbo].[vw_SalesText] AS
SELECT CountryName, MakeName, Cost, SalePrice
FROM SourceData.SalesText;
GO

```


---

## <a name="#uses"></a>Uses

* [[SourceData].[SalesText]](../Tables/SourceData_SalesText.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

