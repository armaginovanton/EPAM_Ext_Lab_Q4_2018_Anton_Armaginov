CREATE TABLE [dbo].[Files] (
    [FileID]    INT            IDENTITY (1, 1) NOT NULL,
    [UserID]    INT            NULL,
    [Reference] NVARCHAR (255) NOT NULL,
    [Name]      NVARCHAR (50)  NOT NULL,
    [Size]      INT            NULL,
    [DateLoad]  DATETIME       NULL,
    [Type]      NVARCHAR (20)  NULL,
    [Extention] NVARCHAR (20)  NULL
	PRIMARY KEY CLUSTERED ([FileID] ASC),	
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID])
);