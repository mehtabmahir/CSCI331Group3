#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Data.PivotTable

# ![Tables](../../../../Images/Table32.png) [Data].[PivotTable]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Row Count (~) | 10 |
| Created | 5:33:40 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:40 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK_PivotTable: ColorID](../../../../Images/pkcluster.png)](#indexes)[![Foreign Keys FK_PivotTable_Color: [Reference].[Color].ColorID](../../../../Images/fk.png)](#foreignkeys) | ColorID | [[dbo].[UDT_ColorID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ColorID.md) | 2 | NOT NULL |
|  | 2015 | [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md) | 9 | NULL allowed |
|  | 2016 | [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md) | 9 | NULL allowed |
|  | 2017 | [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md) | 9 | NULL allowed |
|  | 2018 | [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md) | 9 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK_PivotTable: ColorID](../../../../Images/pkcluster.png)](#indexes) | PK_PivotTable | ColorID | YES |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns |
|---|---|
| FK_PivotTable_Color | ColorID->[[Reference].[Color].[ColorID]](Reference_Color.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Data].[PivotTable]
(
[ColorID] [dbo].[UDT_ColorID] NOT NULL,
[2015] [dbo].[UDT_SalePrice] NULL,
[2016] [dbo].[UDT_SalePrice] NULL,
[2017] [dbo].[UDT_SalePrice] NULL,
[2018] [dbo].[UDT_SalePrice] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[PivotTable] ADD CONSTRAINT [PK_PivotTable] PRIMARY KEY CLUSTERED ([ColorID]) ON [PRIMARY]
GO
ALTER TABLE [Data].[PivotTable] ADD CONSTRAINT [FK_PivotTable_Color] FOREIGN KEY ([ColorID]) REFERENCES [Reference].[Color] ([ColorID])
GO

```


---

## <a name="#uses"></a>Uses

* [[Reference].[Color]](Reference_Color.md)
* [[dbo].[UDT_ColorID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ColorID.md)
* [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md)
* [Data](../Security/Schemas/dbo_Data.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

