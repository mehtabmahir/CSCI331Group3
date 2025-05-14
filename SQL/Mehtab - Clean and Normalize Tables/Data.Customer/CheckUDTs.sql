SELECT
    c.name        AS column_name,
    t.name        AS data_type,      -- will show UDT_CustomerName, UDT_Address, etc.
    t.is_user_defined
FROM sys.columns AS c
JOIN sys.types   AS t ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('[PrestigeCars].[Data].[Customer]')
ORDER BY c.column_id;
