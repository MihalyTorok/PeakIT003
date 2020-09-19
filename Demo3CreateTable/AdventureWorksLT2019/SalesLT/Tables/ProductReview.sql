CREATE TABLE [dbo].[ProductReview]
(
	[ProductReviewID] INT IDENTITY NOT NULL, 
    [ProductID] INT NOT NULL, 
    [Message] NVARCHAR(255) NULL, 
    [Rating] INT NOT NULL, 
    CONSTRAINT [PK_ProductReview] PRIMARY KEY ([ProductReviewID]), 
    CONSTRAINT [FK_ProductReview_Product] FOREIGN KEY ([ProductID]) REFERENCES SalesLT.Product([ProductID]), 
    CONSTRAINT [CK_ProductReview_Rating] CHECK (Rating BETWEEN 1 AND 5)
)
