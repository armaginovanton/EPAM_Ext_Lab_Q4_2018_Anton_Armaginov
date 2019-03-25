CREATE PROCEDURE [dbo].[GetFile]
	@ID int
AS 
SELECT  
	[FileID],
	[UserID],
	[Reference],
	[Name]
FROM [dbo].[Files]
WHERE [FileID] = @ID