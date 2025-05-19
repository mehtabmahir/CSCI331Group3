#### 

[Project](../../../../../../index.md) > [localhost,13001](../../../../../index.md) > [User databases](../../../../index.md) > [PrestigeCars_3NF](../../../index.md) > Programmability > Types > [User-Defined Data Types](User-Defined_Data_Types.md) > dbo.UDT_StockCode

# ![User-Defined Data Types](../../../../../../Images/UserDefinedDataType32.png) [dbo].[UDT_StockCode]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Nullability | NULL allowed |
| Base Type Name | nvarchar |
| Length | 50 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TYPE [dbo].[UDT_StockCode] FROM nvarchar (50) NULL
GO

```


---

## <a name="#usedby"></a>Used By

* [[Data].[SalesDetails]](../../../Tables/Data_SalesDetails.md)
* [[Data].[Stock]](../../../Tables/Data_Stock.md)
* [[SourceData].[SalesInPounds_Cleaned]](../../../Tables/SourceData_SalesInPounds_Cleaned.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

