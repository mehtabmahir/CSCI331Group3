/* CheckBlanks.sql */
/* Author: Mehtab Mahir */
USE PrestigeCars;
GO
SELECT
    SUM(CASE WHEN Cost            IS NULL THEN 1 ELSE 0 END) AS blank_cost,
    SUM(CASE WHEN RepairsCost     IS NULL THEN 1 ELSE 0 END) AS blank_repairs,
    SUM(CASE WHEN PartsCost       IS NULL THEN 1 ELSE 0 END) AS blank_parts,
    SUM(CASE WHEN TransportInCost IS NULL THEN 1 ELSE 0 END) AS blank_transport,
    SUM(CASE WHEN IsRHD           IS NULL THEN 1 ELSE 0 END) AS blank_isrhd,
    SUM(CASE WHEN Color           IS NULL OR Color = N'' THEN 1 ELSE 0 END) AS blank_color,
    SUM(CASE WHEN BuyerComments   IS NULL OR BuyerComments = N'' THEN 1 ELSE 0 END) AS blank_buyercomments,
    SUM(CASE WHEN DateBought      IS NULL THEN 1 ELSE 0 END) AS blank_datebought,
    SUM(CASE WHEN TimeBought      IS NULL THEN 1 ELSE 0 END) AS blank_timebought
FROM [PrestigeCars].[Data].[Stock];
