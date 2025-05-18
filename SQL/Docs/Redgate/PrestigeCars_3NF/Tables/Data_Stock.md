#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Data.Stock

# ![Tables](../../../../Images/Table32.png) [Data].[Stock]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 391 |
| Created | 5:33:40 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:40 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK__Stock__28E08C965DB3E795: StockCode](../../../../Images/pkcluster.png)](#indexes) | StockCode | [[dbo].[UDT_StockCode]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_StockCode.md) | 100 | NOT NULL |  |
| [![Foreign Keys FK_Stock_Model: [Data].[Model].ModelID](../../../../Images/fk.png)](#foreignkeys) | ModelID | [[dbo].[UDT_ModelID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ModelID.md) | 2 | NOT NULL |  |
|  | Cost | [[dbo].[UDT_Cost]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Cost.md) | 8 | NULL allowed | ((0)) |
|  | RepairsCost | [[dbo].[UDT_RepairsCost]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_RepairsCost.md) | 8 | NULL allowed | ((0)) |
|  | PartsCost | [[dbo].[UDT_PartsCost]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_PartsCost.md) | 8 | NULL allowed | ((0)) |
|  | TransportInCost | [[dbo].[UDT_TransportCost]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_TransportCost.md) | 8 | NULL allowed | ((0)) |
|  | IsRHD | [[dbo].[UDT_IsRHD]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_IsRHD.md) | 1 | NOT NULL | ((0)) |
| [![Foreign Keys FK_Stock_Color: [Reference].[Color].ColorID](../../../../Images/fk.png)](#foreignkeys) | ColorID | [[dbo].[UDT_ColorID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ColorID.md) | 2 | NULL allowed |  |
|  | BuyerComments | [[dbo].[UDT_BuyerComments]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_BuyerComments.md) | 8000 | NULL allowed |  |
|  | DateBought | [[dbo].[UDT_DateBought]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_DateBought.md) | 3 | NULL allowed |  |
|  | TimeBought | [[dbo].[UDT_TimeBought]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_TimeBought.md) | 5 | NULL allowed |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__Stock__28E08C965DB3E795: StockCode](../../../../Images/pkcluster.png)](#indexes) | PK__Stock__28E08C965DB3E795 | StockCode | YES |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns |
|---|---|
| FK_Stock_Color | ColorID->[[Reference].[Color].[ColorID]](Reference_Color.md) |
| FK_Stock_Model | ModelID->[[Data].[Model].[ModelID]](Data_Model.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Data].[Stock]
(
[StockCode] [dbo].[UDT_StockCode] NOT NULL,
[ModelID] [dbo].[UDT_ModelID] NOT NULL,
[Cost] [dbo].[UDT_Cost] NULL CONSTRAINT [DF__Stock__Cost__44FF419A] DEFAULT ((0)),
[RepairsCost] [dbo].[UDT_RepairsCost] NULL CONSTRAINT [DF__Stock__RepairsCo__45F365D3] DEFAULT ((0)),
[PartsCost] [dbo].[UDT_PartsCost] NULL CONSTRAINT [DF__Stock__PartsCost__46E78A0C] DEFAULT ((0)),
[TransportInCost] [dbo].[UDT_TransportCost] NULL CONSTRAINT [DF__Stock__Transport__47DBAE45] DEFAULT ((0)),
[IsRHD] [dbo].[UDT_IsRHD] NOT NULL CONSTRAINT [DF__Stock__IsRHD__48CFD27E] DEFAULT ((0)),
[ColorID] [dbo].[UDT_ColorID] NULL,
[BuyerComments] [dbo].[UDT_BuyerComments] NULL,
[DateBought] [dbo].[UDT_DateBought] NULL,
[TimeBought] [dbo].[UDT_TimeBought] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Stock] ADD CONSTRAINT [PK__Stock__28E08C965DB3E795] PRIMARY KEY CLUSTERED ([StockCode]) ON [PRIMARY]
GO
ALTER TABLE [Data].[Stock] ADD CONSTRAINT [FK_Stock_Color] FOREIGN KEY ([ColorID]) REFERENCES [Reference].[Color] ([ColorID])
GO
ALTER TABLE [Data].[Stock] ADD CONSTRAINT [FK_Stock_Model] FOREIGN KEY ([ModelID]) REFERENCES [Data].[Model] ([ModelID])
GO

```


---

## <a name="#uses"></a>Uses

* [[Data].[Model]](Data_Model.md)
* [[Reference].[Color]](Reference_Color.md)
* [[dbo].[UDT_BuyerComments]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_BuyerComments.md)
* [[dbo].[UDT_ColorID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ColorID.md)
* [[dbo].[UDT_Cost]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Cost.md)
* [[dbo].[UDT_DateBought]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_DateBought.md)
* [[dbo].[UDT_IsRHD]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_IsRHD.md)
* [[dbo].[UDT_ModelID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ModelID.md)
* [[dbo].[UDT_PartsCost]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_PartsCost.md)
* [[dbo].[UDT_RepairsCost]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_RepairsCost.md)
* [[dbo].[UDT_StockCode]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_StockCode.md)
* [[dbo].[UDT_TimeBought]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_TimeBought.md)
* [[dbo].[UDT_TransportCost]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_TransportCost.md)
* [Data](../Security/Schemas/dbo_Data.md)


---

## <a name="#usedby"></a>Used By

* [[Data].[SalesDetails]](Data_SalesDetails.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

