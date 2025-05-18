USE PrestigeCars

-- Re-run sanity check (ELSE 0 forces explicit zeros)
SELECT
    SUM(CASE WHEN CustomerName IS NULL OR CustomerName = N'' THEN 1 ELSE 0 END) AS blank_name,
    SUM(CASE WHEN Address1     IS NULL OR Address1     = N'' THEN 1 ELSE 0 END) AS blank_addr1,
    SUM(CASE WHEN Town         IS NULL OR Town         = N'' THEN 1 ELSE 0 END) AS blank_town,
    SUM(CASE WHEN PostCode     IS NULL OR PostCode     = N'' THEN 1 ELSE 0 END) AS blank_postcode,
    SUM(CASE WHEN Country      IS NULL OR Country      = N'' THEN 1 ELSE 0 END) AS blank_country,
    SUM(CASE WHEN IsReseller   IS NULL OR IsReseller  NOT IN (0,1) THEN 1 ELSE 0 END) AS bad_reseller,
    SUM(CASE WHEN IsCreditRisk IS NULL OR IsCreditRisk NOT IN (0,1) THEN 1 ELSE 0 END) AS bad_credit
FROM [PrestigeCars].[Data].[Customer];

