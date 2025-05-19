#### 

[Project](../../../../../../index.md) > [localhost,13001](../../../../../index.md) > [User databases](../../../../index.md) > [PrestigeCars_3NF](../../../index.md) > Programmability > Functions > [Table-valued Functions](Table-valued_Functions.md) > dbo.fn_GetAllSales

# ![Table-valued Functions](../../../../../../Images/Function_Table32.png) [dbo].[fn_GetAllSales]

---

## <a name="#properties"></a>Properties

| Property | Value |
|---|---|
| ANSI Nulls On | YES |
| Quoted Identifier On | YES |


---

## <a name="#sqlscript"></a>SQL Script

```sql
-- Inline Table-Valued Functions (ITVFs)
-- Get all sales from 2015–2018 combined, with an extra column indicating the year
CREATE FUNCTION [dbo].[fn_GetAllSales]()
RETURNS TABLE
AS
RETURN 
(
    SELECT *, 2015 AS SalesYear FROM DataTransfer.Sales2015
    UNION ALL
    SELECT *, 2016 AS SalesYear FROM DataTransfer.Sales2016
    UNION ALL
    SELECT *, 2017 AS SalesYear FROM DataTransfer.Sales2017
    UNION ALL
    SELECT *, 2018 AS SalesYear FROM DataTransfer.Sales2018
);
GO

```


---

## <a name="#uses"></a>Uses

* [[DataTransfer].[Sales2015]](../../../Tables/DataTransfer_Sales2015.md)
* [[DataTransfer].[Sales2016]](../../../Tables/DataTransfer_Sales2016.md)
* [[DataTransfer].[Sales2017]](../../../Tables/DataTransfer_Sales2017.md)
* [[DataTransfer].[Sales2018]](../../../Tables/DataTransfer_Sales2018.md)


---

###### Author:  m3

###### Copyright 2025 - All Rights Reserved

###### Created: Sunday, 18 May 2025 10:09:04 pm

