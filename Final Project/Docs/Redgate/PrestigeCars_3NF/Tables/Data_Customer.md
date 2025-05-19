#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Data.Customer

# ![Tables](../../../../Images/Table32.png) [Data].[Customer]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK__Customer__A4AE64B855121734: CustomerID](../../../../Images/pkcluster.png)](#indexes) | CustomerID | [[dbo].[UDT_CustomerID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CustomerID.md) | 10 | NOT NULL |  |
|  | CustomerName | [[dbo].[UDT_CustomerName]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CustomerName.md) | 300 | NOT NULL | ('') |
|  | Address1 | [[dbo].[UDT_Address]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Address.md) | 100 | NOT NULL | ('') |
|  | Address2 | [[dbo].[UDT_Address]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Address.md) | 100 | NULL allowed | ('') |
|  | Town | [[dbo].[UDT_Address]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Address.md) | 100 | NOT NULL | ('Unknown') |
|  | PostCode | [[dbo].[UDT_CountryISO2]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryISO2.md) | 20 | NOT NULL | ('') |
| [![Foreign Keys FK_Customer_Country: [Reference].[Country].CountryID](../../../../Images/fk.png)](#foreignkeys) | CountryID | [[dbo].[UDT_CountryRef]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryRef.md) | 2 | NOT NULL |  |
|  | IsReseller | [[dbo].[UDT_IsReseller]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_IsReseller.md) | 1 | NOT NULL | ((0)) |
|  | IsCreditRisk | [[dbo].[UDT_IsCreditRisk]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_IsCreditRisk.md) | 1 | NOT NULL | ((0)) |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__Customer__A4AE64B855121734: CustomerID](../../../../Images/pkcluster.png)](#indexes) | PK__Customer__A4AE64B855121734 | CustomerID | YES |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns |
|---|---|
| FK_Customer_Country | CountryID->[[Reference].[Country].[CountryID]](Reference_Country.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Data].[Customer]
(
[CustomerID] [dbo].[UDT_CustomerID] NOT NULL,
[CustomerName] [dbo].[UDT_CustomerName] NOT NULL CONSTRAINT [DF__Customer__Custom__3B75D760] DEFAULT (''),
[Address1] [dbo].[UDT_Address] NOT NULL CONSTRAINT [DF__Customer__Addres__3C69FB99] DEFAULT (''),
[Address2] [dbo].[UDT_Address] NULL CONSTRAINT [DF__Customer__Addres__3D5E1FD2] DEFAULT (''),
[Town] [dbo].[UDT_Address] NOT NULL CONSTRAINT [DF__Customer__Town__3E52440B] DEFAULT ('Unknown'),
[PostCode] [dbo].[UDT_CountryISO2] NOT NULL CONSTRAINT [DF__Customer__PostCo__3F466844] DEFAULT (''),
[CountryID] [dbo].[UDT_CountryRef] NOT NULL,
[IsReseller] [dbo].[UDT_IsReseller] NOT NULL CONSTRAINT [DF__Customer__IsRese__403A8C7D] DEFAULT ((0)),
[IsCreditRisk] [dbo].[UDT_IsCreditRisk] NOT NULL CONSTRAINT [DF__Customer__IsCred__412EB0B6] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Customer] ADD CONSTRAINT [PK__Customer__A4AE64B855121734] PRIMARY KEY CLUSTERED ([CustomerID]) ON [PRIMARY]
GO
ALTER TABLE [Data].[Customer] ADD CONSTRAINT [FK_Customer_Country] FOREIGN KEY ([CountryID]) REFERENCES [Reference].[Country] ([CountryID])
GO

```


---

## <a name="#uses"></a>Uses

* [[Reference].[Country]](Reference_Country.md)
* [[dbo].[UDT_Address]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Address.md)
* [[dbo].[UDT_CountryISO2]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryISO2.md)
* [[dbo].[UDT_CountryRef]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryRef.md)
* [[dbo].[UDT_CustomerID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CustomerID.md)
* [[dbo].[UDT_CustomerName]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CustomerName.md)
* [[dbo].[UDT_IsCreditRisk]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_IsCreditRisk.md)
* [[dbo].[UDT_IsReseller]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_IsReseller.md)
* [Data](../Security/Schemas/dbo_Data.md)


---

## <a name="#usedby"></a>Used By

* [[Data].[Sales]](Data_Sales.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

