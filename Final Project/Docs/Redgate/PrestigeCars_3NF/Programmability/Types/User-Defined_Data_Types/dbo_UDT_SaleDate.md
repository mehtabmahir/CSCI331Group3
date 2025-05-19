#### 

[Project](../../../../../../index.md) > [localhost,13001](../../../../../index.md) > [User databases](../../../../index.md) > [PrestigeCars_3NF](../../../index.md) > Programmability > Types > [User-Defined Data Types](User-Defined_Data_Types.md) > dbo.UDT_SaleDate

# ![User-Defined Data Types](../../../../../../Images/UserDefinedDataType32.png) [dbo].[UDT_SaleDate]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Nullability | NULL allowed |
| Base Type Name | datetime |
| Length | 8 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TYPE [dbo].[UDT_SaleDate] FROM datetime NULL
GO

```


---

## <a name="#usedby"></a>Used By

* [[Data].[Sales]](../../../Tables/Data_Sales.md)
* [[SourceData].[SalesInPounds_Cleaned]](../../../Tables/SourceData_SalesInPounds_Cleaned.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

