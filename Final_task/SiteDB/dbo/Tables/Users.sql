CREATE TABLE [dbo].[Users] (
    [UserID]          INT           IDENTITY (1, 1) NOT NULL,
    [LastName]        NVARCHAR (20) NOT NULL,
    [FirstName]       NVARCHAR (10) NOT NULL,
    [BirthDate]       DATETIME      NULL,
    [RegistationDate] DATETIME      NULL,
    [City]            NVARCHAR (15) NULL,
    [Region]          NVARCHAR (15) NULL,
	[Password]        NVARCHAR (15) NOT NULL,
    [Country]         NVARCHAR (15) NULL,
    [Phone]           NVARCHAR (24) NULL,
    [Photo]           IMAGE         NULL,
    [RoleID]          INT           NULL,
	[Login]			  NVARCHAR (20)  NOT NULL,
	PRIMARY KEY CLUSTERED ([UserID] ASC),														
	FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
);
