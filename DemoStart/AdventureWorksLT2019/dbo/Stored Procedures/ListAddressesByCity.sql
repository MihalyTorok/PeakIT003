CREATE PROCEDURE [dbo].[ListAddressesByCity]
	@city NVARCHAR (30)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		[AddressID]  
		,[AddressLine1]
		,[AddressLine2]
		,[City]        
		,[StateProvince]
		,[CountryRegion]
		,[PostalCode]  
		,[rowguid]     
		,[ModifiedDate]
	FROM SalesLT.[Address]
	WHERE City = @city;

END

