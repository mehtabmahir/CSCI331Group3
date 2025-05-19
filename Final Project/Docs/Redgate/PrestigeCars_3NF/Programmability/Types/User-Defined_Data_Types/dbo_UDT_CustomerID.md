#### 

[Project](../../../../../../index.md) > [localhost,13001](../../../../../index.md) > [User databases](../../../../index.md) > [PrestigeCars_3NF](../../../index.md) > Programmability > Types > [User-Defined Data Types](User-Defined_Data_Types.md) > dbo.UDT_CustomerID

# ![User-Defined Data Types](../../../../../../Images/UserDefinedDataType32.png) [dbo].[UDT_CustomerID]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Nullability | NULL allowed |
| Base Type Name | nvarchar |
| Length | 5 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TYPE [dbo].[UDT_CustomerID] FROM nvarchar (5) NULL
GO

```


---

## <a name="#usedby"></a>Used By

* [[Data].[Customer]](../../../Tables/Data_Customer.md)
* [[Data].[Sales]](../../../Tables/Data_Sales.md)
* [[SourceData].[SalesInPounds_Cleaned]](../../../Tables/SourceData_SalesInPounds_Cleaned.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

