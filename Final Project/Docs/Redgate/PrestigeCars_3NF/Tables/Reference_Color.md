#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Reference.Color

# ![Tables](../../../../Images/Table32.png) [Reference].[Color]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 10 |
| Created | 5:33:23 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:40 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK__Color__8DA7676D18F5FC04: ColorID](../../../../Images/pkcluster.png)](#indexes) | ColorID | [[dbo].[UDT_ColorID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ColorID.md) | 2 | NOT NULL | 1 - 1 |
|  | Color | [[dbo].[UDT_Color]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Color.md) | 100 | NOT NULL |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__Color__8DA7676D18F5FC04: ColorID](../../../../Images/pkcluster.png)](#indexes) | PK__Color__8DA7676D18F5FC04 | ColorID | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Reference].[Color]
(
[ColorID] [dbo].[UDT_ColorID] NOT NULL IDENTITY(1, 1),
[Color] [dbo].[UDT_Color] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Reference].[Color] ADD CONSTRAINT [PK__Color__8DA7676D18F5FC04] PRIMARY KEY CLUSTERED ([ColorID]) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[UDT_Color]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Color.md)
* [[dbo].[UDT_ColorID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ColorID.md)
* [Reference](../Security/Schemas/dbo_Reference.md)


---

## <a name="#usedby"></a>Used By

* [[Data].[PivotTable]](Data_PivotTable.md)
* [[Data].[Stock]](Data_Stock.md)
* [[Reference].[SalesBudgets]](Reference_SalesBudgets.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

