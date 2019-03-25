SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([RoleID], [Name]) VALUES (1, N'Administrator')
INSERT [dbo].[Roles] ([RoleID], [Name]) VALUES (2, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [Name]) VALUES (3, N'Moderator')
INSERT [dbo].[Roles] ([RoleID], [Name]) VALUES (4, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF;
GO

SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (1 , N'Admin',   N'Admin',    N'Seattle', N'ISMvKXpXpadDiUo', N'11111', 1, N'Admin'  )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (1 , N'Nancy',   N'Davolio',  N'Seattle', N'AxOEHcTqc7KwgQq', N'98122', 2, N'Nancy'  )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (2 , N'James',   N'Frank',    N'Manila',  N'NT9j549KLdRt6DV', N'43530', 3, N'James'  )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (3 , N'Ava',     N'Smith',    N'Ottawa',  N'MfLTMuMBpsL1rTD', N'04530', 3, N'Ava'    )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (4 , N'Lily',    N'Taylor',   N'Ottawa',  N'iLubp3w8IK7zfOa', N'00200', 3, N'Lily'   )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (5 , N'Lewis',   N'Brown',    N'Ottawa',  N'kOzQ1Wts6UiPYoP', N'01100', 3, N'Lewis'  )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (6 , N'Daniel',  N'Williams', N'Manila',  N'kOzQ1Wts6UiPYoP', N'01230', 4, N'Daniel' )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (7 , N'Olivia',  N'Davolio',  N'Ottawa',  N'12aJvn1PiJmBRfg', N'07800', 4, N'Olivia' )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (8 , N'Amelia',  N'Johnson',  N'Riga',    N'zFnLTDFFKKchxQ3', N'99600', 4, N'Amelia' )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (9 , N'Grace',   N'Smith',    N'Chicago', N'AxOEHcTqc7KwgQq', N'01360', 4, N'Grace'  )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (10, N'Albert',  N'Frank',    N'Moscow',  N'zFnLTDFFKKchxQ3', N'01450', 4, N'Albert' )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (12, N'Aglaiy',  N'Johnson',  N'Manila',  N'dLH8auCFdJCkZc7', N'00450', 4, N'Aglaiy' )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (13, N'Evfimiy', N'Davolio',  N'Moscow',  N'12aJvn1PiJmBRfg', N'36300', 4, N'Evfimiy')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (14, N'Ermolay', N'Miller',   N'Manila',  N'zFnLTDFFKKchxQ3', N'03660', 4, N'Ermolay')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (15, N'Kir',     N'Taylor',   N'Dubai',   N'dLH8auCFdJCkZc7', N'00610', 4, N'Kir'    )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (16, N'Riley',   N'Davolio',  N'Chicago', N'dLH8auCFdJCkZc7', N'00160', 4, N'Riley'  )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (17, N'Daniel',  N'Frank',    N'Ottawa',  N'q4EBcMu1iQuEyT6', N'89420', 4, N'Daniel' )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (18, N'Matthew', N'Smith',    N'Manila',  N'q4EBcMu1iQuEyT6', N'07200', 4, N'Matthew')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (19, N'Noah',    N'Williams', N'Dubai',   N'12aJvn1PiJmBRfg', N'04560', 4, N'Noah'   )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (20, N'Sophie',  N'Frank',    N'Chicago', N'ZyMuPSJ9pHXi83E', N'05064', 4, N'Sophie' )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (21, N'Lucy',    N'Johnson',  N'Manila',  N'AxOEHcTqc7KwgQq', N'07140', 4, N'Lucy'   )
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [City], [Password], [Phone], [RoleID], [Login]) VALUES (22, N'Amelia',  N'Davolio',  N'Paris',   N'ZyMuPSJ9pHXi83E', N'25400', 4, N'Amelia' )
SET IDENTITY_INSERT [dbo].[Roles] OFF;																
GO																																																