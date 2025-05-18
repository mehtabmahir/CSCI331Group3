#### 

[Project](../../../../index.md) > [localhost,13001](../../../index.md) > [User databases](../../index.md) > [PrestigeCars_3NF](../index.md) > [Tables](Tables.md) > Reference.SalesBudgets

# ![Tables](../../../../Images/Table32.png) [Reference].[SalesBudgets]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| Collation | SQL_Latin1_General_CP1_CI_AS |
| Row Count (~) | 0 |
| Created | 5:33:23 pm Sunday, 18 May 2025 |
| Last Modified | 5:33:23 pm Sunday, 18 May 2025 |


---

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Identity |
|---|---|---|---|---|---|
| [![Cluster Primary Key PK__SalesBud__58D699038313CB62: SalesBudgetID](../../../../Images/pkcluster.png)](#indexes) | SalesBudgetID | [[dbo].[UDT_SalesID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalesID.md) | 4 | NOT NULL | 1 - 1 |
| [![Foreign Keys FK_SalesBudgets_Color: [Reference].[Color].ColorID](../../../../Images/fk.png)](#foreignkeys) | ColorID | [[dbo].[UDT_ColorID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ColorID.md) | 2 | NOT NULL |  |
|  | BudgetYear | [[dbo].[UDT_Year]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Year.md) | 4 | NOT NULL |  |
|  | BudgetAmount | [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md) | 9 | NOT NULL |  |


---

## <a name="#indexes"></a>Indexes

| Key | Name | Key Columns | Unique |
|---|---|---|---|
| [![Cluster Primary Key PK__SalesBud__58D699038313CB62: SalesBudgetID](../../../../Images/pkcluster.png)](#indexes) | PK__SalesBud__58D699038313CB62 | SalesBudgetID | YES |


---

## <a name="#foreignkeys"></a>Foreign Keys

| Name | Columns |
|---|---|
| FK_SalesBudgets_Color | ColorID->[[Reference].[Color].[ColorID]](Reference_Color.md) |


---

## <a name="#sqlscript"></a>SQL Script

```sql
CREATE TABLE [Reference].[SalesBudgets]
(
[SalesBudgetID] [dbo].[UDT_SalesID] NOT NULL IDENTITY(1, 1),
[ColorID] [dbo].[UDT_ColorID] NOT NULL,
[BudgetYear] [dbo].[UDT_Year] NOT NULL,
[BudgetAmount] [dbo].[UDT_SalePrice] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Reference].[SalesBudgets] ADD CONSTRAINT [PK__SalesBud__58D699038313CB62] PRIMARY KEY CLUSTERED ([SalesBudgetID]) ON [PRIMARY]
GO
ALTER TABLE [Reference].[SalesBudgets] ADD CONSTRAINT [FK_SalesBudgets_Color] FOREIGN KEY ([ColorID]) REFERENCES [Reference].[Color] ([ColorID])
GO

```


---

## <a name="#uses"></a>Uses

* [[Reference].[Color]](Reference_Color.md)
* [[dbo].[UDT_ColorID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_ColorID.md)
* [[dbo].[UDT_SalePrice]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalePrice.md)
* [[dbo].[UDT_SalesID]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_SalesID.md)
* [[dbo].[UDT_Year]](../Programmability/Types/User-Defined_Data_Types/dbo_UDT_Year.md)
* [Reference](../Security/Schemas/dbo_Reference.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

