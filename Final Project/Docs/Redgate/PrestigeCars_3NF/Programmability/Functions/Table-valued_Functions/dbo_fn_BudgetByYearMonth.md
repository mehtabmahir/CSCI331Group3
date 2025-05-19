#### 

[Project](../../../../../../index.md) > [localhost,13001](../../../../../index.md) > [User databases](../../../../index.md) > [PrestigeCars_3NF](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.fn_BudgetByYearMonth

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[fn_BudgetByYearMonth]

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
| @Year | int | 4 |
| @Month | tinyint | 1 |


---

## <a name="#sqlscript"></a>SQL Script

```sql

-- Get Budget entries by Year and Month
CREATE FUNCTION [dbo].[fn_BudgetByYearMonth](@Year INT, @Month TINYINT)
RETURNS TABLE
AS
RETURN 
(
    SELECT BudgetKey, BudgetValue, Year, Month, BudgetDetail, BudgetElement
    FROM Reference.Budget
    WHERE Year = @Year AND Month = @Month
);
GO

```


---

## <a name="#uses"></a>Uses

* [[Reference].[Budget]](../../../Tables/Reference_Budget.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

