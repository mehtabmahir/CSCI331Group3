#### 

[Project](../../../../../../index.md) > [localhost,13001](../../../../../index.md) > [User databases](../../../../index.md) > [PrestigeCars_3NF](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.fn_StockPricesByMake

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[fn_StockPricesByMake]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#parameters"></a>Parameters

| Name | Data Type | Max Length (Bytes) |
|---|---|---|
| @MakeName | nvarchar(100) | 200 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

-- Filter StockPrices by Make (returns all model costs for a given make)
CREATE FUNCTION [dbo].[fn_StockPricesByMake](@MakeName NVARCHAR(100))
RETURNS TABLE
AS
RETURN 
(
    SELECT MakeName, ModelName, Cost
    FROM Output.StockPrices
    WHERE MakeName = @MakeName
);
GO

```


---

## <a name="#uses"></a>Uses

* [[Output].[StockPrices]](../../../Tables/Output_StockPrices.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 6:12:50 pm

