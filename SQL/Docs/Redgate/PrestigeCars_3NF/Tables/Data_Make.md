#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Data.Make

# ![Tables](../../../../Images/Table32.png) [Data].[Make]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 26 |
| Created | 5:33:40 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:40 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK__Make__43646F3131A177F4: MakeID](../../../../Images/pkcluster.png)](#indexes) | MakeID | [[dbo].[UDT_MakeID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_MakeID.md) | 2 | NOT NULL | 1 - 1 |
|  | MakeName | [[dbo].[UDT_MakeName]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_MakeName.md) | 200 | NOT NULL |  |
| [![Foreign Keys FK_Make_Country: [Reference].[Country].CountryID](../../../../Images/fk.png)](#foreignkeys) | CountryID | [[dbo].[UDT_CountryRef]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryRef.md) | 2 | NULL allowed |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__Make__43646F3131A177F4: MakeID](../../../../Images/pkcluster.png)](#indexes) | PK__Make__43646F3131A177F4 | MakeID | YES |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns |
|---|---|
| FK_Make_Country | CountryID->[[Reference].[Country].[CountryID]](Reference_Country.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Data].[Make]
(
[MakeID] [dbo].[UDT_MakeID] NOT NULL IDENTITY(1, 1),
[MakeName] [dbo].[UDT_MakeName] NOT NULL,
[CountryID] [dbo].[UDT_CountryRef] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Make] ADD CONSTRAINT [PK__Make__43646F3131A177F4] PRIMARY KEY CLUSTERED ([MakeID]) ON [PRIMARY]
GO
ALTER TABLE [Data].[Make] ADD CONSTRAINT [FK_Make_Country] FOREIGN KEY ([CountryID]) REFERENCES [Reference].[Country] ([CountryID])
GO

```


---

## <a name="#uses"></a>Uses

* [[Reference].[Country]](Reference_Country.md)
* [[dbo].[UDT_CountryRef]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_CountryRef.md)
* [[dbo].[UDT_MakeID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_MakeID.md)
* [[dbo].[UDT_MakeName]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_MakeName.md)
* [Data](../Security/Schemas/dbo_Data.md)


---

## <a name="#usedby"></a>Used By

* [[Data].[Model]](Data_Model.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

