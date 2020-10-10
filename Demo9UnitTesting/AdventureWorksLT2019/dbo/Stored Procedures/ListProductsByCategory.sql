
CREATE PROCEDURE ListProductsByCategory 
	@productCategoryID INT
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		[ProductID]
		,[Name] 
		,[ProductNumber]
		,[Color]
		,[StandardCost]
		,[ListPrice]
		,[Size]
		,[Weight] 
		,[ProductCategoryID] 
		,[ProductModelID]
		,[SellStartDate]
		,[SellEndDate]
		,[DiscontinuedDate] 
		,[ThumbNailPhoto] 
		,[ThumbnailPhotoFileName] 
		,[rowguid] 
		,[ModifiedDate]
	FROM SalesLT.Product
	WHERE ProductCategoryID = @productCategoryID;

END