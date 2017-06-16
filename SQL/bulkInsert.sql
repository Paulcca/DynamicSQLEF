BULK INSERT test2
FROM 'C:\Users\6100361\Documents\headerTest1.csv'
WITH
(	-- KEEPIDENTITY,
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)




