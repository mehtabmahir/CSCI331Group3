#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Data.Sales

# ![Tables](../../../../Images/Table32.png) [Data].[Sales]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability |
|---|---|---|---|---|
| [![Cluster Primary Key PK__Sales__C952FB12FDCE7F4F: SalesID](../../../../Images/pkcluster.png)](#indexes) | SalesID | [[dbo].[UDT_SalesID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalesID.md) | 4 | NOT NULL |
| [![Foreign Keys FK_Sales_Customer: [Data].[Customer].CustomerID](../../../../Images/fk.png)](#foreignkeys) | CustomerID | [[dbo].[UDT_CustomerID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CustomerID.md) | 10 | NOT NULL |
|  | InvoiceNumber | [[dbo].[UDT_InvoiceNumber]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_InvoiceNumber.md) | 8 | NULL allowed |
|  | TotalSalePrice | [[dbo].[UDT_TotalSalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_TotalSalePrice.md) | 9 | NULL allowed |
|  | SaleDate | [[dbo].[UDT_SaleDate]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SaleDate.md) | 8 | NULL allowed |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__Sales__C952FB12FDCE7F4F: SalesID](../../../../Images/pkcluster.png)](#indexes) | PK__Sales__C952FB12FDCE7F4F | SalesID | YES |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns |
|---|---|
| FK_Sales_Customer | CustomerID->[[Data].[Customer].[CustomerID]](Data_Customer.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Data].[Sales]
(
[SalesID] [dbo].[UDT_SalesID] NOT NULL,
[CustomerID] [dbo].[UDT_CustomerID] NOT NULL,
[InvoiceNumber] [dbo].[UDT_InvoiceNumber] NULL,
[TotalSalePrice] [dbo].[UDT_TotalSalePrice] NULL,
[SaleDate] [dbo].[UDT_SaleDate] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Sales] ADD CONSTRAINT [PK__Sales__C952FB12FDCE7F4F] PRIMARY KEY CLUSTERED ([SalesID]) ON [PRIMARY]
GO
ALTER TABLE [Data].[Sales] ADD CONSTRAINT [FK_Sales_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [Data].[Customer] ([CustomerID])
GO

```


---

## <a name="#uses"></a>Uses

* [[Data].[Customer]](Data_Customer.md)
* [[dbo].[UDT_CustomerID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CustomerID.md)
* [[dbo].[UDT_InvoiceNumber]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_InvoiceNumber.md)
* [[dbo].[UDT_SaleDate]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SaleDate.md)
* [[dbo].[UDT_SalesID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalesID.md)
* [[dbo].[UDT_TotalSalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_TotalSalePrice.md)
* [Data](../Security/Schemas/dbo_Data.md)


---

## <a name="#usedby"></a>Used By

* [[Data].[SalesDetails]](Data_SalesDetails.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

