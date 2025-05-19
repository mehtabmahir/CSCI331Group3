#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Views](Views.md) > dbo.vw_StaffHierarchy

# ![Views](../../../../Images/View32.png) [dbo].[vw_StaffHierarchy]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Identity |
|---|---|---|---|
| HierarchyReference | hierarchyid | 892 |  |
| StaffID | int | 4 | 0 - 0 |
| StaffName | nvarchar(50) | 100 |  |
| ManagerID | int | 4 |  |
| Department | nvarchar(50) | 100 |  |


---

## <a name="#sqlscript"></a>SQL Script

```sql

CREATE VIEW [dbo].[vw_StaffHierarchy] AS
SELECT HierarchyReference, StaffID, StaffName, ManagerID, Department
FROM Reference.StaffHierarchy;
GO

```


---

## <a name="#uses"></a>Uses

* [[Reference].[StaffHierarchy]](../Tables/Reference_StaffHierarchy.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

