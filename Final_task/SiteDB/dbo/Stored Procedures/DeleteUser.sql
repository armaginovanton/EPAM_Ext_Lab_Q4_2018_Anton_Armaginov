﻿CREATE PROCEDURE [dbo].[DeleteUser]
	@ID int
AS 
DELETE FROM dbo.Users
WHERE [UserID] = @ID
IF @@ROWCOUNT = 0 RETURN 1 
ELSE RETURN 0