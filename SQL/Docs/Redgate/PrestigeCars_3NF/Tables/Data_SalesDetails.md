#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Data.SalesDetails

# ![Tables](../../../../Images/Table32.png) [Data].[SalesDetails]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 348 |
| Created | 5:33:40 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:40 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity | Default |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK__SalesDet__FE1B9A2589DA7CFF: SalesDetailsID](../../../../Images/pkcluster.png)](#indexes) | SalesDetailsID | [[dbo].[UDT_SalesDetailsID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalesDetailsID.md) | 4 | NOT NULL | 1 - 1 |  |
| [![Foreign Keys FK_SalesDetails_Sales: [Data].[Sales].SalesID](../../../../Images/fk.png)](#foreignkeys) | SalesID | [[dbo].[UDT_SalesID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalesID.md) | 4 | NOT NULL |  |  |
|  | LineItemNumber | [[dbo].[UDT_LineItemNumber]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_LineItemNumber.md) | 1 | NOT NULL |  |  |
| [![Foreign Keys FK_SalesDetails_Stock: [Data].[Stock].StockID](../../../../Images/fk.png)](#foreignkeys) | StockID | [[dbo].[UDT_StockCode]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_StockCode.md) | 100 | NOT NULL |  |  |
|  | SalePrice | [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md) | 9 | NULL allowed |  | ((0)) |
|  | LineItemDiscount | [[dbo].[UDT_LineItemDiscount]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_LineItemDiscount.md) | 9 | NULL allowed |  | ((0)) |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__SalesDet__FE1B9A2589DA7CFF: SalesDetailsID](../../../../Images/pkcluster.png)](#indexes) | PK__SalesDet__FE1B9A2589DA7CFF | SalesDetailsID | YES |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns |
|---|---|
| FK_SalesDetails_Sales | SalesID->[[Data].[Sales].[SalesID]](Data_Sales.md) |
| FK_SalesDetails_Stock | StockID->[[Data].[Stock].[StockCode]](Data_Stock.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Data].[SalesDetails]
(
[SalesDetailsID] [dbo].[UDT_SalesDetailsID] NOT NULL IDENTITY(1, 1),
[SalesID] [dbo].[UDT_SalesID] NOT NULL,
[LineItemNumber] [dbo].[UDT_LineItemNumber] NOT NULL,
[StockID] [dbo].[UDT_StockCode] NOT NULL,
[SalePrice] [dbo].[UDT_SalePrice] NULL CONSTRAINT [DF__SalesDeta__SaleP__5070F446] DEFAULT ((0)),
[LineItemDiscount] [dbo].[UDT_LineItemDiscount] NULL CONSTRAINT [DF__SalesDeta__LineI__5165187F] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [Data].[SalesDetails] ADD CONSTRAINT [PK__SalesDet__FE1B9A2589DA7CFF] PRIMARY KEY CLUSTERED ([SalesDetailsID]) ON [PRIMARY]
GO
ALTER TABLE [Data].[SalesDetails] ADD CONSTRAINT [FK_SalesDetails_Sales] FOREIGN KEY ([SalesID]) REFERENCES [Data].[Sales] ([SalesID])
GO
ALTER TABLE [Data].[SalesDetails] ADD CONSTRAINT [FK_SalesDetails_Stock] FOREIGN KEY ([StockID]) REFERENCES [Data].[Stock] ([StockCode])
GO

```


---

## <a name="#uses"></a>Uses

* [[Data].[Sales]](Data_Sales.md)
* [[Data].[Stock]](Data_Stock.md)
* [[dbo].[UDT_LineItemDiscount]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_LineItemDiscount.md)
* [[dbo].[UDT_LineItemNumber]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_LineItemNumber.md)
* [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md)
* [[dbo].[UDT_SalesDetailsID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalesDetailsID.md)
* [[dbo].[UDT_SalesID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalesID.md)
* [[dbo].[UDT_StockCode]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_StockCode.md)
* [Data](../Security/Schemas/dbo_Data.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

