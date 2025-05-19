USE PrestigeCars_3NF
GO

--Author: Mehtab Mahir--

SELECT TOP 10
    co.CountryName       AS CustomerCountry,
    mk.MakeName          AS Make,
    md.ModelName         AS Model,
    st.Cost              AS CostPrice,
    st.RepairsCost       AS RepairsCost,
    st.PartsCost         AS PartsCost,
    st.TransportInCost   AS TransportCost,
    clr.Color            AS VehicleColor,
    sd.SalePrice         AS SalePrice,
    sd.LineItemDiscount  AS Discount,
    sa.InvoiceNumber     AS InvoiceNumber,
    sa.SaleDate          AS SaleDate,
    cs.CustomerName      AS CustomerName,
    sd.SalesDetailsID    AS LineID
FROM Data.SalesDetails AS sd
JOIN Data.Sales     AS sa   ON sd.SalesID = sa.SalesID
JOIN Data.Stock     AS st   ON sd.StockID = st.StockCode
JOIN Data.Model     AS md   ON st.ModelID = md.ModelID
JOIN Data.Make      AS mk   ON md.MakeID = mk.MakeID
JOIN Data.Customer  AS cs   ON sa.CustomerID = cs.CustomerID
JOIN Reference.Country AS co ON cs.CountryID = co.CountryID
JOIN Reference.Color   AS clr ON st.ColorID = clr.ColorID;