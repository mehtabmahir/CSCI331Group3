#### 

[Project](../../../../../../index.md) > [localhost,13001](../../../../../index.md) > [User databases](../../../../index.md) > [PrestigeCars_3NF](../../../index.md) > Programmability > Types > [User-Defined Data Types](User-Defined_Data_Types.md) > dbo.UDT_ColorID

# ![User-Defined Data Types](../../../../../../Images/UserDefinedDataType32.png) [dbo].[UDT_ColorID]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Nullability | NULL allowed |
| Base Type Name | smallint |
| Length | 2 |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TYPE [dbo].[UDT_ColorID] FROM smallint NULL
GO

```


---

## <a name="#usedby"></a>Used By

* [[Data].[PivotTable]](../../../Tables/Data_PivotTable.md)
* [[Data].[Stock]](../../../Tables/Data_Stock.md)
* [[Reference].[Color]](../../../Tables/Reference_Color.md)
* [[Reference].[SalesBudgets]](../../../Tables/Reference_SalesBudgets.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

