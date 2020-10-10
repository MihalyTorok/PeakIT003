/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

MERGE INTO SalesLT.ProductModel AS TGT
USING (
    VALUES
    (N'Hard Copy', '20200115')
    ,(N'Software', '20201010')
    ,(N'Service', GETDATE())
    ) AS SRC([Name], [ModifiedDate])
ON TGT.[Name] = SRC.[Name]
WHEN NOT MATCHED THEN 
    INSERT([Name], [ModifiedDate]) 
    VALUES(SRC.[Name], SRC.[ModifiedDate])
WHEN MATCHED THEN UPDATE
    SET TGT.[ModifiedDate] = SRC.[ModifiedDate];
GO

