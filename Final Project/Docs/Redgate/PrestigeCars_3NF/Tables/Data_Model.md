#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Data.Model

# ![Tables](../../../../Images/Table32.png) [Data].[Model]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK__Model__E8D7A1CCC07749D2: ModelID](../../../../Images/pkcluster.png)](#indexes) | ModelID | [[dbo].[UDT_ModelID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ModelID.md) | 2 | NOT NULL | 1 - 1 |
| [![Foreign Keys FK_Model_Make: [Data].[Make].MakeID](../../../../Images/fk.png)](#foreignkeys) | MakeID | [[dbo].[UDT_MakeID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_MakeID.md) | 2 | NOT NULL |  |
|  | ModelName | [[dbo].[UDT_ModelName]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ModelName.md) | 300 | NOT NULL |  |
|  | ModelVariant | [[dbo].[UDT_ModelVariant]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ModelVariant.md) | 300 | NULL allowed |  |
|  | YearFirstProduced | [[dbo].[UDT_Year]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Year.md) | 4 | NULL allowed |  |
|  | YearLastProduced | [[dbo].[UDT_Year]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Year.md) | 4 | NULL allowed |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__Model__E8D7A1CCC07749D2: ModelID](../../../../Images/pkcluster.png)](#indexes) | PK__Model__E8D7A1CCC07749D2 | ModelID | YES |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns |
|---|---|
| FK_Model_Make | MakeID->[[Data].[Make].[MakeID]](Data_Make.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Data].[Model]
(
[ModelID] [dbo].[UDT_ModelID] NOT NULL IDENTITY(1, 1),
[MakeID] [dbo].[UDT_MakeID] NOT NULL,
[ModelName] [dbo].[UDT_ModelName] NOT NULL,
[ModelVariant] [dbo].[UDT_ModelVariant] NULL,
[YearFirstProduced] [dbo].[UDT_Year] NULL,
[YearLastProduced] [dbo].[UDT_Year] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Model] ADD CONSTRAINT [PK__Model__E8D7A1CCC07749D2] PRIMARY KEY CLUSTERED ([ModelID]) ON [PRIMARY]
GO
ALTER TABLE [Data].[Model] ADD CONSTRAINT [FK_Model_Make] FOREIGN KEY ([MakeID]) REFERENCES [Data].[Make] ([MakeID])
GO

```


---

## <a name="#uses"></a>Uses

* [[Data].[Make]](Data_Make.md)
* [[dbo].[UDT_MakeID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_MakeID.md)
* [[dbo].[UDT_ModelID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ModelID.md)
* [[dbo].[UDT_ModelName]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ModelName.md)
* [[dbo].[UDT_ModelVariant]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ModelVariant.md)
* [[dbo].[UDT_Year]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Year.md)
* [Data](../Security/Schemas/dbo_Data.md)


---

## <a name="#usedby"></a>Used By

* [[Data].[Stock]](Data_Stock.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

