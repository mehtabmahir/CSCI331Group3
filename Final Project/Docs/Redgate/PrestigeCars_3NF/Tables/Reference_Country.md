#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Reference.Country

# ![Tables](../../../../Images/Table32.png) [Reference].[Country]

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
| [![Cluster Primary Key PK__Country__10D160BFFBA27078: CountryID](../../../../Images/pkcluster.png)](#indexes) | CountryID | [[dbo].[UDT_CountryID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryID.md) | 2 | NOT NULL | 1 - 1 |
|  | CountryName | [[dbo].[UDT_CountryName]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryName.md) | 300 | NOT NULL |  |
|  | CountryISO2 | [[dbo].[UDT_CountryISO2]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryISO2.md) | 20 | NOT NULL |  |
|  | CountryISO3 | [[dbo].[UDT_CountryISO3]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryISO3.md) | 20 | NULL allowed |  |
|  | SalesRegion | [[dbo].[UDT_Region]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Region.md) | 40 | NULL allowed |  |
|  | CountryFlag | varbinary(max) | max | NULL allowed |  |
|  | FlagFileName | nvarchar(50) | 100 | NULL allowed |  |
|  | FlagFileType | nchar(3) | 6 | NULL allowed |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__Country__10D160BFFBA27078: CountryID](../../../../Images/pkcluster.png)](#indexes) | PK__Country__10D160BFFBA27078 | CountryID | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Reference].[Country]
(
[CountryID] [dbo].[UDT_CountryID] NOT NULL IDENTITY(1, 1),
[CountryName] [dbo].[UDT_CountryName] NOT NULL,
[CountryISO2] [dbo].[UDT_CountryISO2] NOT NULL,
[CountryISO3] [dbo].[UDT_CountryISO3] NULL,
[SalesRegion] [dbo].[UDT_Region] NULL,
[CountryFlag] [varbinary] (max) NULL,
[FlagFileName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FlagFileType] [nchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Reference].[Country] ADD CONSTRAINT [PK__Country__10D160BFFBA27078] PRIMARY KEY CLUSTERED ([CountryID]) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [[dbo].[UDT_CountryID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryID.md)
* [[dbo].[UDT_CountryISO2]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryISO2.md)
* [[dbo].[UDT_CountryISO3]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryISO3.md)
* [[dbo].[UDT_CountryName]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryName.md)
* [[dbo].[UDT_Region]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Region.md)
* [Reference](../Security/Schemas/dbo_Reference.md)


---

## <a name="#usedby"></a>Used By

* [[Data].[Customer]](Data_Customer.md)
* [[Data].[Make]](Data_Make.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

