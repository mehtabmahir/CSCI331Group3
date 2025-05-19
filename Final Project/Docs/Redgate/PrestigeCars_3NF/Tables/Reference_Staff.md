#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Reference.Staff

# ![Tables](../../../../Images/Table32.png) [Reference].[Staff]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 13 |
| Created | 5:33:23 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:23 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK__Staff__96D4AAF717115A88: StaffID](../../../../Images/pkcluster.png)](#indexes) | StaffID | int | 4 | NOT NULL | 1 - 1 |
|  | StaffName | nvarchar(50) | 100 | NULL allowed |  |
|  | ManagerID | int | 4 | NULL allowed |  |
|  | Department | nvarchar(50) | 100 | NULL allowed |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__Staff__96D4AAF717115A88: StaffID](../../../../Images/pkcluster.png)](#indexes) | PK__Staff__96D4AAF717115A88 | StaffID | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Reference].[Staff]
(
[StaffID] [int] NOT NULL IDENTITY(1, 1),
[StaffName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ManagerID] [int] NULL,
[Department] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Reference].[Staff] ADD CONSTRAINT [PK__Staff__96D4AAF717115A88] PRIMARY KEY CLUSTERED ([StaffID]) ON [PRIMARY]
GO

```


---

## <a name="#uses"></a>Uses

* [Reference](../Security/Schemas/dbo_Reference.md)


---

## <a name="#usedby"></a>Used By

* [[dbo].[vw_Staff]](../Views/dbo_vw_Staff.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

